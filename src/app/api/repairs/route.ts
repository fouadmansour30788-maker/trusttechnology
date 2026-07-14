import { NextResponse } from 'next/server'
import { createClient as createServiceClient } from '@supabase/supabase-js'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

const digits = (s: string) => s.replace(/\D/g, '')

function service() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return null
  return createServiceClient(url, key, { auth: { persistSession: false } })
}

/** Book a repair (public). */
export async function POST(req: Request) {
  const supabase = service()
  if (!supabase) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  let body: { name?: string; phone?: string; device?: string; problem?: string; website?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  if (body.website) return NextResponse.json({ ok: true, reference: 'REP-0000' }) // honeypot

  const name = (body.name ?? '').trim()
  const phone = (body.phone ?? '').trim()
  const device = (body.device ?? '').trim()
  const problem = (body.problem ?? '').trim()
  if (name.length < 2 || name.length > 80) return NextResponse.json({ error: 'Please enter your name.' }, { status: 400 })
  if (digits(phone).length < 7) return NextResponse.json({ error: 'Please enter a valid phone number.' }, { status: 400 })
  if (device.length < 2 || device.length > 120) return NextResponse.json({ error: 'What device is it? (e.g. HP 15 laptop)' }, { status: 400 })
  if (problem.length < 5 || problem.length > 1000) return NextResponse.json({ error: 'Describe the problem in a sentence or two.' }, { status: 400 })

  const { data, error } = await supabase
    .from('repairs')
    .insert({ customer_name: name, phone, device: device.slice(0, 120), problem: problem.slice(0, 1000) })
    .select('reference')
    .single()
  if (error || !data) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true, reference: (data as { reference: string }).reference })
}

const PUBLIC_STATUS: Record<string, { label: string; step: number }> = {
  received: { label: 'Received — we’ll call to arrange drop-off or pickup', step: 1 },
  diagnosing: { label: 'Diagnosing the fault', step: 2 },
  awaiting_approval: { label: 'Diagnosis done — waiting for your approval of the quote', step: 2 },
  repairing: { label: 'Being repaired', step: 3 },
  ready: { label: 'Ready for pickup / delivery', step: 4 },
  delivered: { label: 'Delivered', step: 4 },
  cancelled: { label: 'Cancelled', step: 0 },
}

/** Track a repair (public): reference + phone. */
export async function PUT(req: Request) {
  const supabase = service()
  if (!supabase) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  let body: { reference?: string; phone?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  const reference = (body.reference ?? '').trim().toUpperCase()
  const phone = digits(body.phone ?? '')
  if (!/^REP-\d{1,8}$/.test(reference) || phone.length < 7) {
    return NextResponse.json({ error: 'Enter your repair number (e.g. REP-0003) and the phone you booked with.' }, { status: 400 })
  }

  const { data } = await supabase
    .from('repairs')
    .select('reference, phone, device, status, quote, created_at')
    .eq('reference', reference)
    .maybeSingle()
  const notFound = NextResponse.json({ error: 'No repair found for that number and phone.' }, { status: 404 })
  if (!data) return notFound
  const row = data as { reference: string; phone: string; device: string; status: string; quote: number | null; created_at: string }
  if (digits(row.phone).slice(-8) !== phone.slice(-8)) return notFound

  const st = PUBLIC_STATUS[row.status] ?? { label: row.status, step: 1 }
  return NextResponse.json({
    ok: true,
    reference: row.reference,
    device: row.device,
    status: row.status,
    statusLabel: st.label,
    step: st.step,
    quote: row.status === 'awaiting_approval' && row.quote ? Number(row.quote) : null,
    bookedAt: row.created_at,
  })
}
