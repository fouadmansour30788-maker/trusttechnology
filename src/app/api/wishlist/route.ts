import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

async function requireUser() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  return user ? { supabase, user } : null
}

/** Product IDs the signed-in customer has wishlisted. */
export async function GET() {
  if (!isSupabaseConfigured()) return NextResponse.json({ ids: [] })
  const ctx = await requireUser()
  if (!ctx) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  const { data } = await ctx.supabase.from('wishlist_items').select('product_id').eq('auth_user_id', ctx.user.id)
  return NextResponse.json({ ids: ((data as { product_id: string }[]) ?? []).map((r) => r.product_id) })
}

export async function POST(req: Request) {
  const ctx = await requireUser()
  if (!ctx) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  let body: { productId?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  const productId = (body.productId ?? '').trim()
  if (!productId) return NextResponse.json({ error: 'missing productId' }, { status: 400 })
  const { error } = await ctx.supabase.from('wishlist_items').insert({ auth_user_id: ctx.user.id, product_id: productId })
  if (error && !error.message.includes('duplicate')) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true })
}

export async function DELETE(req: Request) {
  const ctx = await requireUser()
  if (!ctx) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  const productId = new URL(req.url).searchParams.get('productId')
  if (!productId) return NextResponse.json({ error: 'missing productId' }, { status: 400 })
  const { error } = await ctx.supabase.from('wishlist_items').delete().eq('auth_user_id', ctx.user.id).eq('product_id', productId)
  if (error) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true })
}
