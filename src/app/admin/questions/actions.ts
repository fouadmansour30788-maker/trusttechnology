'use server'
import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'

async function staff() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('unauthorized')
  return supabase
}

export async function answerQuestion(id: string, answer: string, publish: boolean) {
  const supabase = await staff()
  const { error } = await supabase
    .from('product_questions')
    .update({ answer: answer.trim().slice(0, 1000), is_published: publish, answered_at: new Date().toISOString() })
    .eq('id', id)
  if (error) return { error: error.message }
  revalidatePath('/admin/questions')
  return { ok: true }
}

export async function deleteQuestion(id: string) {
  const supabase = await staff()
  const { error } = await supabase.from('product_questions').delete().eq('id', id)
  if (error) return { error: error.message }
  revalidatePath('/admin/questions')
  return { ok: true }
}
