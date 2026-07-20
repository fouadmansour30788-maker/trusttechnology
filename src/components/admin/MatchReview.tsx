'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { Wand2, Check, X, Loader2, ExternalLink, Pencil } from 'lucide-react'
import { confirmMatch, confirmMatchWithPrice, rejectMatch } from '@/app/admin/competitors/actions'

type Suggestion = {
  competitor: string
  external_id: string
  itemName: string
  itemPrice: number
  url: string | null
  productId: string
  productName: string
  ourPrice: number
  confidence: 'high' | 'medium'
}

const LABELS: Record<string, string> = {
  mojitech: 'Mojitech', pcandparts: 'PC and Parts', ayoubcomputers: 'Ayoub Computers',
  multitech: 'Multitech', mediatech: 'Mediatech',
}

export function MatchReview() {
  const router = useRouter()
  const [suggestions, setSuggestions] = useState<Suggestion[] | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [done, setDone] = useState<Record<string, 'confirmed' | 'rejected'>>({})
  const [editingKey, setEditingKey] = useState<string | null>(null)
  const [editPrice, setEditPrice] = useState('')
  const [editError, setEditError] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const [, startTransition] = useTransition()

  async function suggest() {
    setLoading(true)
    setError(null)
    try {
      const res = await fetch('/api/competitors/suggest', { method: 'POST' })
      const data = await res.json()
      if (data.notConfigured === 'gemini') setError('Add a GEMINI_API_KEY to enable AI suggestions.')
      else if (data.error) setError('AI suggestion failed — try again.')
      setSuggestions(data.suggestions ?? [])
    } catch {
      setError('Request failed — try again.')
      setSuggestions([])
    } finally {
      setLoading(false)
    }
  }

  function decide(s: Suggestion, decision: 'confirmed' | 'rejected') {
    const key = `${s.competitor}:${s.external_id}`
    setDone((prev) => ({ ...prev, [key]: decision }))
    startTransition(async () => {
      if (decision === 'confirmed') await confirmMatch(s.competitor, s.external_id, s.productId)
      else await rejectMatch(s.competitor, s.external_id)
      router.refresh()
    })
  }

  function startEdit(s: Suggestion) {
    setEditingKey(`${s.competitor}:${s.external_id}`)
    setEditPrice(String(s.itemPrice))
    setEditError(null)
  }

  async function saveEdit(s: Suggestion) {
    const price = Number(editPrice)
    if (!Number.isFinite(price) || price <= 0) { setEditError('Enter a valid price.'); return }
    setSaving(true)
    setEditError(null)
    const res = await confirmMatchWithPrice(s.competitor, s.external_id, s.productId, price)
    setSaving(false)
    if (res.error) { setEditError(res.error); return }
    const key = `${s.competitor}:${s.external_id}`
    setDone((prev) => ({ ...prev, [key]: 'confirmed' }))
    setEditingKey(null)
    router.refresh()
  }

  const pending = (suggestions ?? []).filter((s) => !done[`${s.competitor}:${s.external_id}`])

  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5">
      <div className="flex items-center gap-2 mb-1 flex-wrap">
        <Wand2 size={15} className="text-blue-600" />
        <p className="font-semibold text-slate-900 text-sm">Match review</p>
        <button
          onClick={suggest}
          disabled={loading}
          className="ml-auto inline-flex items-center gap-1.5 text-xs font-semibold text-blue-700 bg-blue-50 hover:bg-blue-100 rounded-lg px-3 py-1.5 disabled:opacity-60"
        >
          {loading ? <Loader2 size={12} className="animate-spin" /> : <Wand2 size={12} />}
          {loading ? 'Asking AI…' : 'Suggest matches (AI)'}
        </button>
      </div>
      <p className="text-xs text-slate-400 mb-4">
        The auto-matcher only links exact model numbers. AI suggestions catch the rest — confirm or reject each; your decisions stick across syncs.
      </p>

      {error && <p className="text-sm text-red-600 mb-3">{error}</p>}
      {suggestions === null && !loading && (
        <p className="text-sm text-slate-400 py-6 text-center">Click “Suggest matches (AI)” to find likely pairs among unmatched competitor listings.</p>
      )}
      {suggestions !== null && !loading && pending.length === 0 && (
        <p className="text-sm text-slate-400 py-6 text-center">
          {Object.keys(done).length > 0 ? 'All suggestions reviewed — nice.' : 'No confident matches found among unmatched listings.'}
        </p>
      )}

      <ul className="divide-y divide-slate-100">
        {pending.map((s) => {
          const key = `${s.competitor}:${s.external_id}`
          const isEditing = editingKey === key
          return (
            <li key={key} className="py-3 flex items-center gap-4 flex-wrap">
              <div className="min-w-0 flex-1">
                <p className="text-sm text-slate-800 truncate" title={s.itemName}>
                  {s.itemName}
                  {s.url && <a href={s.url} target="_blank" rel="noopener noreferrer" className="inline-flex ml-1 text-slate-300 hover:text-blue-600 align-middle"><ExternalLink size={12} /></a>}
                </p>
                <p className="text-xs text-slate-400">
                  {LABELS[s.competitor] ?? s.competitor} · ${s.itemPrice.toLocaleString()} ·{' '}
                  <span className={s.confidence === 'high' ? 'text-emerald-600 font-medium' : 'text-amber-600 font-medium'}>{s.confidence} confidence</span>
                </p>
                <p className="text-xs text-slate-500 mt-0.5 truncate" title={s.productName}>
                  ↔ <span className="font-medium text-slate-700">{s.productName}</span>
                  {s.ourPrice > 0 ? ` — our $${s.ourPrice.toLocaleString()}` : ' — Call for price'}
                </p>
                {isEditing && (
                  <div className="mt-2 flex items-center gap-2 flex-wrap">
                    <span className="text-xs text-slate-400">Correct price:</span>
                    <div className="inline-flex items-center gap-1 bg-white border border-slate-200 rounded-lg px-2 py-1">
                      <span className="text-xs text-slate-400">$</span>
                      <input
                        type="number" min="0" step="0.01" autoFocus value={editPrice}
                        onChange={(e) => setEditPrice(e.target.value)}
                        onKeyDown={(e) => { if (e.key === 'Enter') saveEdit(s); if (e.key === 'Escape') setEditingKey(null) }}
                        className="w-24 text-sm text-slate-900 outline-none"
                      />
                    </div>
                    <button onClick={() => saveEdit(s)} disabled={saving}
                      className="inline-flex items-center gap-1 text-xs font-semibold text-emerald-700 bg-emerald-50 hover:bg-emerald-100 rounded-lg px-3 py-1.5 disabled:opacity-60">
                      {saving ? <Loader2 size={12} className="animate-spin" /> : <Check size={12} />} Save & confirm
                    </button>
                    <button onClick={() => setEditingKey(null)} className="text-xs text-slate-400 hover:text-slate-600">Cancel</button>
                    {editError && <p className="text-xs text-red-600 w-full">{editError}</p>}
                  </div>
                )}
              </div>
              {!isEditing && (
                <div className="flex items-center gap-2 shrink-0">
                  <button onClick={() => decide(s, 'confirmed')} className="inline-flex items-center gap-1 text-xs font-semibold text-emerald-700 bg-emerald-50 hover:bg-emerald-100 rounded-lg px-3 py-1.5">
                    <Check size={12} /> Confirm
                  </button>
                  <button onClick={() => startEdit(s)} className="inline-flex items-center gap-1 text-xs font-semibold text-blue-700 bg-blue-50 hover:bg-blue-100 rounded-lg px-3 py-1.5">
                    <Pencil size={12} /> Edit price
                  </button>
                  <button onClick={() => decide(s, 'rejected')} className="inline-flex items-center gap-1 text-xs font-semibold text-slate-600 bg-slate-100 hover:bg-slate-200 rounded-lg px-3 py-1.5">
                    <X size={12} /> Reject
                  </button>
                </div>
              )}
            </li>
          )
        })}
      </ul>
    </div>
  )
}
