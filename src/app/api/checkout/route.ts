import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import { isSupabaseConfigured } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

type CheckoutItem = { slug: string; quantity: number }
type CheckoutBody = {
  name?: string
  phone?: string
  address?: string
  note?: string
  website?: string // honeypot — real users never fill this
  items?: CheckoutItem[]
}

const MAX_LINES = 30
const MAX_QTY = 20

/**
 * Cash-on-delivery checkout. Anonymous visitors can't write through RLS, so
 * this route uses the service-role key — everything the client sends is
 * re-validated and re-priced server-side (only slugs + quantities are trusted).
 */
export async function POST(req: Request) {
  if (!isSupabaseConfigured()) {
    return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  }
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL!
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!serviceKey) {
    return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  }

  let body: CheckoutBody
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid request' }, { status: 400 })
  }

  // Honeypot: pretend success for bots.
  if (body.website) return NextResponse.json({ ok: true, reference: 'SO-0000' })

  const name = (body.name ?? '').trim()
  const phone = (body.phone ?? '').trim()
  const address = (body.address ?? '').trim()
  const note = (body.note ?? '').trim().slice(0, 500)

  if (name.length < 2 || name.length > 80) return NextResponse.json({ error: 'Please enter your full name.' }, { status: 400 })
  if (!/^[+\d][\d\s\-()]{6,19}$/.test(phone)) return NextResponse.json({ error: 'Please enter a valid phone number.' }, { status: 400 })
  if (address.length < 8 || address.length > 300) return NextResponse.json({ error: 'Please enter a delivery address (area, street, building).' }, { status: 400 })

  // Dedupe + clamp items
  const wanted = new Map<string, number>()
  for (const it of (body.items ?? []).slice(0, MAX_LINES)) {
    if (!it?.slug || typeof it.slug !== 'string') continue
    const qty = Math.min(MAX_QTY, Math.max(1, Math.floor(Number(it.quantity) || 1)))
    wanted.set(it.slug.slice(0, 200), (wanted.get(it.slug) ?? 0) + qty)
  }
  if (wanted.size === 0) return NextResponse.json({ error: 'Your cart has no items that can be ordered online.' }, { status: 400 })

  const supabase = createServiceClient(url, serviceKey, { auth: { persistSession: false } })

  // Re-price everything from the database — client prices are never trusted.
  const { data: prodData, error: prodErr } = await supabase
    .from('products')
    .select('id, slug, name, price, is_active')
    .in('slug', [...wanted.keys()])
  if (prodErr) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  const products = (prodData as { id: string; slug: string; name: string; price: number; is_active: boolean }[]) ?? []
  const lines: { product_id: string; quantity: number; unit_price: number }[] = []
  for (const [slug, qty] of wanted) {
    const p = products.find((x) => x.slug === slug)
    if (!p || !p.is_active || Number(p.price) <= 0) {
      return NextResponse.json({ error: 'Some items in your cart are no longer orderable online — please refresh and try again.' }, { status: 400 })
    }
    lines.push({ product_id: p.id, quantity: qty, unit_price: Number(p.price) })
  }
  const subtotal = Math.round(lines.reduce((s, l) => s + l.unit_price * l.quantity, 0) * 100) / 100

  // Find-or-create the customer by phone.
  let customerId: string | null = null
  const { data: existing } = await supabase.from('customers').select('id').eq('phone', phone).limit(1)
  if (existing && existing.length > 0) {
    customerId = (existing[0] as { id: string }).id
  } else {
    const { data: created, error: custErr } = await supabase
      .from('customers')
      .insert({ name, phone, address, notes: 'Created by website checkout' })
      .select('id')
      .single()
    if (custErr || !created) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
    customerId = (created as { id: string }).id
  }

  const orderNotes = [
    'Website order — Cash on Delivery',
    `Deliver to: ${address}`,
    note ? `Customer note: ${note}` : null,
  ].filter(Boolean).join('\n')

  const { data: order, error: orderErr } = await supabase
    .from('sales_orders')
    .insert({ customer_id: customerId, status: 'draft', subtotal, discount: 0, total: subtotal, notes: orderNotes })
    .select('id, reference')
    .single()
  if (orderErr || !order) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  const { id: soId, reference } = order as { id: string; reference: string }
  const { error: itemsErr } = await supabase
    .from('sales_order_items')
    .insert(lines.map((l) => ({ ...l, so_id: soId })))
  if (itemsErr) {
    await supabase.from('sales_orders').delete().eq('id', soId)
    return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  }

  return NextResponse.json({ ok: true, reference, total: subtotal })
}
