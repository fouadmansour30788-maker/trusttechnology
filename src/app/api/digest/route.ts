import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'
export const maxDuration = 60

/**
 * Daily owner digest (Vercel Cron). Composes yesterday's numbers and emails
 * them via Resend when RESEND_API_KEY + DIGEST_EMAIL are configured;
 * otherwise returns the digest JSON (visible in cron logs) without sending.
 */
export async function GET(req: Request) {
  const secret = process.env.CRON_SECRET
  if (!secret || req.headers.get('authorization') !== `Bearer ${secret}`) {
    return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  }
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !serviceKey) return NextResponse.json({ error: 'not configured' }, { status: 500 })

  const s = createServiceClient(url, serviceKey, { auth: { persistSession: false } })
  const dayAgo = new Date(Date.now() - 24 * 3600 * 1000).toISOString()

  const [ordersRes, pendingRes, lowRes, changesRes] = await Promise.all([
    s.from('sales_orders').select('total, status').gte('created_at', dayAgo).neq('status', 'cancelled'),
    s.from('sales_orders').select('id', { count: 'exact', head: true }).eq('status', 'draft'),
    s.from('products').select('id', { count: 'exact', head: true }).gt('stock', 0).lte('stock', 5).eq('is_active', true),
    s.from('competitor_prices').select('name, competitor, price, previous_price').gte('price_changed_at', dayAgo).order('price_changed_at', { ascending: false }).limit(5),
  ])

  const orders = (ordersRes.data as { total: number; status: string }[]) ?? []
  const revenue = Math.round(orders.reduce((sum, o) => sum + Number(o.total), 0))
  const changes = (changesRes.data as { name: string; competitor: string; price: number; previous_price: number }[]) ?? []

  const lines = [
    `Trust Technology — daily digest`,
    ``,
    `Last 24 hours:`,
    `• Orders: ${orders.length}${orders.length ? ` — $${revenue.toLocaleString()} revenue` : ''}`,
    `• Open (unconfirmed) orders needing action: ${pendingRes.count ?? 0}`,
    `• Low-stock products (≤5 units): ${lowRes.count ?? 0}`,
    changes.length
      ? `• Competitor price changes: ${changes.length}\n${changes.map((c) => `   - ${c.competitor}: ${c.name.slice(0, 50)} $${c.previous_price} → $${c.price}`).join('\n')}`
      : `• Competitor price changes: none detected`,
    ``,
    `Admin: https://trusttechnology.vercel.app/admin`,
  ]
  const text = lines.join('\n')

  const resendKey = process.env.RESEND_API_KEY
  const to = process.env.DIGEST_EMAIL
  if (resendKey && to) {
    try {
      const res = await fetch('https://api.resend.com/emails', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${resendKey}` },
        body: JSON.stringify({
          from: 'Trust Technology <onboarding@resend.dev>',
          to: [to],
          subject: `Daily digest — ${orders.length} orders, $${revenue.toLocaleString()}`,
          text,
        }),
      })
      return NextResponse.json({ ok: true, emailed: res.ok, digest: text })
    } catch {
      return NextResponse.json({ ok: true, emailed: false, digest: text })
    }
  }
  return NextResponse.json({ ok: true, emailed: false, note: 'Set RESEND_API_KEY + DIGEST_EMAIL to receive this by email.', digest: text })
}
