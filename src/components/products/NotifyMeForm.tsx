'use client'
import { useState } from 'react'
import { Bell, Check, Loader2 } from 'lucide-react'

export function NotifyMeForm({ productId, kind, label }: { productId: string; kind: 'restock' | 'price_drop'; label: string }) {
  const [email, setEmail] = useState('')
  const [status, setStatus] = useState<'idle' | 'loading' | 'done' | 'error'>('idle')

  async function submit(e: React.FormEvent) {
    e.preventDefault()
    if (status === 'loading') return
    setStatus('loading')
    try {
      const res = await fetch('/api/notify-me', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ productId, email, kind }),
      })
      const data = await res.json()
      setStatus(data.ok ? 'done' : 'error')
    } catch {
      setStatus('error')
    }
  }

  if (status === 'done') {
    return (
      <p className="flex items-center gap-1.5 text-sm text-emerald-700 bg-emerald-50 border border-emerald-100 rounded-xl px-4 py-2.5">
        <Check size={14} /> We&apos;ll email you.
      </p>
    )
  }

  return (
    <form onSubmit={submit} className="flex gap-2">
      <input
        type="email" required maxLength={200} value={email} onChange={(e) => setEmail(e.target.value)}
        placeholder="Your email"
        className="flex-1 min-w-0 bg-white border border-slate-200 rounded-xl px-3.5 py-2.5 text-sm text-slate-900 outline-none focus:border-blue-400"
      />
      <button type="submit" disabled={status === 'loading'}
        className="inline-flex items-center gap-1.5 bg-slate-900 hover:bg-slate-800 text-white text-sm font-semibold px-4 py-2.5 rounded-xl transition-colors disabled:opacity-50 shrink-0">
        {status === 'loading' ? <Loader2 size={14} className="animate-spin" /> : <Bell size={14} />} {label}
      </button>
      {status === 'error' && <p className="text-xs text-red-600 self-center shrink-0">Try again</p>}
    </form>
  )
}
