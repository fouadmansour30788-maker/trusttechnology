import { NextResponse } from 'next/server'
import { getProductBySlug } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const GEMINI_KEY = process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY
const MODEL = 'gemini-2.5-flash'

/** "Will it work for me?" — verdict for a use case against one product's specs. */
export async function POST(req: Request) {
  if (!GEMINI_KEY) return NextResponse.json({ error: 'notConfigured' }, { status: 503 })

  let body: { slug?: string; useCase?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  const useCase = (body.useCase ?? '').trim()
  if (!body.slug || useCase.length < 3 || useCase.length > 200) {
    return NextResponse.json({ error: 'Tell us in a few words what you’ll use it for.' }, { status: 400 })
  }

  const product = await getProductBySlug(body.slug)
  if (!product) return NextResponse.json({ error: 'invalid' }, { status: 404 })

  const prompt = `You are a friendly tech-shop expert in Lebanon. A customer is looking at this product:

NAME: ${product.name}
SPECS: ${JSON.stringify(product.specs ?? {})}
${product.price > 0 ? `PRICE: $${product.price}` : ''}

The customer says they will use it for: "${useCase}"

Judge honestly whether THIS product fits that use. Return JSON:
{"verdict": "great" | "ok" | "not-ideal", "summary": "<one plain-language sentence verdict>", "points": ["<2-4 short bullet points: what works, what limits, what to consider — reference the actual specs>"]}
Be honest — if it's a poor fit, say so and name the limiting spec. If the use case is gibberish or not about using a product, verdict "ok" with a summary asking them to describe their use.`

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
            maxOutputTokens: 500,
            responseMimeType: 'application/json',
            thinkingConfig: { thinkingBudget: 0 },
          },
        }),
      }
    )
    if (!res.ok) return NextResponse.json({ error: 'ai' }, { status: 502 })
    const json = await res.json()
    const text: string = json?.candidates?.[0]?.content?.parts?.map((p: { text?: string }) => p.text ?? '').join('') ?? ''
    const parsed = JSON.parse(text) as { verdict?: string; summary?: string; points?: string[] }
    const verdict = ['great', 'ok', 'not-ideal'].includes(parsed.verdict ?? '') ? parsed.verdict : 'ok'
    return NextResponse.json({
      ok: true,
      verdict,
      summary: String(parsed.summary ?? '').slice(0, 300),
      points: (Array.isArray(parsed.points) ? parsed.points : []).slice(0, 4).map((p) => String(p).slice(0, 200)),
    })
  } catch {
    return NextResponse.json({ error: 'ai' }, { status: 502 })
  }
}
