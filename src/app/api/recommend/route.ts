import { NextResponse } from 'next/server'
import { CATALOG_PRODUCTS } from '@/data/products'

export const runtime = 'nodejs'

type ChatMsg = { role: 'user' | 'assistant'; content: string }

const GEMINI_KEY = process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY
const MODEL = 'gemini-2.5-flash'

// Compact one-line catalog the model reasons over.
const CATALOG_TEXT = CATALOG_PRODUCTS.map((p) => {
  const brand = p.tags?.find((t) => t.type === 'brand')?.name ?? ''
  const specs = Object.entries(p.specs).slice(0, 4).map(([k, v]) => `${k}:${v}`).join(', ')
  const price = p.priceOnRequest || p.price === 0 ? 'call-for-price' : `$${p.price}`
  return `${p.slug} | ${p.name} | ${brand} | ${p.primary_category_id} | ${price} | ${specs}`
}).join('\n')

const SYSTEM = `You are the friendly product advisor for Trust Technology, a tech store in Tripoli, Lebanon. You help customers find the right products from OUR catalog only.

Rules:
- Recommend ONLY products from the catalog below, by their exact slug.
- Pick 1–4 genuinely fitting products. Explain each in one short, concrete sentence tied to the customer's stated need.
- If the request is too vague to recommend well (e.g. "I need a laptop" with no budget/use), set needsMoreInfo true, ask ONE focused follow-up question in reply, and return an empty recommendations array.
- Many items are "call-for-price"; that's fine to recommend — mention pricing is on request.
- Be warm and concise. Lebanese/USD context. Never invent products or specs.

You MUST reply with ONLY a JSON object of this exact shape (no markdown, no extra text):
{"reply": string, "needsMoreInfo": boolean, "recommendations": [{"slug": string, "reason": string}]}

CATALOG (slug | name | brand | category | price | specs):
${CATALOG_TEXT}`

export async function POST(req: Request) {
  const { messages } = (await req.json()) as { messages: ChatMsg[] }

  if (!GEMINI_KEY) {
    return NextResponse.json({
      reply:
        "The AI advisor isn't switched on yet — add a GEMINI_API_KEY to .env.local (free from Google AI Studio). In the meantime, browse all products or message us on WhatsApp and we'll help you choose.",
      needsMoreInfo: false,
      products: [],
      notConfigured: true,
    })
  }

  try {
    const res = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${GEMINI_KEY}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          systemInstruction: { parts: [{ text: SYSTEM }] },
          contents: messages.map((m) => ({
            role: m.role === 'assistant' ? 'model' : 'user',
            parts: [{ text: m.content }],
          })),
          generationConfig: {
            temperature: 0.4,
            responseMimeType: 'application/json',
            maxOutputTokens: 2048,
            thinkingConfig: { thinkingBudget: 0 }, // 2.5-flash thinks by default; off → full JSON answer
          },
        }),
      }
    )

    if (!res.ok) {
      const detail = await res.text()
      console.error('Gemini error', res.status, detail)
      return NextResponse.json(
        { reply: 'Sorry — I hit a snag reaching the AI. Please try again, or browse all products.', needsMoreInfo: false, products: [] },
        { status: 200 }
      )
    }

    const data = await res.json()
    const text: string = data?.candidates?.[0]?.content?.parts?.map((p: { text?: string }) => p.text ?? '').join('') ?? '{}'
    const parsed = JSON.parse(text) as {
      reply: string
      needsMoreInfo: boolean
      recommendations: { slug: string; reason: string }[]
    }

    const products = (parsed.recommendations ?? [])
      .map((r) => {
        const p = CATALOG_PRODUCTS.find((x) => x.slug === r.slug)
        return p ? { ...p, reason: r.reason } : null
      })
      .filter(Boolean)

    return NextResponse.json({ reply: parsed.reply, needsMoreInfo: parsed.needsMoreInfo, products })
  } catch (err) {
    console.error('AI advisor error:', err)
    return NextResponse.json(
      { reply: 'Sorry — I hit a snag. Please try again, or browse all products.', needsMoreInfo: false, products: [] },
      { status: 200 }
    )
  }
}
