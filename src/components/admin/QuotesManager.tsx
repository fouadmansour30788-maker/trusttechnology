'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { MessageCircle, Mail, Loader2 } from 'lucide-react'
import { updateQuoteStatus, updateQuoteNotes } from '@/app/admin/quotes/actions'

export type QuoteRow = {
  id: string; reference: string; company_name: string; contact_name: string
  phone: string; email: string | null; details: string; budget: string | null
  status: string; internal_notes: string | null; created_at: string
}

const STATUSES = [
  { id: 'new', label: 'New' },
  { id: 'contacted', label: 'Contacted' },
  { id: 'quoted', label: 'Quoted' },
  { id: 'won', label: 'Won' },
  { id: 'lost', label: 'Lost' },
]

const STATUS_CLS: Record<string, string> = {
  new: 'bg-blue-50 text-blue-700',
  contacted: 'bg-amber-50 text-amber-700',
  quoted: 'bg-purple-50 text-purple-700',
  won: 'bg-emerald-50 text-emerald-700',
  lost: 'bg-slate-100 text-slate-500',
}

function Row({ q }: { q: QuoteRow }) {
  const router = useRouter()
  const [status, setStatus] = useState(q.status)
  const [notes, setNotes] = useState(q.internal_notes ?? '')
  const [pending, startTransition] = useTransition()
  const [notesSaved, setNotesSaved] = useState(false)

  function onStatusChange(next: string) {
    const prev = status
    setStatus(next)
    startTransition(async () => {
      const result = await updateQuoteStatus(q.id, next)
      if (result.error) setStatus(prev)
      router.refresh()
    })
  }

  function onNotesBlur() {
    if (notes === (q.internal_notes ?? '')) return
    startTransition(async () => {
      await updateQuoteNotes(q.id, notes)
      setNotesSaved(true)
      setTimeout(() => setNotesSaved(false), 2000)
      router.refresh()
    })
  }

  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5">
      <div className="flex items-start justify-between gap-3 flex-wrap">
        <div className="min-w-0">
          <div className="flex items-center gap-2 flex-wrap">
            <p className="text-sm font-bold text-slate-900">{q.company_name}</p>
            <span className="text-xs text-slate-400">{q.reference}</span>
          </div>
          <p className="text-xs text-slate-500 mt-0.5">{q.contact_name} · {q.phone}{q.email ? ` · ${q.email}` : ''}</p>
        </div>
        <div className="flex items-center gap-1.5 shrink-0">
          <select
            value={status}
            onChange={(e) => onStatusChange(e.target.value)}
            disabled={pending}
            className={`text-xs font-medium rounded-full pl-2.5 pr-6 py-1 border-0 outline-none cursor-pointer disabled:opacity-60 ${STATUS_CLS[status] ?? STATUS_CLS.new}`}
          >
            {STATUSES.map((s) => <option key={s.id} value={s.id}>{s.label}</option>)}
          </select>
          {pending && <Loader2 size={12} className="animate-spin text-slate-300" />}
          <a href={`https://wa.me/${q.phone.replace(/\D/g, '')}`} target="_blank" rel="noopener noreferrer"
            title="Message on WhatsApp" className="text-slate-300 hover:text-emerald-600 transition-colors">
            <MessageCircle size={15} />
          </a>
          {q.email && (
            <a href={`mailto:${q.email}`} title="Email" className="text-slate-300 hover:text-blue-600 transition-colors">
              <Mail size={15} />
            </a>
          )}
        </div>
      </div>

      <p className="text-sm text-slate-600 mt-3 leading-relaxed whitespace-pre-line">{q.details}</p>
      {q.budget && <p className="text-xs text-slate-400 mt-1.5">Budget: {q.budget}</p>}
      <p className="text-xs text-slate-300 mt-1.5">{new Date(q.created_at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })}</p>

      <div className="mt-3 pt-3 border-t border-slate-100">
        <div className="flex items-center gap-2 mb-1">
          <p className="text-xs font-semibold text-slate-500">Internal notes</p>
          {notesSaved && <span className="text-[10px] text-emerald-600">Saved</span>}
        </div>
        <textarea
          value={notes}
          onChange={(e) => setNotes(e.target.value)}
          onBlur={onNotesBlur}
          rows={2}
          placeholder="Quoted price, follow-up plan, etc."
          className="w-full text-sm bg-slate-50 border border-slate-200 rounded-xl px-3 py-2 outline-none focus:border-blue-400 resize-none"
        />
      </div>
    </div>
  )
}

export function QuotesManager({ quotes }: { quotes: QuoteRow[] }) {
  const [filter, setFilter] = useState<string>('open')
  const shown = quotes.filter((q) => filter === 'all' ? true : filter === 'open' ? !['won', 'lost'].includes(q.status) : q.status === filter)

  return (
    <>
      <div className="flex gap-2 mb-5 flex-wrap">
        {(['open', 'new', 'contacted', 'quoted', 'won', 'lost', 'all'] as const).map((f) => (
          <button key={f} onClick={() => setFilter(f)}
            className={`text-xs font-medium rounded-full px-3 py-1.5 border capitalize transition-colors ${filter === f ? 'bg-blue-600 text-white border-blue-600' : 'text-slate-500 border-slate-200 hover:border-blue-300'}`}>
            {f}
          </button>
        ))}
      </div>
      {shown.length === 0 ? (
        <p className="text-sm text-slate-400 py-16 text-center bg-white border border-slate-200 rounded-2xl">No quote requests here.</p>
      ) : (
        <div className="space-y-3">{shown.map((q) => <Row key={q.id} q={q} />)}</div>
      )}
    </>
  )
}
