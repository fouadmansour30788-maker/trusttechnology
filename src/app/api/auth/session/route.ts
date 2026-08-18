import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/** Lightweight session check the navbar uses to decide Login/Sign up vs. account icon. */
export async function GET() {
  if (!isSupabaseConfigured()) return NextResponse.json({ loggedIn: false })
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ loggedIn: false })
  const { data: customer } = await supabase.from('customers').select('name').eq('auth_user_id', user.id).maybeSingle()
  const name = (customer as { name?: string } | null)?.name ?? null
  return NextResponse.json({ loggedIn: true, name })
}
