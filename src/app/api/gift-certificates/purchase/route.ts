import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const MIN_AMOUNT = 10
const MAX_AMOUNT = 1000

/**
 * "Buy" a gift certificate the same way any product is bought — cash on
 * delivery. Creates the certificate as pending_payment plus a linked
 * sales_order so staff see it in the normal confirm-by-phone workflow;
 * an admin action later activates it and reveals the redeemable code.
 */
export async function POST(req: Request) {
  if (!isSupabaseConfigured()) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL!
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!serviceKey) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  let body: {
    amount?: number; purchaserName?: string; purchaserPhone?: string
    recipientName?: string; recipientEmail?: string; message?: string; website?: string
  }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid request' }, { status: 400 })
  }
  if (body.website) return NextResponse.json({ ok: true, reference: 'SO-0000' }) // honeypot

  const amount = Math.round(Number(body.amount) * 100) / 100
  const purchaserName = (body.purchaserName ?? '').trim()
  const purchaserPhone = (body.purchaserPhone ?? '').trim()
  const recipientName = (body.recipientName ?? '').trim().slice(0, 80) || null
  const recipientEmail = (body.recipientEmail ?? '').trim().slice(0, 200) || null
  const message = (body.message ?? '').trim().slice(0, 300) || null

  if (!Number.isFinite(amount) || amount < MIN_AMOUNT || amount > MAX_AMOUNT) {
    return NextResponse.json({ error: `Enter an amount between $${MIN_AMOUNT} and $${MAX_AMOUNT}.` }, { status: 400 })
  }
  if (purchaserName.length < 2 || purchaserName.length > 80) return NextResponse.json({ error: 'Please enter your full name.' }, { status: 400 })
  if (!/^[+\d][\d\s\-()]{6,19}$/.test(purchaserPhone)) return NextResponse.json({ error: 'Please enter a valid phone number.' }, { status: 400 })

  const service = createServiceClient(url, serviceKey, { auth: { persistSession: false } })

  // If the buyer is signed in, link the certificate to their account.
  let purchaserAuthUserId: string | null = null
  try {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    purchaserAuthUserId = user?.id ?? null
  } catch {
    // not signed in — fine, gift certs don't require an account
  }

  // Find-or-create the customer by phone (same pattern as checkout).
  let customerId: string | null = null
  const { data: existing } = await service.from('customers').select('id').eq('phone', purchaserPhone).limit(1)
  if (existing && existing.length > 0) {
    customerId = (existing[0] as { id: string }).id
  } else {
    const { data: created, error: custErr } = await service
      .from('customers')
      .insert({ name: purchaserName, phone: purchaserPhone, notes: 'Created by gift certificate purchase' })
      .select('id')
      .single()
    if (custErr || !created) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
    customerId = (created as { id: string }).id
  }

  const orderNotes = [
    'Website order — Gift Certificate — Cash on Delivery',
    `Amount: $${amount.toFixed(2)}`,
    recipientName ? `For: ${recipientName}${recipientEmail ? ` (${recipientEmail})` : ''}` : null,
    message ? `Message: ${message}` : null,
  ].filter(Boolean).join('\n')

  const { data: order, error: orderErr } = await service
    .from('sales_orders')
    .insert({ customer_id: customerId, status: 'draft', subtotal: amount, discount: 0, total: amount, notes: orderNotes })
    .select('id, reference')
    .single()
  if (orderErr || !order) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  const { id: soId, reference } = order as { id: string; reference: string }

  const { error: gcErr } = await service.from('gift_certificates').insert({
    initial_balance: amount, remaining_balance: amount,
    purchaser_auth_user_id: purchaserAuthUserId,
    purchaser_name: purchaserName, purchaser_phone: purchaserPhone,
    recipient_name: recipientName, recipient_email: recipientEmail, message,
    status: 'pending_payment', sales_order_id: soId,
  })
  if (gcErr) {
    await service.from('sales_orders').delete().eq('id', soId)
    return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  }

  return NextResponse.json({ ok: true, reference, amount })
}
