import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

// Below this many completed repairs, a percentage is more noise than signal —
// hide the banner rather than show a misleading "100% within 48h" from 1 job.
const MIN_SAMPLE = 5
const WINDOW_DAYS = 90
const TURNAROUND_TARGET_HOURS = 48

/**
 * Real repair turnaround stats for the /repairs trust banner. `updated_at` is
 * explicitly stamped by admin/repairs/actions.ts on every status change, so
 * for repairs that reached ready/delivered it reliably marks completion time.
 */
export async function GET() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return NextResponse.json({ available: false })

  try {
    const supabase = createServiceClient(url, key, { auth: { persistSession: false } })
    const since = new Date(Date.now() - WINDOW_DAYS * 24 * 3600 * 1000).toISOString()
    const { data } = await supabase
      .from('repairs')
      .select('created_at, updated_at, status')
      .in('status', ['ready', 'delivered'])
      .gte('created_at', since)

    type Row = { created_at: string; updated_at: string; status: string }
    const rows = (data as Row[]) ?? []
    if (rows.length < MIN_SAMPLE) return NextResponse.json({ available: false })

    const hours = rows.map((r) => (new Date(r.updated_at).getTime() - new Date(r.created_at).getTime()) / 3600000).filter((h) => h >= 0)
    if (hours.length < MIN_SAMPLE) return NextResponse.json({ available: false })

    const withinTarget = hours.filter((h) => h <= TURNAROUND_TARGET_HOURS).length
    const avgHours = hours.reduce((s, h) => s + h, 0) / hours.length

    return NextResponse.json(
      {
        available: true,
        sampleSize: hours.length,
        windowDays: WINDOW_DAYS,
        targetHours: TURNAROUND_TARGET_HOURS,
        withinTargetPct: Math.round((withinTarget / hours.length) * 100),
        avgHours: Math.round(avgHours * 10) / 10,
      },
      { headers: { 'Cache-Control': 's-maxage=3600, stale-while-revalidate=7200' } }
    )
  } catch {
    return NextResponse.json({ available: false })
  }
}
