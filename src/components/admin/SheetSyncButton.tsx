'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Sheet, Loader2 } from 'lucide-react'

export function SheetSyncButton() {
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [msg, setMsg] = useState<string | null>(null)

  async function sync() {
    setLoading(true)
    setMsg(null)
    try {
      const res = await fetch('/api/products/sheet-sync', { method: 'POST' })
      const data = await res.json()
      if (data.ok) {
        setMsg(`Synced: ${data.updated} updated · ${data.created} created${data.skipped ? ` · ${data.skipped} skipped` : ''}${data.warnings?.length ? ` · ⚠ ${data.warnings[0]}` : ''}`)
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
      {msg && <span className="text-xs text-slate-500 max-w-xs truncate" title={msg}>{msg}</span>}
      <button
        onClick={sync}
        disabled={loading}
        title="Pull the latest rows from the Google Sheet"
        className="inline-flex items-center gap-2 bg-white border border-slate-200 hover:border-blue-300 hover:text-blue-700 text-slate-600 text-sm font-semibold px-4 py-2.5 rounded-xl transition-colors disabled:opacity-60"
      >
        {loading ? <Loader2 size={15} className="animate-spin" /> : <Sheet size={15} />}
        {loading ? 'Syncing…' : 'Sync from Sheet'}
      </button>
    </div>
  )
}
