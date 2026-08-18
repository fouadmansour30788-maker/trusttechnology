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

/** Submit a B2B / bulk order quote request (public). */
export async function POST(req: Request) {
  const supabase = service()
  if (!supabase) return NextResponse.json({ error: 'unavailable' }, { status: 500 })

  let body: { companyName?: string; contactName?: string; phone?: string; email?: string; details?: string; budget?: string; website?: string }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid' }, { status: 400 })
  }
  if (body.website) return NextResponse.json({ ok: true, reference: 'QR-0000' }) // honeypot

  const companyName = (body.companyName ?? '').trim()
  const contactName = (body.contactName ?? '').trim()
  const phone = (body.phone ?? '').trim()
  const email = (body.email ?? '').trim()
  const details = (body.details ?? '').trim()
  const budget = (body.budget ?? '').trim()

  if (companyName.length < 2 || companyName.length > 120) return NextResponse.json({ error: 'Please enter your company name.' }, { status: 400 })
  if (contactName.length < 2 || contactName.length > 80) return NextResponse.json({ error: 'Please enter a contact name.' }, { status: 400 })
  if (digits(phone).length < 7) return NextResponse.json({ error: 'Please enter a valid phone number.' }, { status: 400 })
  if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) return NextResponse.json({ error: 'Please enter a valid email, or leave it blank.' }, { status: 400 })
  if (details.length < 10 || details.length > 2000) return NextResponse.json({ error: 'Tell us what you need — products, quantities, timeline.' }, { status: 400 })

  const { data, error } = await supabase
    .from('quote_requests')
    .insert({
      company_name: companyName, contact_name: contactName, phone, email: email || null,
      details: details.slice(0, 2000), budget: budget.slice(0, 200) || null,
    })
    .select('reference')
    .single()
  if (error || !data) return NextResponse.json({ error: 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true, reference: (data as { reference: string }).reference })
}
