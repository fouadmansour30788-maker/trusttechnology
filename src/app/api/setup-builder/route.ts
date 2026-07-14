import { NextResponse } from 'next/server'
import { getProducts } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'
export const maxDuration = 60

const GEMINI_KEY = process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY
const MODEL = 'gemini-2.5-flash'

/** Budget setup builder: assemble a complete setup from the live priced catalog. */
export async function POST(req: Request) {
  if (!GEMINI_KEY) return NextResponse.json({ error: 'notConfigured' }, { status: 503 })

  let body: { budget?: number; useCase?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  const budget = Math.round(Number(body.budget) || 0)
  const useCase = (body.useCase ?? '').trim()
  if (budget < 100 || budget > 50000) return NextResponse.json({ error: 'Enter a budget between $100 and $50,000.' }, { status: 400 })
  if (useCase.length < 3 || useCase.length > 300) return NextResponse.json({ error: 'Tell us in a few words what the setup is for.' }, { status: 400 })

  const all = await getProducts()
  const priced = all.filter((p) => p.is_active && p.price > 0)
  if (priced.length === 0) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  const catalog = priced.map((p) => {
    const brand = p.tags?.find((t) => t.type === 'brand')?.name ?? ''
    const specs = Object.entries(p.specs ?? {}).slice(0, 4).map(([k, v]) => `${k}:${v}`).join(', ')
    return `${p.slug} | ${p.name} | ${brand} | ${p.primary_category_id} | $${p.price} | ${specs}`
  }).join('\n')

  const prompt = `You are the expert setup builder for Trust Technology, a tech store in Tripoli, Lebanon.

Customer budget: $${budget}
Customer's goal: "${useCase}"

Build a COMPLETE setup from the catalog below: exactly one main computer (laptop or desktop) plus complementary items that genuinely serve the goal (monitor, printer, accessories, POS hardware…) — only add extras that make sense. The SUM of prices MUST NOT exceed the budget. Spend the budget wisely — prefer a stronger main machine over unnecessary extras.

Return JSON:
{"intro": "<one warm sentence about the setup you built and why it fits>", "items": [{"slug": "<exact catalog slug>", "role": "<Main laptop | Monitor | Printer | …>", "reason": "<one short sentence>"}]}
2–5 items. Use only exact slugs from the catalog. If the budget can't cover a sensible main machine, return {"intro": "<explain briefly and suggest the closest option>", "items": [<the single closest machine>]}.

CATALOG (slug | name | brand | category | price | specs):
${catalog}`

  try {
    const gemBody = JSON.stringify({
      contents: [{ role: 'user', parts: [{ text: prompt }] }],
      generationConfig: {
        temperature: 0.4,
        maxOutputTokens: 1200,
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
    const parsed = JSON.parse(text) as { intro?: string; items?: { slug?: string; role?: string; reason?: string }[] }

    const seen = new Set<string>()
    const items = []
    for (const it of parsed.items ?? []) {
      const p = it.slug ? priced.find((x) => x.slug === it.slug) : undefined
      if (!p || seen.has(p.slug)) continue
      seen.add(p.slug)
      items.push({
        product: p,
        role: String(it.role ?? 'Item').slice(0, 40),
        reason: String(it.reason ?? '').slice(0, 200),
      })
      if (items.length >= 5) break
    }
    if (items.length === 0) return NextResponse.json({ error: 'ai' }, { status: 502 })

    // The model sometimes overspends — enforce the budget server-side by
    // dropping extras (never the main machine) until the total fits.
    const sum = () => Math.round(items.reduce((s, it) => s + it.product.price, 0) * 100) / 100
    while (items.length > 1 && sum() > budget) items.pop()

    const total = sum()
    return NextResponse.json({ ok: true, intro: String(parsed.intro ?? '').slice(0, 400), items, total, budget })
  } catch {
    return NextResponse.json({ error: 'ai' }, { status: 502 })
  }
}
