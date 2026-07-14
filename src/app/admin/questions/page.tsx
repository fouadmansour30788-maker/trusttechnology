import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { QuestionsManager, type QuestionRow } from '@/components/admin/QuestionsManager'

export const dynamic = 'force-dynamic'

export default async function AdminQuestionsPage() {
  let questions: QuestionRow[] = []
  if (isSupabaseConfigured()) {
    const supabase = await createClient()
    const { data } = await supabase
      .from('product_questions')
      .select('id, name, question, answer, is_published, created_at, product:products(name, slug)')
      .order('created_at', { ascending: false })
      .limit(200)
    questions = (data as unknown as QuestionRow[]) ?? []
  }
  return (
    <div className="p-8">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Product Q&A</h1>
        <p className="text-slate-500 text-sm mt-0.5">
          Customer questions from product pages — answer & publish to show them on the storefront.
          {questions.length === 0 && ' If the table doesn’t exist yet, run supabase/migrations/009_repairs_questions.sql.'}
        </p>
      </div>
      <QuestionsManager questions={questions} />
    </div>
  )
}
