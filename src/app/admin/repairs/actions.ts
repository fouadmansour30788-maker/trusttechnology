'use server'
import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'

const STATUSES = ['received', 'diagnosing', 'awaiting_approval', 'repairing', 'ready', 'delivered', 'cancelled']

export async function updateRepair(id: string, fields: { status?: string; quote?: number | null; internal_notes?: string }) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: 'unauthorized' }

  const patch: Record<string, unknown> = { updated_at: new Date().toISOString() }
  if (fields.status && STATUSES.includes(fields.status)) patch.status = fields.status
  if (fields.quote !== undefined) patch.quote = fields.quote
  if (fields.internal_notes !== undefined) patch.internal_notes = fields.internal_notes.slice(0, 2000)

  const { error } = await supabase.from('repairs').update(patch).eq('id', id)
  if (error) return { error: error.message }
  revalidatePath('/admin/repairs')
  return { ok: true }
}
