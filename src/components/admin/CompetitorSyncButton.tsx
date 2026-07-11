'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { RefreshCw } from 'lucide-react'

export function CompetitorSyncButton() {
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [msg, setMsg] = useState<string | null>(null)

  async function sync() {
    setLoading(true)
    setMsg(null)
    try {
      const res = await fetch('/api/competitors/sync', { method: 'POST' })
      const data = await res.json()
      if (data.ok) {
        setMsg(`Fetched ${data.total} items · ${data.matched} matched · ${data.updatedPrices} price changes`)
        router.refresh()
      } else {
        setMsg(data.error ?? 'Sync failed')
      }
    } catch {
      setMsg('Sync failed — network error')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="flex items-center gap-3">
      {msg && <span className="text-xs text-slate-500">{msg}</span>}
      <button
        onClick={sync}
        disabled={loading}
        className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white text-sm font-semibold px-4 py-2.5 rounded-xl shadow-lg shadow-blue-600/20 disabled:opacity-60"
      >
        <RefreshCw size={15} className={loading ? 'animate-spin' : ''} />
        {loading ? 'Syncing… (~30s)' : 'Sync now'}
      </button>
    </div>
  )
}
