import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/**
 * Links the just-registered auth user to a `customers` row — creates one, or
 * attaches to an existing guest row that matches by phone (e.g. they'd
 * already ordered by COD before creating an account), so past orders show
 * up in their new account. Runs via service role since `customers` writes
 * aren't open to the anon key.
 */
export async function POST(req: Request) {
  if (!isSupabaseConfigured()) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL!
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!serviceKey) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })

  let body: { name?: string; phone?: string }
  try {
    body = await req.json()
  } catch {
    body = {}
  }
  const name = (body.name ?? '').trim().slice(0, 80)
  const phone = (body.phone ?? '').trim().slice(0, 30)

  const service = createServiceClient(url, serviceKey, { auth: { persistSession: false } })

  // Already linked (e.g. re-called on a later login) — no-op.
  const { data: already } = await service.from('customers').select('id').eq('auth_user_id', user.id).maybeSingle()
  if (already) return NextResponse.json({ ok: true })

  // Attach to an existing guest customer row matching phone, if any.
  if (phone) {
    const { data: guest } = await service.from('customers').select('id, auth_user_id').eq('phone', phone).is('auth_user_id', null).limit(1)
    if (guest && guest.length > 0) {
      const { error } = await service.from('customers').update({ auth_user_id: user.id, email: user.email }).eq('id', (guest[0] as { id: string }).id)
      if (!error) return NextResponse.json({ ok: true })
    }
  }

  const { error } = await service.from('customers').insert({
    name: name || user.email || 'Customer',
    email: user.email,
    phone: phone || null,
    auth_user_id: user.id,
    notes: 'Created via account sign-up',
  })
  if (error) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true })
}
