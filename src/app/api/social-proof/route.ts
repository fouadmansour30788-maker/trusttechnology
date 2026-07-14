import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/**
 * Anonymized recent-order feed for social-proof toasts.
 * Returns only: first product name, coarse region (from web-order notes), rough age.
 * Never names, phones, totals or exact times. Cached 5 minutes at the edge.
 */
export async function GET() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !serviceKey) return NextResponse.json({ events: [] })

  try {
    const supabase = createServiceClient(url, serviceKey, { auth: { persistSession: false } })
    const since = new Date(Date.now() - 14 * 24 * 3600 * 1000).toISOString()
    const { data } = await supabase
      .from('sales_orders')
      .select('created_at, notes, sales_order_items(product:products(name))')
      .neq('status', 'cancelled')
      .gte('created_at', since)
      .order('created_at', { ascending: false })
      .limit(10)

    type Row = { created_at: string; notes: string | null; sales_order_items: { product: { name: string } | null }[] }
    const events = (((data as unknown as Row[]) ?? [])
      .map((o) => {
        const product = o.sales_order_items?.[0]?.product?.name
        if (!product) return null
        const regionMatch = o.notes?.match(/Delivery region: ([^—\n]+)/)
        const hours = Math.max(1, Math.round((Date.now() - new Date(o.created_at).getTime()) / 3600000))
        return {
          product,
          region: regionMatch ? regionMatch[1].trim().split('&')[0].trim() : 'Tripoli',
          ago: hours < 24 ? `${hours}h ago` : `${Math.round(hours / 24)}d ago`,
        }
      })
      .filter(Boolean) as { product: string; region: string; ago: string }[]).slice(0, 6)

    return NextResponse.json({ events }, { headers: { 'Cache-Control': 's-maxage=300, stale-while-revalidate=600' } })
  } catch {
    return NextResponse.json({ events: [] })
  }
}
