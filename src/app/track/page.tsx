'use client'
import { useState } from 'react'
import { PackageSearch, Loader2, CheckCircle2, XCircle, MessageCircle } from 'lucide-react'

type TrackResult = {
  reference: string
  status: string
  statusLabel: string
  step: number
  orderDate: string
  total: number
  items: { name: string; quantity: number }[]
}

const STEPS = ['Received', 'Confirmed', 'Delivered']

export default function TrackPage() {
  const [reference, setReference] = useState('')
  const [phone, setPhone] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [result, setResult] = useState<TrackResult | null>(null)

  async function submit(e: React.FormEvent) {
    e.preventDefault()
    setLoading(true)
    setError(null)
    setResult(null)
    try {
      const res = await fetch('/api/track', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ reference, phone }),
      })
      const data = await res.json()
      if (data.ok) setResult(data)
      else setError(data.error === 'unavailable' ? 'Tracking is temporarily unavailable — contact us on WhatsApp.' : data.error)
    } catch {
      setError('Network error — please try again.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="max-w-xl mx-auto px-4 sm:px-6 py-14">
      <div className="text-center mb-8">
        <span className="inline-flex w-12 h-12 rounded-2xl bg-blue-50 items-center justify-center mb-3">
          <PackageSearch size={22} className="text-blue-600" />
        </span>
        <h1 className="text-3xl font-bold text-slate-900">Track your order</h1>
        <p className="text-slate-500 mt-1 text-sm">Enter your order number and the phone number you ordered with.</p>
      </div>

      <form onSubmit={submit} className="space-y-3 bg-white border border-slate-200 rounded-2xl p-6">
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-1">Order number</label>
          <input required value={reference} onChange={(e) => setReference(e.target.value)} placeholder="SO-0012"
            className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400" />
        </div>
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-1">Phone</label>
          <input required value={phone} onChange={(e) => setPhone(e.target.value)} placeholder="+961 71 123 456" inputMode="tel"
            className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400" />
        </div>
        {error && <p className="text-sm text-red-600 bg-red-50 rounded-xl px-4 py-3">{error}</p>}
        <button type="submit" disabled={loading}
          className="w-full inline-flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-xl transition-colors disabled:opacity-60">
          {loading ? <Loader2 size={16} className="animate-spin" /> : <PackageSearch size={16} />} Track order
        </button>
      </form>

      {result && (
        <div className="mt-6 bg-white border border-slate-200 rounded-2xl p-6">
          <div className="flex items-center justify-between flex-wrap gap-2 mb-5">
            <p className="font-bold text-slate-900">{result.reference}</p>
            <p className="text-xs text-slate-400">
              Ordered {new Date(result.orderDate).toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric' })}
            </p>
          </div>

          {result.status === 'cancelled' ? (
            <p className="flex items-center gap-2 text-red-600 font-medium mb-4"><XCircle size={18} /> This order was cancelled.</p>
          ) : (
            <div className="flex items-center mb-3">
              {STEPS.map((label, i) => {
                const done = result.step >= i + 1
                return (
                  <div key={label} className="flex items-center flex-1 last:flex-none">
                    <div className="flex flex-col items-center">
                      <span className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold ${done ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-400'}`}>
                        {done ? <CheckCircle2 size={15} /> : i + 1}
                      </span>
                      <span className={`text-[11px] mt-1 ${done ? 'text-slate-700 font-medium' : 'text-slate-400'}`}>{label}</span>
                    </div>
                    {i < STEPS.length - 1 && <div className={`h-0.5 flex-1 mx-2 mb-4 ${result.step > i + 1 ? 'bg-blue-600' : 'bg-slate-100'}`} />}
                  </div>
                )
              })}
            </div>
          )}
          <p className="text-sm text-slate-600 mb-4">{result.statusLabel}</p>

          <div className="border-t border-slate-100 pt-4 space-y-1.5">
            {result.items.map((it, i) => (
              <p key={i} className="text-sm text-slate-600 flex justify-between">
                <span className="truncate">{it.name}</span>
                <span className="text-slate-400 shrink-0 ml-3">× {it.quantity}</span>
              </p>
            ))}
            <p className="text-sm font-bold text-slate-900 flex justify-between pt-2">
              <span>Total (cash on delivery)</span>
              <span className="tabular-nums">${result.total.toLocaleString(undefined, { maximumFractionDigits: 2 })}</span>
            </p>
          </div>

          <a href={`https://wa.me/96171998983?text=${encodeURIComponent(`Hi! Question about my order ${result.reference}`)}`}
            target="_blank" rel="noopener noreferrer"
            className="mt-5 inline-flex items-center gap-2 text-sm font-medium text-blue-600 hover:text-blue-700">
            <MessageCircle size={14} /> Questions? Chat with us on WhatsApp
          </a>
        </div>
      )}
    </div>
  )
}
