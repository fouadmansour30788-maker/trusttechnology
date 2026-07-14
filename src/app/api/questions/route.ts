import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/** Ask a question about a product (public — moderated before it appears). */
export async function POST(req: Request) {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  let body: { productId?: string; name?: string; question?: string; website?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  if (body.website) return NextResponse.json({ ok: true }) // honeypot

  const name = (body.name ?? '').trim()
  const question = (body.question ?? '').trim()
  if (!body.productId || !/^[0-9a-f-]{36}$/i.test(body.productId)) return NextResponse.json({ error: 'invalid' }, { status: 400 })
  if (name.length < 2 || name.length > 60) return NextResponse.json({ error: 'Please enter your name.' }, { status: 400 })
  if (question.length < 5 || question.length > 500) return NextResponse.json({ error: 'Please write your question (a sentence or two).' }, { status: 400 })

  const supabase = createServiceClient(url, key, { auth: { persistSession: false } })
  const { error } = await supabase.from('product_questions').insert({ product_id: body.productId, name, question })
  if (error) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true })
}
