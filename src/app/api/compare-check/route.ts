import { NextResponse } from 'next/server'
import { getProducts } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const GEMINI_KEY = process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY
const MODEL = 'gemini-2.5-flash'

/** Compare 2–3 products for a stated use case and recommend the best fit. */
export async function POST(req: Request) {
  if (!GEMINI_KEY) return NextResponse.json({ error: 'notConfigured' }, { status: 503 })

  let body: { slugs?: string[]; useCase?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  const useCase = (body.useCase ?? '').trim()
  const slugs = [...new Set((body.slugs ?? []).filter((s) => typeof s === 'string'))].slice(0, 3)
  if (slugs.length < 2) return NextResponse.json({ error: 'Add at least 2 products to compare.' }, { status: 400 })
  if (useCase.length < 3 || useCase.length > 200) {
    return NextResponse.json({ error: 'Tell us in a few words what you’ll use it for.' }, { status: 400 })
  }

  const all = await getProducts()
  const products = slugs.map((s) => all.find((p) => p.slug === s)).filter(Boolean) as typeof all
  if (products.length < 2) return NextResponse.json({ error: 'invalid' }, { status: 404 })

  const catalogText = products.map((p) => {
    const price = p.priceOnRequest || p.price === 0 ? 'call-for-price' : `$${p.price}`
    return `SLUG: ${p.slug}\nNAME: ${p.name}\nPRICE: ${price}\nSPECS: ${JSON.stringify(p.specs ?? {})}\nSTOCK: ${p.stock > 0 ? 'in stock' : 'out of stock'}`
  }).join('\n\n')

  const prompt = `You are a friendly, honest tech-shop expert in Lebanon helping a customer choose between ${products.length} products they are comparing.

PRODUCTS:
${catalogText}

The customer says they need it for: "${useCase}"

Judge each product against that specific use case using its real specs and price. Pick the single best fit — factor in value for money, not just raw specs (a cheaper product that comfortably covers the use case beats an overpriced one for the same need). Ties are fine to call close.

Return JSON of this exact shape:
{
  "recommended": "<slug of the best-fit product>",
  "headline": "<one confident sentence naming the pick and the main reason>",
  "items": [
    {"slug": "<slug>", "verdict": "best" | "good" | "overkill" | "not-ideal", "reason": "<one short sentence tied to specs/price>"}
  ]
}
"items" must include every product given, "recommended" must be exactly one of their slugs. Use "overkill" when a product would work but is unnecessarily powerful/expensive for the stated need. Be concrete and reference actual specs/numbers.`

  try {
    const res = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${GEMINI_KEY}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          contents: [{ role: 'user', parts: [{ text: prompt }] }],
          generationConfig: {
            temperature: 0.3,
            maxOutputTokens: 700,
            responseMimeType: 'application/json',
            thinkingConfig: { thinkingBudget: 0 },
          },
        }),
      }
    )
    if (!res.ok) return NextResponse.json({ error: 'ai' }, { status: 502 })
    const json = await res.json()
    const text: string = json?.candidates?.[0]?.content?.parts?.map((p: { text?: string }) => p.text ?? '').join('') ?? ''
    const parsed = JSON.parse(text) as {
      recommended?: string
      headline?: string
      items?: { slug?: string; verdict?: string; reason?: string }[]
    }

    const validSlugs = new Set(products.map((p) => p.slug))
    const VERDICTS = ['best', 'good', 'overkill', 'not-ideal']
    const items = (Array.isArray(parsed.items) ? parsed.items : [])
      .filter((it) => it.slug && validSlugs.has(it.slug))
      .map((it) => ({
        slug: it.slug as string,
        verdict: VERDICTS.includes(it.verdict ?? '') ? (it.verdict as string) : 'good',
        reason: String(it.reason ?? '').slice(0, 220),
      }))
    if (items.length < products.length) {
      // Fill in anything the model dropped so every product gets a verdict.
      for (const p of products) {
        if (!items.some((it) => it.slug === p.slug)) items.push({ slug: p.slug, verdict: 'good', reason: '' })
      }
    }
    const recommended = parsed.recommended && validSlugs.has(parsed.recommended) ? parsed.recommended : items[0]?.slug

    return NextResponse.json({
      ok: true,
      recommended,
      headline: String(parsed.headline ?? '').slice(0, 300),
      items,
    })
  } catch {
    return NextResponse.json({ error: 'ai' }, { status: 502 })
  }
}
