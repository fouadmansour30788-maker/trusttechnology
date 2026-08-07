'use server'
import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'

async function authed() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Not authenticated')
  return supabase
}

function generateCode(): string {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789' // no 0/O/1/I ambiguity
  let s = ''
  for (let i = 0; i < 8; i++) s += chars[Math.floor(Math.random() * chars.length)]
  return `GC-${s}`
}

/** Staff confirms payment came through by phone (same as any COD order) — reveals the redeemable code. */
export async function activateGiftCertificate(id: string): Promise<{ ok?: true; code?: string; error?: string }> {
  try {
    const supabase = await authed()
    const { data: gc, error: fetchErr } = await supabase
      .from('gift_certificates').select('status, sales_order_id').eq('id', id).maybeSingle()
    if (fetchErr || !gc) return { error: 'Not found' }
    if ((gc as { status: string }).status !== 'pending_payment') return { error: 'Already processed' }

    let code = generateCode()
    for (let attempt = 0; attempt < 5; attempt++) {
      const { error } = await supabase
        .from('gift_certificates')
        .update({ status: 'active', code, activated_at: new Date().toISOString() })
        .eq('id', id)
      if (!error) break
      if (!error.message.includes('duplicate')) return { error: error.message }
      code = generateCode() // code collision — regenerate and retry
    }

    const soId = (gc as { sales_order_id: string | null }).sales_order_id
    if (soId) await supabase.from('sales_orders').update({ status: 'confirmed' }).eq('id', soId)

    revalidatePath('/admin/gift-certificates')
    return { ok: true, code }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Activation failed' }
  }
}

export async function cancelGiftCertificate(id: string): Promise<{ ok?: true; error?: string }> {
  try {
    const supabase = await authed()
    const { error } = await supabase.from('gift_certificates').update({ status: 'cancelled' }).eq('id', id).eq('status', 'pending_payment')
    if (error) return { error: error.message }
    revalidatePath('/admin/gift-certificates')
    return { ok: true }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Cancel failed' }
  }
}
