'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { Send, Trash2, CheckCircle2 } from 'lucide-react'
import { answerQuestion, deleteQuestion } from '@/app/admin/questions/actions'

export type QuestionRow = {
  id: string; name: string; question: string; answer: string | null
  is_published: boolean; created_at: string
  product: { name: string; slug: string } | null
}

function Row({ q }: { q: QuestionRow }) {
  const router = useRouter()
  const [answer, setAnswer] = useState(q.answer ?? '')
  const [pending, startTransition] = useTransition()

  function submit(publish: boolean) {
    if (answer.trim().length < 2) return
    startTransition(async () => {
      await answerQuestion(q.id, answer, publish)
      router.refresh()
    })
  }
  function remove() {
    if (!confirm('Delete this question?')) return
    startTransition(async () => {
      await deleteQuestion(q.id)
      router.refresh()
    })
  }

  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5">
      <div className="flex items-start justify-between gap-3">
        <div className="min-w-0">
          <p className="text-sm font-semibold text-slate-900">{q.question}</p>
          <p className="text-xs text-slate-400 mt-1">
            {q.name} · {new Date(q.created_at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short' })} · on{' '}
            {q.product ? (
              <Link href={`/products/${q.product.slug}`} target="_blank" className="text-blue-600 hover:underline">{q.product.name}</Link>
            ) : 'deleted product'}
            {q.is_published && <span className="ml-2 inline-flex items-center gap-1 text-emerald-600 font-medium"><CheckCircle2 size={11} /> published</span>}
          </p>
        </div>
        <button onClick={remove} className="p-1.5 text-slate-300 hover:text-red-600 shrink-0"><Trash2 size={15} /></button>
      </div>
      <div className="flex gap-2 mt-3">
        <input value={answer} onChange={(e) => setAnswer(e.target.value)} placeholder="Write the answer…" maxLength={1000}
          className="flex-1 bg-white border border-slate-200 rounded-lg px-3 py-2 text-sm text-slate-700 outline-none focus:border-blue-400" />
        <button onClick={() => submit(true)} disabled={pending || answer.trim().length < 2}
          className="inline-flex items-center gap-1.5 bg-blue-600 hover:bg-blue-700 text-white text-xs font-semibold px-3.5 py-2 rounded-lg disabled:opacity-50">
          <Send size={12} /> {q.is_published ? 'Update' : 'Answer & publish'}
        </button>
      </div>
    </div>
  )
}

export function QuestionsManager({ questions }: { questions: QuestionRow[] }) {
  const [filter, setFilter] = useState<'pending' | 'published' | 'all'>('pending')
  const shown = questions.filter((q) =>
    filter === 'all' ? true : filter === 'pending' ? !q.is_published : q.is_published
  )
  return (
    <>
      <div className="flex gap-2 mb-5">
        {(['pending', 'published', 'all'] as const).map((f) => (
          <button key={f} onClick={() => setFilter(f)}
            className={`text-xs font-medium rounded-full px-3 py-1.5 border capitalize transition-colors ${filter === f ? 'bg-blue-600 text-white border-blue-600' : 'text-slate-500 border-slate-200 hover:border-blue-300'}`}>
            {f}
          </button>
        ))}
      </div>
      {shown.length === 0 ? (
        <p className="text-sm text-slate-400 py-16 text-center bg-white border border-slate-200 rounded-2xl">No questions here.</p>
      ) : (
        <div className="space-y-3">{shown.map((q) => <Row key={q.id} q={q} />)}</div>
      )}
    </>
  )
}
