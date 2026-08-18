import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/** Points balance for the signed-in customer (checkout page reads this to offer redemption). */
export async function GET() {
  if (!isSupabaseConfigured()) return NextResponse.json({ loggedIn: false, balance: 0 })
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ loggedIn: false, balance: 0 })
  const { data } = await supabase.from('customers').select('points_balance').eq('auth_user_id', user.id).maybeSingle()
  const balance = Number((data as { points_balance?: number } | null)?.points_balance ?? 0)
  return NextResponse.json({ loggedIn: true, balance })
}
