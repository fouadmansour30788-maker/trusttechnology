import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import { isSupabaseConfigured } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/** Read-only balance check for the checkout preview — redemption itself happens atomically inside /api/checkout. */
export async function GET(req: Request) {
  if (!isSupabaseConfigured()) return NextResponse.json({ valid: false })
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL!
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!serviceKey) return NextResponse.json({ valid: false })

  const code = new URL(req.url).searchParams.get('code')?.trim().toUpperCase()
  if (!code) return NextResponse.json({ valid: false, error: 'Enter a code.' })

  const service = createServiceClient(url, serviceKey, { auth: { persistSession: false } })
  const { data } = await service
    .from('gift_certificates')
    .select('remaining_balance, status')
    .eq('code', code)
    .maybeSingle()

  const row = data as { remaining_balance: number; status: string } | null
  if (!row) return NextResponse.json({ valid: false, error: 'Code not found.' })
  if (row.status !== 'active') return NextResponse.json({ valid: false, error: 'This certificate is not active.' })
  if (Number(row.remaining_balance) <= 0) return NextResponse.json({ valid: false, error: 'No balance remaining.' })

  return NextResponse.json({ valid: true, remainingBalance: Number(row.remaining_balance) })
}
