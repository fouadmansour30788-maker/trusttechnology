'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { MessageCircle, Save } from 'lucide-react'
import { updateRepair } from '@/app/admin/repairs/actions'

export type RepairRow = {
  id: string; reference: string; customer_name: string; phone: string
  device: string; problem: string; status: string; quote: number | null
  internal_notes: string | null; created_at: string
}

const STATUSES = [
  { id: 'received', label: 'Received' },
  { id: 'diagnosing', label: 'Diagnosing' },
  { id: 'awaiting_approval', label: 'Awaiting approval' },
  { id: 'repairing', label: 'Repairing' },
  { id: 'ready', label: 'Ready' },
  { id: 'delivered', label: 'Delivered' },
  { id: 'cancelled', label: 'Cancelled' },
]

const STATUS_CLS: Record<string, string> = {
  received: 'bg-blue-50 text-blue-700',
  diagnosing: 'bg-amber-50 text-amber-700',
  awaiting_approval: 'bg-purple-50 text-purple-700',
  repairing: 'bg-amber-50 text-amber-700',
  ready: 'bg-emerald-50 text-emerald-700',
  delivered: 'bg-slate-100 text-slate-500',
  cancelled: 'bg-red-50 text-red-600',
}

function Row({ r }: { r: RepairRow }) {
  const router = useRouter()
  const [status, setStatus] = useState(r.status)
  const [quote, setQuote] = useState(r.quote === null ? '' : String(r.quote))
  const [notes, setNotes] = useState(r.internal_notes ?? '')
  const [dirty, setDirty] = useState(false)
  const [pending, startTransition] = useTransition()

  function save() {
    startTransition(async () => {
      await updateRepair(r.id, {
        status,
        quote: quote.trim() === '' ? null : Number(quote),
        internal_notes: notes,
      })
      setDirty(false)
      router.refresh()
    })
  }

  const waText = encodeURIComponent(
    status === 'awaiting_approval' && quote
      ? `Hi ${r.customer_name}! Your ${r.device} (${r.reference}) is diagnosed — the repair costs $${quote}. Reply to approve and we'll start right away.`
      : status === 'ready'
        ? `Hi ${r.customer_name}! Your ${r.device} (${r.reference}) is ready for pickup 🎉`
        : `Hi ${r.customer_name}! Update on your repair ${r.reference} (${r.device}):`
  )

  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5">
      <div className="flex items-start justify-between gap-3 flex-wrap">
        <div className="min-w-0">
          <p className="font-bold text-slate-900">{r.reference} <span className={`ml-2 text-[11px] font-semibold rounded-full px-2 py-0.5 align-middle ${STATUS_CLS[status] ?? 'bg-slate-100 text-slate-500'}`}>{STATUSES.find((s) => s.id === status)?.label ?? status}</span></p>
          <p className="text-sm text-slate-700 mt-1">{r.device} — <span className="text-slate-500">{r.problem}</span></p>
          <p className="text-xs text-slate-400 mt-1">
            {r.customer_name} · {r.phone} · booked {new Date(r.created_at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short' })}
          </p>
        </div>
        <a href={`https://wa.me/${r.phone.replace(/\D/g, '')}?text=${waText}`} target="_blank" rel="noopener noreferrer"
          className="inline-flex items-center gap-1.5 text-xs font-semibold text-emerald-700 bg-emerald-50 hover:bg-emerald-100 rounded-lg px-3 py-1.5 shrink-0"
          title="Message customer on WhatsApp">
          <MessageCircle size={13} /> WhatsApp
        </a>
      </div>

      <div className="flex flex-wrap items-center gap-2 mt-4">
        <select value={status} onChange={(e) => { setStatus(e.target.value); setDirty(true) }}
          className="bg-white border border-slate-200 rounded-lg px-3 py-2 text-sm text-slate-700 outline-none focus:border-blue-400">
          {STATUSES.map((s) => <option key={s.id} value={s.id}>{s.label}</option>)}
        </select>
        <input value={quote} onChange={(e) => { setQuote(e.target.value.replace(/[^\d.]/g, '')); setDirty(true) }} placeholder="Quote $"
          className="w-24 bg-white border border-slate-200 rounded-lg px-3 py-2 text-sm text-slate-700 outline-none focus:border-blue-400" />
        <input value={notes} onChange={(e) => { setNotes(e.target.value); setDirty(true) }} placeholder="Internal notes…"
          className="flex-1 min-w-[160px] bg-white border border-slate-200 rounded-lg px-3 py-2 text-sm text-slate-700 outline-none focus:border-blue-400" />
        {dirty && (
          <button onClick={save} disabled={pending}
            className="inline-flex items-center gap-1.5 bg-blue-600 hover:bg-blue-700 text-white text-xs font-semibold px-3.5 py-2 rounded-lg disabled:opacity-60">
            <Save size={13} /> {pending ? 'Saving…' : 'Save'}
          </button>
        )}
      </div>
    </div>
  )
}

export function RepairsManager({ repairs }: { repairs: RepairRow[] }) {
  const [filter, setFilter] = useState('open')
  const shown = repairs.filter((r) =>
    filter === 'all' ? true : filter === 'open' ? !['delivered', 'cancelled'].includes(r.status) : r.status === filter
  )
  return (
    <>
      <div className="flex flex-wrap gap-2 mb-5">
        {[{ id: 'open', label: 'Open' }, { id: 'all', label: 'All' }, ...STATUSES].map((f) => (
          <button key={f.id} onClick={() => setFilter(f.id)}
            className={`text-xs font-medium rounded-full px-3 py-1.5 border transition-colors ${filter === f.id ? 'bg-blue-600 text-white border-blue-600' : 'text-slate-500 border-slate-200 hover:border-blue-300'}`}>
            {f.label}
          </button>
        ))}
      </div>
      {shown.length === 0 ? (
        <p className="text-sm text-slate-400 py-16 text-center bg-white border border-slate-200 rounded-2xl">No repairs here.</p>
      ) : (
        <div className="space-y-3">{shown.map((r) => <Row key={r.id} r={r} />)}</div>
      )}
    </>
  )
}
