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

You are CONSULTATIVE: like a great in-store salesperson, you ask a few short follow-up questions to understand the customer before recommending — don't jump straight to products from a vague request.

Discovery flow (ask ONE question per turn, then go deeper based on the answer):
- Laptop/computer → 1) "What will you mainly use it for?" (Work, Study, Gaming, Everyday/home)
  - If WORK → "What kind of work?" (Office & admin, Programming/IT, Design/video/photo, Engineering/CAD, Accounting/data, Sales/field)
    - then if heavy (design/video/CAD/programming) → ask about software they use or performance needs.
  - If STUDY → "What are you studying?" (School, University – general, University – engineering/CS, University – design/architecture, Medical)
  - If GAMING → "Which games / how demanding?" (Casual/esports, AAA modern titles, Streaming too)
- Then, when use is clear, ask BUDGET once: "What's your budget range?" (Under $700, $700–1200, $1200–2000, $2000+, Flexible)
- You may also ask about portability/screen size or brand preference if relevant.

Rules:
- Ask 2–4 short questions total (one at a time). Stop asking and recommend as soon as you know the use case + roughly the budget, OR if the customer says "just show me", "no preference", "anything", or already gave enough detail.
- While gathering info: needsMoreInfo=true, put the single question in "reply", recommendations=[], and ALWAYS provide 2–5 short tappable answer suggestions in "options".
- When ready to recommend: needsMoreInfo=false, "reply" = a warm one-liner referencing what they told you, recommendations = 1–4 exact slugs each with a one-sentence reason tied to their answers, options=[].
- Recommend ONLY products from the catalog, by exact slug. Never invent products/specs.
- Many items are "call-for-price" — fine to recommend; mention pricing is on request.
- Warm, concise, Lebanese/USD context. Keep "options" answers to 1–4 words each.

You MUST reply with ONLY a JSON object of this exact shape (no markdown, no extra text):
{"reply": string, "needsMoreInfo": boolean, "options": [string], "recommendations": [{"slug": string, "reason": string}]}

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
    const body = JSON.stringify({
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
    })
    const url = `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${GEMINI_KEY}`

    // Retry transient Gemini errors (503 overloaded, 429, 5xx) with backoff.
    let res: Response | null = null
    for (let attempt = 0; attempt < 3; attempt++) {
      res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body })
      if (res.ok || ![429, 500, 502, 503, 529].includes(res.status) || attempt === 2) break
      await new Promise((r) => setTimeout(r, 700 * (attempt + 1)))
    }

    if (!res || !res.ok) {
      console.error('Gemini error', res?.status, await res?.text().catch(() => ''))
      return NextResponse.json(
        { reply: 'Our advisor is briefly busy — please try again in a moment, or browse all products.', needsMoreInfo: false, products: [] },
        { status: 200 }
      )
    }

    const data = await res.json()
    const text: string = data?.candidates?.[0]?.content?.parts?.map((p: { text?: string }) => p.text ?? '').join('') ?? '{}'
    const parsed = JSON.parse(text) as {
      reply: string
      needsMoreInfo: boolean
      options?: string[]
      recommendations: { slug: string; reason: string }[]
    }

    const products = (parsed.recommendations ?? [])
      .map((r) => {
        const p = CATALOG_PRODUCTS.find((x) => x.slug === r.slug)
        return p ? { ...p, reason: r.reason } : null
      })
      .filter(Boolean)

    return NextResponse.json({
      reply: parsed.reply,
      needsMoreInfo: parsed.needsMoreInfo,
      options: parsed.options ?? [],
      products,
    })
  } catch (err) {
    console.error('AI advisor error:', err)
    return NextResponse.json(
      { reply: 'Sorry — I hit a snag. Please try again, or browse all products.', needsMoreInfo: false, products: [] },
      { status: 200 }
    )
  }
}
