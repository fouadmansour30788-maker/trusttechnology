import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'
import { CATALOG_PRODUCTS } from '@/data/products'

export const runtime = 'nodejs'

type ChatMsg = { role: 'user' | 'assistant'; content: string }

// Compact one-line catalog the model reasons over (prompt-cached).
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

CATALOG (slug | name | brand | category | price | specs):
${CATALOG_TEXT}`

const SCHEMA = {
  type: 'object',
  properties: {
    reply: { type: 'string' },
    needsMoreInfo: { type: 'boolean' },
    recommendations: {
      type: 'array',
      items: {
        type: 'object',
        properties: { slug: { type: 'string' }, reason: { type: 'string' } },
        required: ['slug', 'reason'],
        additionalProperties: false,
      },
    },
  },
  required: ['reply', 'needsMoreInfo', 'recommendations'],
  additionalProperties: false,
} as const

export async function POST(req: Request) {
  const { messages } = (await req.json()) as { messages: ChatMsg[] }

  if (!process.env.ANTHROPIC_API_KEY) {
    return NextResponse.json({
      reply:
        "The AI advisor isn't switched on yet — add an ANTHROPIC_API_KEY to .env.local to enable it. In the meantime, browse all products or message us on WhatsApp and we'll help you choose.",
      needsMoreInfo: false,
      products: [],
      notConfigured: true,
    })
  }

  try {
    const client = new Anthropic()
    const res = await client.messages.create({
      model: 'claude-opus-4-8',
      max_tokens: 1200,
      thinking: { type: 'adaptive' },
      output_config: { effort: 'low', format: { type: 'json_schema', schema: SCHEMA } },
      system: [{ type: 'text', text: SYSTEM, cache_control: { type: 'ephemeral' } }],
      messages: messages.map((m) => ({ role: m.role, content: m.content })),
    })

    const textBlock = res.content.find((b) => b.type === 'text') as Anthropic.TextBlock | undefined
    const parsed = JSON.parse(textBlock?.text ?? '{}') as {
      reply: string
      needsMoreInfo: boolean
      recommendations: { slug: string; reason: string }[]
    }

    // Map slugs → real product data (drop hallucinated slugs).
    const products = parsed.recommendations
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
