'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { RefreshCw } from 'lucide-react'

export function CompetitorSyncButton() {
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [msg, setMsg] = useState<string | null>(null)
  const [sourceLines, setSourceLines] = useState<string[]>([])

  async function sync() {
    setLoading(true)
    setMsg(null)
    setSourceLines([])
    try {
      const res = await fetch('/api/competitors/sync', { method: 'POST' })
      const data = await res.json()
      if (data.ok) {
        setMsg(`Fetched ${data.total} items · ${data.matched} matched · ${data.updatedPrices} price changes`)
        type Source = { competitor: string; items: number; error?: string }
        setSourceLines(((data.sources ?? []) as Source[]).map((s) =>
          s.error ? `${s.competitor}: FAILED — ${s.error}` : `${s.competitor}: ${s.items} items`
        ))
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
      {(msg || sourceLines.length > 0) && (
        <div className="text-right">
          {msg && <p className="text-xs text-slate-500">{msg}</p>}
          {sourceLines.map((line) => (
            <p key={line} className={`text-[11px] ${line.includes('FAILED') ? 'text-red-500' : 'text-slate-400'}`}>{line}</p>
          ))}
        </div>
      )}
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
