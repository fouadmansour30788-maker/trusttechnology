import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/** Submit a product review (public — moderated before it appears). */
export async function POST(req: Request) {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  let body: { productId?: string; name?: string; rating?: number; comment?: string; website?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  if (body.website) return NextResponse.json({ ok: true }) // honeypot

  const name = (body.name ?? '').trim()
  const comment = (body.comment ?? '').trim()
  const rating = Math.round(Number(body.rating))
  if (!body.productId || !/^[0-9a-f-]{36}$/i.test(body.productId)) return NextResponse.json({ error: 'invalid' }, { status: 400 })
  if (name.length < 2 || name.length > 60) return NextResponse.json({ error: 'Please enter your name.' }, { status: 400 })
  if (!Number.isFinite(rating) || rating < 1 || rating > 5) return NextResponse.json({ error: 'Please choose a star rating.' }, { status: 400 })
  if (comment.length > 1000) return NextResponse.json({ error: 'Comment is too long.' }, { status: 400 })

  const supabase = createServiceClient(url, key, { auth: { persistSession: false } })
  const { error } = await supabase.from('reviews').insert({
    product_id: body.productId, customer_name: name, rating, comment: comment || null,
  })
  if (error) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true })
}
