import { NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { addExternalTrendingItem, deleteExternalTrendingItem, type ExternalSource } from '@/lib/trending'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

async function requireStaff() {
  if (!isSupabaseConfigured()) return null
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  return user ? supabase : null
}

/** Staff-curated Amazon/AliExpress trending item (no viable auto-fetch for either). */
export async function POST(req: Request) {
  const supabase = await requireStaff()
  if (!supabase) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })

  let body: { source?: string; name?: string; price?: number | null; url?: string; imageUrl?: string | null; note?: string | null }
  try {
    body = await req.json()
  } catch {
    return NextResponse.json({ error: 'invalid request' }, { status: 400 })
  }
  const source = body.source
  const name = (body.name ?? '').trim()
  const url = (body.url ?? '').trim()
  if ((source !== 'amazon' && source !== 'aliexpress') || !name || !/^https?:\/\//.test(url)) {
    return NextResponse.json({ error: 'Provide a name, a valid URL, and a source (amazon or aliexpress).' }, { status: 400 })
  }
  const price = typeof body.price === 'number' && body.price > 0 ? body.price : null

  const result = await addExternalTrendingItem(supabase, {
    source: source as ExternalSource,
    name: name.slice(0, 200),
    price,
    url,
    imageUrl: body.imageUrl?.trim() || null,
    note: body.note?.trim().slice(0, 300) || null,
  })
  if (!result.ok) return NextResponse.json({ error: result.error ?? 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true })
}

export async function DELETE(req: Request) {
  const supabase = await requireStaff()
  if (!supabase) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })

  const id = new URL(req.url).searchParams.get('id')
  if (!id) return NextResponse.json({ error: 'missing id' }, { status: 400 })

  const result = await deleteExternalTrendingItem(supabase, id)
  if (!result.ok) return NextResponse.json({ error: result.error ?? 'unavailable' }, { status: 500 })
  return NextResponse.json({ ok: true })
}
