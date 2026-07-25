import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

function service() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return null
  return createServiceClient(url, key, { auth: { persistSession: false } })
}

/** Subscribe to a restock / price-drop email alert for one product. */
export async function POST(req: Request) {
  const supabase = service()
  if (!supabase) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  let body: { productId?: string; email?: string; kind?: string; website?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  if (body.website) return NextResponse.json({ ok: true }) // honeypot

  const productId = (body.productId ?? '').trim()
  const email = (body.email ?? '').trim().toLowerCase()
  const kind = body.kind === 'restock' || body.kind === 'price_drop' ? body.kind : null
  if (!productId || !EMAIL_RE.test(email) || email.length > 200 || !kind) {
    return NextResponse.json({ error: 'Enter a valid email address.' }, { status: 400 })
  }

  const { data: product } = await supabase.from('products').select('id').eq('id', productId).maybeSingle()
  if (!product) return NextResponse.json({ error: 'Product not found.' }, { status: 404 })

  const { data: existing } = await supabase
    .from('stock_alerts')
    .select('id')
    .eq('product_id', productId)
    .eq('email', email)
    .eq('kind', kind)
    .is('notified_at', null)
    .maybeSingle()
  if (existing) return NextResponse.json({ ok: true })

  const { error } = await supabase.from('stock_alerts').insert({ product_id: productId, email, kind })
  if (error) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true })
}
