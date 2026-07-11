import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { getAdminStats, isSupabaseConfigured } from '@/lib/db'
import { getErpStats } from '@/lib/erp'
import { getAnalytics } from '@/lib/analytics'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const GEMINI_KEY = process.env.GEMINI_API_KEY || process.env.GOOGLE_API_KEY
const MODEL = 'gemini-2.5-flash'

export async function GET() {
  if (!isSupabaseConfigured()) {
    return NextResponse.json({ insights: null, notConfigured: 'supabase' })
  }
  // Staff only.
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ insights: null }, { status: 401 })

  if (!GEMINI_KEY) {
    return NextResponse.json({ insights: null, notConfigured: 'gemini' })
  }

  const [a, erp, products] = await Promise.all([getAnalytics(), getErpStats(), getAdminStats()])
  const data = {
    kpis: a.kpis,
    monthly: a.monthly,
    revenueByCategory: a.categoryRevenue,
    orderStatusMix: a.statusMix,
    ordersByWeekday: a.weekday,
    orderFunnel: a.funnel,
    topProducts: a.topProducts.slice(0, 5),
    topCustomers: a.topCustomers.slice(0, 5),
    storeHealthScores: a.radar,
    suppliers: erp.suppliers,
    openPurchaseOrders: erp.openPOs,
    totalProducts: products.products,
    activeProducts: products.active,
    outOfStock: products.outOfStock,
    callForPriceItems: products.callForPrice,
  }

  const prompt = `You are a retail business analyst for Trust Technology, a tech store in Tripoli, Lebanon. Analyse the JSON metrics below and write a brief executive summary for the store owner.

Format as GitHub-flavoured markdown:
- Start with one bold headline sentence on overall health.
- Then 3–5 concise bullet points: notable trends (revenue direction, best sellers), risks (low stock, out-of-stock, open POs), and ONE specific actionable recommendation.
- Use real numbers from the data. Currency is USD. Be concrete and practical, not generic. Keep it under 130 words.
- If there are no sales yet, say so plainly and suggest first steps.

METRICS:
${JSON.stringify(data)}`

  try {
    const res = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${GEMINI_KEY}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          contents: [{ role: 'user', parts: [{ text: prompt }] }],
          generationConfig: { temperature: 0.5, maxOutputTokens: 600, thinkingConfig: { thinkingBudget: 0 } },
        }),
      }
    )
    if (!res.ok) return NextResponse.json({ insights: null, error: 'ai' })
    const json = await res.json()
    const text: string = json?.candidates?.[0]?.content?.parts?.map((p: { text?: string }) => p.text ?? '').join('') ?? ''
    return NextResponse.json({ insights: text.trim() || null })
  } catch {
    return NextResponse.json({ insights: null, error: 'ai' })
  }
}
