import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { getPriceComparisons, getRecentChanges, getPricingOpportunities } from '@/lib/competitors'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const GEMINI_KEY = process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY
const MODEL = 'gemini-2.5-flash'

/** Gemini-written narrative digest of the competitive landscape. */
export async function GET() {
  if (!isSupabaseConfigured()) return NextResponse.json({ digest: null, notConfigured: 'supabase' })
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ digest: null }, { status: 401 })
  if (!GEMINI_KEY) return NextResponse.json({ digest: null, notConfigured: 'gemini' })

  const [{ comparisons }, changes, opportunities] = await Promise.all([
    getPriceComparisons(supabase),
    getRecentChanges(supabase, 25),
    getPricingOpportunities(supabase),
  ])

  const data = {
    matchedComparisons: comparisons.slice(0, 40).map((c) => ({
      product: c.productName, ourPrice: c.ourPrice, competitor: c.competitor,
      theirPrice: c.theirPrice, gapPct: c.diffPct, theirInStock: c.theirInStock,
    })),
    recentPriceChanges: changes.map((c) => ({
      competitor: c.competitor, item: c.name.slice(0, 60),
      from: c.previous_price, to: c.price, at: c.changed_at, matchedToUs: c.matched,
    })),
    callForPricePricingOpportunities: opportunities.slice(0, 20).map((o) => ({
      product: o.productName, cheapestCompetitor: o.competitor,
      theirPrice: o.minCompetitorPrice, suggested: o.suggested,
    })),
  }

  const prompt = `You are a pricing analyst for Trust Technology, a tech store in Tripoli, Lebanon. Competitors tracked: Mojitech, PC and Parts, Ayoub Computers, Multitech, Mediatech. Analyse the JSON and write a competitive digest for the owner.

Format as GitHub-flavoured markdown:
- One bold headline sentence on the overall competitive position.
- 3–6 bullets: where we're overpriced (name products + numbers), notable competitor price cuts/raises, competitor stock-outs we can exploit, and the top pricing opportunities for "Call for price" items.
- End with ONE concrete action for this week.
- Use real numbers (USD). Under 160 words. If there's little data, say what to do to get more (e.g. confirm AI match suggestions).

DATA:
${JSON.stringify(data)}`

  try {
    const res = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${GEMINI_KEY}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          contents: [{ role: 'user', parts: [{ text: prompt }] }],
          generationConfig: { temperature: 0.4, maxOutputTokens: 700, thinkingConfig: { thinkingBudget: 0 } },
        }),
      }
    )
    if (!res.ok) return NextResponse.json({ digest: null, error: 'ai' })
    const json = await res.json()
    const text: string = json?.candidates?.[0]?.content?.parts?.map((p: { text?: string }) => p.text ?? '').join('') ?? ''
    return NextResponse.json({ digest: text.trim() || null })
  } catch {
    return NextResponse.json({ digest: null, error: 'ai' })
  }
}
