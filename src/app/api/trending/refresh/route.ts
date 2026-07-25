import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { refreshSearchTrending } from '@/lib/trending'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'
export const maxDuration = 60

/** Vercel Cron entrypoint — authenticated by CRON_SECRET. */
export async function GET(req: Request) {
  const secret = process.env.CRON_SECRET
  if (!secret || req.headers.get('authorization') !== `Bearer ${secret}`) {
    return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  }
  const result = await refreshSearchTrending()
  return NextResponse.json(result)
}

/** Manual "Refresh trends" from the admin UI — authenticated staff session. */
export async function POST() {
  if (!isSupabaseConfigured()) {
    return NextResponse.json({ error: 'supabase not configured' }, { status: 500 })
  }
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  const result = await refreshSearchTrending()
  return NextResponse.json(result)
}
