'use client'
import { useState } from 'react'
import { MessageSquare, Loader2, CheckCircle2 } from 'lucide-react'

export type PublishedQA = { name: string; question: string; answer: string; answered_at: string | null }

export function ProductQA({ productId, questions }: { productId: string; questions: PublishedQA[] }) {
  const [name, setName] = useState('')
  const [question, setQuestion] = useState('')
  const [website, setWebsite] = useState('')
  const [sending, setSending] = useState(false)
  const [sent, setSent] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function ask(e: React.FormEvent) {
    e.preventDefault()
    setSending(true)
    setError(null)
    try {
      const res = await fetch('/api/questions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ productId, name, question, website }),
      })
      const data = await res.json()
      if (data.ok) setSent(true)
      else setError(typeof data.error === 'string' && data.error.length > 10 ? data.error : 'Could not send — try again.')
    } catch {
      setError('Could not send — try again.')
    } finally {
      setSending(false)
    }
  }

  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 pb-16">
      <h2 className="text-xl font-bold text-slate-900 mb-1 flex items-center gap-2">
        <MessageSquare size={18} className="text-blue-600" /> Questions & answers
      </h2>
      <p className="text-sm text-slate-400 mb-5">Answered by the Trust Technology team.</p>

      {questions.length > 0 && (
        <div className="space-y-4 mb-8">
          {questions.map((qa, i) => (
            <div key={i} className="bg-white border border-slate-200 rounded-2xl p-5">
              <p className="text-sm font-semibold text-slate-900">Q: {qa.question}</p>
              <p className="text-xs text-slate-400 mt-0.5">{qa.name}</p>
              <p className="text-sm text-slate-600 leading-relaxed mt-3 pl-3 border-l-2 border-blue-200">{qa.answer}</p>
            </div>
          ))}
        </div>
      )}

      {sent ? (
        <p className="flex items-center gap-2 text-sm text-emerald-700 bg-emerald-50 rounded-xl px-4 py-3">
          <CheckCircle2 size={16} /> Question sent — we’ll answer it here after review.
        </p>
      ) : (
        <form onSubmit={ask} className="bg-white border border-slate-200 rounded-2xl p-5 space-y-3 max-w-xl">
          <p className="text-sm font-semibold text-slate-900">Ask about this product</p>
          <input required value={name} onChange={(e) => setName(e.target.value)} placeholder="Your name" maxLength={60}
            className="w-full bg-white border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 outline-none focus:border-blue-400" />
          <textarea required value={question} onChange={(e) => setQuestion(e.target.value)} rows={2} maxLength={500}
            placeholder="e.g. Does it come with Windows installed? Can the RAM be upgraded?"
            className="w-full bg-white border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 outline-none focus:border-blue-400 resize-none" />
          <input value={website} onChange={(e) => setWebsite(e.target.value)} name="website" tabIndex={-1} autoComplete="off" className="hidden" aria-hidden="true" />
          {error && <p className="text-sm text-red-600">{error}</p>}
          <button type="submit" disabled={sending || question.trim().length < 5}
            className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-colors disabled:opacity-50">
            {sending ? <Loader2 size={14} className="animate-spin" /> : <MessageSquare size={14} />} Send question
          </button>
        </form>
      )}
    </section>
  )
}
