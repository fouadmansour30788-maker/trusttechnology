import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { syncCompetitorPrices } from '@/lib/competitors'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'
export const maxDuration = 60

/** Vercel Cron entrypoint — authenticated by CRON_SECRET, writes via service role. */
export async function GET(req: Request) {
  const secret = process.env.CRON_SECRET
  if (!secret || req.headers.get('authorization') !== `Bearer ${secret}`) {
    return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  }
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !serviceKey) {
    return NextResponse.json({ error: 'SUPABASE_SERVICE_ROLE_KEY not configured' }, { status: 500 })
  }
  try {
    const supabase = createServiceClient(url, serviceKey, { auth: { persistSession: false } })
    const summary = await syncCompetitorPrices(supabase)
    return NextResponse.json({ ok: true, ...summary })
  } catch (e) {
    return NextResponse.json({ error: String(e).slice(0, 300) }, { status: 500 })
  }
}

/** Manual "Sync now" from the admin UI — authenticated staff session. */
export async function POST() {
  if (!isSupabaseConfigured()) {
    return NextResponse.json({ error: 'supabase not configured' }, { status: 500 })
  }
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  try {
    const summary = await syncCompetitorPrices(supabase)
    return NextResponse.json({ ok: true, ...summary })
  } catch (e) {
    return NextResponse.json({ error: String(e).slice(0, 300) }, { status: 500 })
  }
}
