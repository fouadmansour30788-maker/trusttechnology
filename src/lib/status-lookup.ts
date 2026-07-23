import 'server-only'
import { createClient as createServiceClient } from '@supabase/supabase-js'

const digits = (s: string) => s.replace(/\D/g, '')

function service() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return null
  return createServiceClient(url, key, { auth: { persistSession: false } })
}

export type ChatStatusResult = {
  kind: 'order' | 'repair'
  reference: string
  statusLabel: string
  step: number
  totalSteps: number
  device?: string
  total?: number
  quote?: number | null
  items?: { name: string; quantity: number }[]
}

type LookupResult = { ok: true; result: ChatStatusResult } | { ok: false; error: string }

const ORDER_STATUS_LABELS: Record<string, { label: string; step: number }> = {
  draft: { label: 'Received — we’ll call you to confirm', step: 1 },
  confirmed: { label: 'Confirmed — preparing your order', step: 2 },
  fulfilled: { label: 'Delivered', step: 3 },
  cancelled: { label: 'Cancelled', step: 0 },
}

const REPAIR_STATUS_LABELS: Record<string, { label: string; step: number }> = {
  received: { label: 'Received — we’ll call to arrange drop-off or pickup', step: 1 },
  diagnosing: { label: 'Diagnosing the fault', step: 2 },
  awaiting_approval: { label: 'Diagnosis done — waiting for your approval of the quote', step: 2 },
  repairing: { label: 'Being repaired', step: 3 },
  ready: { label: 'Ready for pickup / delivery', step: 4 },
  delivered: { label: 'Delivered', step: 4 },
  cancelled: { label: 'Cancelled', step: 0 },
}

/**
 * Order/repair status for the chat concierge. Deliberately its own read-only
 * queries rather than sharing code with /api/track and /api/repairs — same
 * matching rule (reference + last-8-digits phone match) reimplemented here so
 * this chat feature can never affect those existing tracking endpoints.
 */
export async function lookupOrderStatus(reference: string, phone: string): Promise<LookupResult> {
  const ref = reference.trim().toUpperCase()
  const ph = digits(phone)
  if (!/^SO-\d{1,8}$/.test(ref) || ph.length < 7) {
    return { ok: false, error: 'That doesn’t look like a valid order number and phone — order numbers look like SO-0012.' }
  }
  const supabase = service()
  if (!supabase) return { ok: false, error: 'Order tracking is temporarily unavailable — contact us on WhatsApp.' }

  const { data } = await supabase
    .from('sales_orders')
    .select('reference, status, total, customer:customers(phone), sales_order_items(quantity, product:products(name))')
    .eq('reference', ref)
    .maybeSingle()

  const notFound: LookupResult = { ok: false, error: `No order found for ${ref} with that phone number.` }
  if (!data) return notFound

  type Row = {
    reference: string; status: string; total: number
    customer: { phone: string | null } | null
    sales_order_items: { quantity: number; product: { name: string } | null }[]
  }
  const order = data as unknown as Row
  const customerPhone = digits(order.customer?.phone ?? '')
  if (!customerPhone || customerPhone.slice(-8) !== ph.slice(-8)) return notFound

  const st = ORDER_STATUS_LABELS[order.status] ?? { label: order.status, step: 1 }
  return {
    ok: true,
    result: {
      kind: 'order',
      reference: order.reference,
      statusLabel: st.label,
      step: st.step,
      totalSteps: 3,
      total: Number(order.total),
      items: (order.sales_order_items ?? []).map((it) => ({ name: it.product?.name ?? 'Item', quantity: it.quantity })),
    },
  }
}

export async function lookupRepairStatus(reference: string, phone: string): Promise<LookupResult> {
  const ref = reference.trim().toUpperCase()
  const ph = digits(phone)
  if (!/^REP-\d{1,8}$/.test(ref) || ph.length < 7) {
    return { ok: false, error: 'That doesn’t look like a valid repair number and phone — repair numbers look like REP-0003.' }
  }
  const supabase = service()
  if (!supabase) return { ok: false, error: 'Repair tracking is temporarily unavailable — contact us on WhatsApp.' }

  const { data } = await supabase
    .from('repairs')
    .select('reference, phone, device, status, quote')
    .eq('reference', ref)
    .maybeSingle()

  const notFound: LookupResult = { ok: false, error: `No repair found for ${ref} with that phone number.` }
  if (!data) return notFound

  const row = data as { reference: string; phone: string; device: string; status: string; quote: number | null }
  if (digits(row.phone).slice(-8) !== ph.slice(-8)) return notFound

  const st = REPAIR_STATUS_LABELS[row.status] ?? { label: row.status, step: 1 }
  return {
    ok: true,
    result: {
      kind: 'repair',
      reference: row.reference,
      statusLabel: st.label,
      step: st.step,
      totalSteps: 4,
      device: row.device,
      quote: row.status === 'awaiting_approval' && row.quote ? Number(row.quote) : null,
    },
  }
}

/** Reference number mentioned in free text — "SO-0012" or "REP-3" (chat may type it loosely). */
export function extractReference(text: string): { kind: 'order' | 'repair'; reference: string } | null {
  const so = text.match(/\bSO-\s?\d{1,8}\b/i)
  if (so) return { kind: 'order', reference: so[0].toUpperCase().replace(/\s+/g, '') }
  const rep = text.match(/\bREP-\s?\d{1,8}\b/i)
  if (rep) return { kind: 'repair', reference: rep[0].toUpperCase().replace(/\s+/g, '') }
  return null
}

/** Best phone-looking number in free text, ignoring a reference substring if one was already found. */
export function extractPhone(text: string, exclude?: string): string | null {
  const cleaned = exclude ? text.replace(exclude, ' ') : text
  const candidates = cleaned.match(/\+?\d[\d\s-]{5,}\d/g) ?? []
  let best: string | null = null
  let bestDigits = 0
  for (const c of candidates) {
    const d = c.replace(/\D/g, '')
    if (d.length >= 7 && d.length > bestDigits) {
      best = c
      bestDigits = d.length
    }
  }
  return best
}

/** Loose "where's my order/repair" intent, for when no reference number is present yet. */
export function looksLikeStatusIntent(text: string): boolean {
  return /\b(track(ing)?|status|where('?s| is)?\s+my|my order|my repair|order number|repair number)\b/i.test(text)
}
