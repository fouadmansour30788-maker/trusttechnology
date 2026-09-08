'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { RefreshCw } from 'lucide-react'

export function FacebookSyncButton() {
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [lines, setLines] = useState<string[]>([])

  async function sync() {
    setLoading(true)
    setLines([])
    try {
      const res = await fetch('/api/facebook/sync', { method: 'POST' })
      const data = await res.json()
      if (data.ok) {
        const out: string[] = []
        out.push(data.stats?.ok ? 'Page stats: updated' : `Page stats: FAILED — ${data.stats?.error}`)
        out.push(
          data.comments?.ok
            ? `Comments: ${data.comments.fetched} fetched`
            : `Comments: FAILED — ${data.comments?.error}`
        )
        setLines(out)
        router.refresh()
      } else {
        setLines([data.error ?? 'Sync failed'])
      }
    } catch {
      setLines(['Sync failed — network error'])
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="flex items-center gap-3">
      {lines.length > 0 && (
        <div className="text-right">
          {lines.map((line) => (
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
        {loading ? 'Syncing…' : 'Sync now'}
      </button>
    </div>
  )
}
