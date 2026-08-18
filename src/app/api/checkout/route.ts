import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import { createClient as createSessionClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { deliveryFee } from '@/lib/delivery'
import { pointsEarned, pointsValue, maxRedeemable } from '@/lib/loyalty'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

type CheckoutItem = { slug: string; quantity: number }
type CheckoutBody = {
  name?: string
  phone?: string
  address?: string
  region?: string
  note?: string
  website?: string // honeypot — real users never fill this
  items?: CheckoutItem[]
  giftCertificateCode?: string
  redeemPoints?: number
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
  const { region, fee } = deliveryFee(body.region ?? '', subtotal)
  const preDiscountTotal = Math.round((subtotal + fee) * 100) / 100

  // Gift certificate redemption — validated and applied atomically here (not
  // in the separate preview endpoint) so two simultaneous checkouts can't
  // both spend the same balance.
  let giftCert: { id: string; remaining_balance: number } | null = null
  let giftCertAmountApplied = 0
  const code = (body.giftCertificateCode ?? '').trim().toUpperCase()
  if (code) {
    const { data: gcRow } = await supabase.from('gift_certificates').select('id, remaining_balance, status').eq('code', code).maybeSingle()
    const gc = gcRow as { id: string; remaining_balance: number; status: string } | null
    if (!gc || gc.status !== 'active' || Number(gc.remaining_balance) <= 0) {
      return NextResponse.json({ error: 'That gift certificate code is invalid or has no balance remaining.' }, { status: 400 })
    }
    giftCert = { id: gc.id, remaining_balance: Number(gc.remaining_balance) }
    giftCertAmountApplied = Math.round(Math.min(giftCert.remaining_balance, preDiscountTotal) * 100) / 100
  }
  const afterGiftCert = Math.round((preDiscountTotal - giftCertAmountApplied) * 100) / 100

  // Points redemption requires a signed-in, account-linked customer — that's
  // the identity used for the whole order below (not the phone-matched one),
  // so the balance being spent and the balance being credited are the same
  // row. Guests can't redeem, but still earn (see after order insert).
  const sessionSupabase = await createSessionClient()
  const { data: { user: sessionUser } } = await sessionSupabase.auth.getUser()
  let linkedCustomer: { id: string; points_balance: number } | null = null
  if (sessionUser) {
    const { data: lc } = await supabase.from('customers').select('id, points_balance').eq('auth_user_id', sessionUser.id).maybeSingle()
    if (lc) linkedCustomer = lc as { id: string; points_balance: number }
  }

  let redeemPoints = Math.max(0, Math.floor(Number(body.redeemPoints) || 0))
  let pointsAmountApplied = 0
  if (redeemPoints > 0) {
    if (!linkedCustomer) return NextResponse.json({ error: 'Sign in to redeem points.' }, { status: 400 })
    const allowed = maxRedeemable(linkedCustomer.points_balance, afterGiftCert)
    redeemPoints = Math.min(redeemPoints, allowed)
    pointsAmountApplied = pointsValue(redeemPoints)
  }
  const total = Math.round((afterGiftCert - pointsAmountApplied) * 100) / 100

  // The account-linked customer (if signed in) is the order's customer —
  // otherwise find-or-create by phone, same as before.
  let customerId: string | null = linkedCustomer?.id ?? null
  if (!customerId) {
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
  }

  const orderNotes = [
    'Website order — Cash on Delivery',
    `Deliver to: ${address}`,
    `Delivery region: ${region.label} — fee $${fee}`,
    giftCert ? `Gift certificate applied: -$${giftCertAmountApplied.toFixed(2)}` : null,
    redeemPoints > 0 ? `Points redeemed: ${redeemPoints} (-$${pointsAmountApplied.toFixed(2)})` : null,
    note ? `Customer note: ${note}` : null,
  ].filter(Boolean).join('\n')

  const { data: order, error: orderErr } = await supabase
    .from('sales_orders')
    .insert({
      customer_id: customerId, status: 'draft', subtotal, discount: 0, total, notes: orderNotes,
      gift_certificate_amount_applied: giftCertAmountApplied,
    })
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

  let finalTotal = total
  let giftCertificateFailed = false
  let pointsFailed = false

  if (giftCert && giftCertAmountApplied > 0) {
    const newBalance = Math.round((giftCert.remaining_balance - giftCertAmountApplied) * 100) / 100
    // Only spend the balance if it's still what we read (defends against a
    // concurrent checkout draining it between the read above and now).
    const { data: updated } = await supabase
      .from('gift_certificates')
      .update({ remaining_balance: newBalance, status: newBalance <= 0 ? 'redeemed' : 'active' })
      .eq('id', giftCert.id)
      .eq('remaining_balance', giftCert.remaining_balance)
      .select('id')
    if (updated && updated.length > 0) {
      await supabase.from('gift_certificate_redemptions').insert({
        gift_certificate_id: giftCert.id, sales_order_id: soId, amount_applied: giftCertAmountApplied,
      })
    } else {
      // Lost the race — someone else spent it first. Don't fail the order
      // (it's already placed); just don't apply a discount that isn't real.
      giftCertificateFailed = true
      finalTotal = Math.round((finalTotal + giftCertAmountApplied) * 100) / 100
      await supabase.from('sales_orders').update({ gift_certificate_amount_applied: 0, total: finalTotal }).eq('id', soId)
    }
  }

  if (redeemPoints > 0 && linkedCustomer) {
    const newBalance = linkedCustomer.points_balance - redeemPoints
    // Same optimistic-concurrency guard as the gift certificate above.
    const { data: updated } = await supabase
      .from('customers')
      .update({ points_balance: newBalance })
      .eq('id', linkedCustomer.id)
      .eq('points_balance', linkedCustomer.points_balance)
      .select('id')
    if (updated && updated.length > 0) {
      await supabase.from('points_ledger').insert({ customer_id: linkedCustomer.id, delta: -redeemPoints, reason: 'redemption', sales_order_id: soId })
    } else {
      pointsFailed = true
      finalTotal = Math.round((finalTotal + pointsAmountApplied) * 100) / 100
      await supabase.from('sales_orders').update({ total: finalTotal }).eq('id', soId)
    }
  }

  // Earn points on the order's own customer, regardless of login — best
  // effort (no concurrency guard: worst case under a race is a few points
  // lost to a lost update, not a balance a customer could ever overspend).
  const earned = pointsEarned(subtotal)
  if (earned > 0) {
    const { data: custRow } = await supabase.from('customers').select('points_balance').eq('id', customerId).maybeSingle()
    const currentBalance = Number((custRow as { points_balance?: number } | null)?.points_balance ?? 0)
    await supabase.from('customers').update({ points_balance: currentBalance + earned }).eq('id', customerId)
    await supabase.from('points_ledger').insert({ customer_id: customerId, delta: earned, reason: 'purchase', sales_order_id: soId })
  }

  return NextResponse.json({ ok: true, reference, total: finalTotal, giftCertificateFailed, pointsFailed, pointsEarned: earned })
}
