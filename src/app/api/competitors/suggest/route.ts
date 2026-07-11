import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { getUnmatchedItems } from '@/lib/competitors'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'
export const maxDuration = 60

const GEMINI_KEY = process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY
const MODEL = 'gemini-2.5-flash'

/** AI-suggested matches between unmatched competitor listings and our catalog. */
export async function POST() {
  if (!isSupabaseConfigured()) return NextResponse.json({ error: 'supabase not configured' }, { status: 500 })
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  if (!GEMINI_KEY) return NextResponse.json({ notConfigured: 'gemini', suggestions: [] })

  const [items, { data: prodData }] = await Promise.all([
    getUnmatchedItems(supabase, 250),
    supabase.from('products').select('id, name, sku, price'),
  ])
  const products = ((prodData as { id: string; name: string; sku: string | null; price: number }[]) ?? [])
  if (items.length === 0 || products.length === 0) return NextResponse.json({ suggestions: [] })

  const productLines = products.map((p) => `${p.id} | ${p.name}${p.sku ? ` | SKU ${p.sku}` : ''}`).join('\n')
  const itemLines = items.map((it) => `${it.competitor}:${it.external_id} | ${it.name}`).join('\n')

  const prompt = `You match retail listings between two tech stores in Lebanon.

OUR CATALOG (one per line: product_id | name | optional SKU):
${productLines}

COMPETITOR LISTINGS (one per line: listing_key | name):
${itemLines}

Return a JSON array of matches where the competitor listing is the SAME product model as one of ours (same model number / identical spec configuration). Only include pairs you are confident about — matching brand and product line alone is NOT enough. At most 40 matches.
Each element: {"item": "<listing_key>", "product": "<product_id>", "confidence": "high" | "medium"}
Return [] if none.`

  try {
    const res = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${GEMINI_KEY}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          contents: [{ role: 'user', parts: [{ text: prompt }] }],
          generationConfig: {
            temperature: 0,
            maxOutputTokens: 4000,
            responseMimeType: 'application/json',
            thinkingConfig: { thinkingBudget: 0 },
          },
        }),
      }
    )
    if (!res.ok) return NextResponse.json({ error: 'ai', suggestions: [] })
    const json = await res.json()
    const text: string = json?.candidates?.[0]?.content?.parts?.map((p: { text?: string }) => p.text ?? '').join('') ?? '[]'
    let raw: { item?: string; product?: string; confidence?: string }[] = []
    try { raw = JSON.parse(text) } catch { raw = [] }

    const itemByKey = new Map(items.map((it) => [`${it.competitor}:${it.external_id}`, it]))
    const productById = new Map(products.map((p) => [p.id, p]))
    const seen = new Set<string>()
    const suggestions = []
    for (const s of Array.isArray(raw) ? raw : []) {
      const it = s.item ? itemByKey.get(s.item) : undefined
      const p = s.product ? productById.get(s.product) : undefined
      if (!it || !p || seen.has(s.item!)) continue
      seen.add(s.item!)
      suggestions.push({
        competitor: it.competitor,
        external_id: it.external_id,
        itemName: it.name,
        itemPrice: it.price,
        url: it.url,
        productId: p.id,
        productName: p.name,
        ourPrice: Number(p.price),
        confidence: s.confidence === 'high' ? 'high' : 'medium',
      })
    }
    return NextResponse.json({ suggestions })
  } catch {
    return NextResponse.json({ error: 'ai', suggestions: [] })
  }
}
