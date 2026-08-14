'use server'
import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'

async function authed() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Not authenticated')
  return supabase
}

export async function updateSalesOrderStatus(id: string, status: string): Promise<{ ok?: true; error?: string }> {
  try {
    const supabase = await authed()
    const { error } = await supabase.from('sales_orders').update({ status }).eq('id', id)
    if (error) return { error: error.message }
    revalidatePath('/admin/sales')
    revalidatePath(`/admin/sales/${id}`)
    return { ok: true }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Update failed' }
  }
}
