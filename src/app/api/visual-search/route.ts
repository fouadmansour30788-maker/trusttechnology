import { NextResponse } from 'next/server'
import { getProducts } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'
export const maxDuration = 60

const GEMINI_KEY = process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY
const MODEL = 'gemini-2.5-flash'
const MAX_IMAGE_BYTES = 6_000_000 // base64 length; client downscales well below this

/** Photo of a device/part → identify it and match against the live catalog, or flag it as a repair case. */
export async function POST(req: Request) {
  if (!GEMINI_KEY) return NextResponse.json({ error: 'notConfigured' }, { status: 503 })

  let body: { imageBase64?: string; mimeType?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  const imageBase64 = (body.imageBase64 ?? '').replace(/^data:[^;]+;base64,/, '')
  const mimeType = body.mimeType && /^image\/(jpeg|jpg|png|webp)$/.test(body.mimeType) ? body.mimeType : 'image/jpeg'
  if (!imageBase64 || imageBase64.length > MAX_IMAGE_BYTES) {
    return NextResponse.json({ error: 'Please attach a single photo (under a few MB).' }, { status: 400 })
  }

  const all = await getProducts()
  const priced = all.filter((p) => p.is_active)
  const catalog = priced.map((p) => {
    const brand = p.tags?.find((t) => t.type === 'brand')?.name ?? ''
    const specs = Object.entries(p.specs ?? {}).slice(0, 3).map(([k, v]) => `${k}:${v}`).join(', ')
    return `${p.slug} | ${p.name} | ${brand} | ${p.primary_category_id} | ${specs}`
  }).join('\n')

  const prompt = `You are a product-identification assistant for Trust Technology, a tech store in Tripoli, Lebanon.

A customer uploaded a photo. Identify what device, computer part, or accessory it shows (brand/model if visible or inferable). Note whether it looks visibly damaged (cracked screen, broken casing, liquid damage, burnt components, etc.) or just a normal product photo.

Then match it against OUR catalog below by category/brand/type — only include items that are plausibly the same kind of product (don't force a match if nothing fits).

Return JSON:
{"description": "<one or two sentence description of what's in the photo>", "damaged": <boolean>, "matches": [{"slug": "<exact catalog slug>", "reason": "<short reason it matches>"}]}
0–4 matches. If the photo isn't a device/tech product at all, return matches: [] and describe what you actually see.

CATALOG (slug | name | brand | category | specs):
${catalog}`

  try {
    const gemBody = JSON.stringify({
      contents: [{
        role: 'user',
        parts: [{ inlineData: { mimeType, data: imageBase64 } }, { text: prompt }],
      }],
      generationConfig: {
        temperature: 0.3,
        maxOutputTokens: 800,
        responseMimeType: 'application/json',
        thinkingConfig: { thinkingBudget: 0 },
      },
    })
    const url = `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${GEMINI_KEY}`
    let res: Response | null = null
    for (let attempt = 0; attempt < 3; attempt++) {
      res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: gemBody })
      if (res.ok || ![429, 500, 502, 503, 529].includes(res.status) || attempt === 2) break
      await new Promise((r) => setTimeout(r, 700 * (attempt + 1)))
    }
    if (!res || !res.ok) return NextResponse.json({ error: 'ai' }, { status: 502 })

    const data = await res.json()
    const text: string = data?.candidates?.[0]?.content?.parts?.map((p: { text?: string }) => p.text ?? '').join('') ?? '{}'
    const parsed = JSON.parse(text) as { description?: string; damaged?: boolean; matches?: { slug?: string; reason?: string }[] }

    const seen = new Set<string>()
    const matches: { product: (typeof priced)[number]; reason: string }[] = []
    for (const m of parsed.matches ?? []) {
      const p = m.slug ? priced.find((x) => x.slug === m.slug) : undefined
      if (!p || seen.has(p.slug)) continue
      seen.add(p.slug)
      matches.push({ product: p, reason: String(m.reason ?? '').slice(0, 200) })
      if (matches.length >= 4) break
    }

    return NextResponse.json({
      ok: true,
      description: String(parsed.description ?? '').slice(0, 400),
      damaged: Boolean(parsed.damaged),
      matches,
    })
  } catch {
    return NextResponse.json({ error: 'ai' }, { status: 502 })
  }
}
