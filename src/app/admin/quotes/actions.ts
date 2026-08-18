'use server'
import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'

async function requireStaff() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return null
  return supabase
}

export async function updateQuoteStatus(id: string, status: string) {
  const supabase = await requireStaff()
  if (!supabase) return { error: 'unauthorized' }
  const { error } = await supabase.from('quote_requests').update({ status, updated_at: new Date().toISOString() }).eq('id', id)
  if (error) return { error: error.message }
  revalidatePath('/admin/quotes')
  return { ok: true }
}

export async function updateQuoteNotes(id: string, internalNotes: string) {
  const supabase = await requireStaff()
  if (!supabase) return { error: 'unauthorized' }
  const { error } = await supabase.from('quote_requests').update({ internal_notes: internalNotes, updated_at: new Date().toISOString() }).eq('id', id)
  if (error) return { error: error.message }
  revalidatePath('/admin/quotes')
  return { ok: true }
}
