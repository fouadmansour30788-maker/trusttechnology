import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import { isSupabaseConfigured } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const STATUS_LABELS: Record<string, { label: string; step: number }> = {
  draft: { label: 'Received — we’ll call you to confirm', step: 1 },
  confirmed: { label: 'Confirmed — preparing your order', step: 2 },
  fulfilled: { label: 'Delivered', step: 3 },
  cancelled: { label: 'Cancelled', step: 0 },
}

const digits = (s: string) => s.replace(/\D/g, '')

/**
 * Public order lookup: requires BOTH the order reference and the phone the
 * order was placed with (verified against the customer record), so order
 * numbers alone leak nothing. Reads via service role; returns minimal fields.
 */
export async function POST(req: Request) {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!isSupabaseConfigured() || !url || !serviceKey) {
    return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  }

  let body: { reference?: string; phone?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid request' }, { status: 400 })
  }
  const reference = (body.reference ?? '').trim().toUpperCase()
  const phone = digits(body.phone ?? '')
  if (!/^SO-\d{1,8}$/.test(reference) || phone.length < 7) {
    return NextResponse.json({ error: 'Enter your order number (e.g. SO-0012) and the phone you ordered with.' }, { status: 400 })
  }

  const supabase = createServiceClient(url, serviceKey, { auth: { persistSession: false } })
  const { data, error } = await supabase
    .from('sales_orders')
    .select('reference, status, order_date, total, customer:customers(phone), sales_order_items(quantity, product:products(name))')
    .eq('reference', reference)
    .maybeSingle()

  const notFound = NextResponse.json({ error: 'No order found for that number and phone.' }, { status: 404 })
  if (error || !data) return notFound

  type Row = {
    reference: string; status: string; order_date: string; total: number
    customer: { phone: string | null } | null
    sales_order_items: { quantity: number; product: { name: string } | null }[]
  }
  const order = data as unknown as Row
  const customerPhone = digits(order.customer?.phone ?? '')
  // Match on the last 8 digits so "+961 71 …" and "0091 71 …" formats agree.
  if (!customerPhone || customerPhone.slice(-8) !== phone.slice(-8)) return notFound

  const status = STATUS_LABELS[order.status] ?? { label: order.status, step: 1 }
  return NextResponse.json({
    ok: true,
    reference: order.reference,
    status: order.status,
    statusLabel: status.label,
    step: status.step,
    orderDate: order.order_date,
    total: Number(order.total),
    items: (order.sales_order_items ?? []).map((it) => ({
      name: it.product?.name ?? 'Item',
      quantity: it.quantity,
    })),
  })
}
