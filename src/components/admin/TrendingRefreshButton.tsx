'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { RefreshCw } from 'lucide-react'

export function TrendingRefreshButton() {
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [msg, setMsg] = useState<string | null>(null)

  async function refresh() {
    setLoading(true)
    setMsg(null)
    try {
      const res = await fetch('/api/trending/refresh', { method: 'POST' })
      const data = await res.json()
      if (data.ok) {
        setMsg(`Fetched ${data.fetched} keywords`)
        router.refresh()
      } else {
        setMsg(data.error ?? 'Refresh failed')
      }
    } catch {
      setMsg('Refresh failed — network error')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="flex items-center gap-3">
      {msg && <p className="text-xs text-slate-500">{msg}</p>}
      <button
        onClick={refresh}
        disabled={loading}
        className="inline-flex items-center gap-2 bg-white border border-slate-200 text-slate-700 text-xs font-semibold px-3 py-2 rounded-xl hover:bg-slate-50 disabled:opacity-60"
      >
        <RefreshCw size={13} className={loading ? 'animate-spin' : ''} />
        {loading ? 'Refreshing… (~30s)' : 'Refresh search trends'}
      </button>
    </div>
  )
}
