'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { RefreshCw, Star, Trash2, Plus, ExternalLink, Lock, ShoppingBag } from 'lucide-react'
import type { BestBuyTrend, ExternalTrendingItem } from '@/lib/trending'

function money(n: number) {
  return `$${n.toLocaleString(undefined, { maximumFractionDigits: 0 })}`
}

function BestBuyColumn({ items, configured }: { items: BestBuyTrend[]; configured: boolean }) {
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [msg, setMsg] = useState<string | null>(null)

  async function refresh() {
    setLoading(true)
    setMsg(null)
    try {
      const res = await fetch('/api/trending/bestbuy', { method: 'POST' })
      const data = await res.json()
      if (data.ok) {
        setMsg(`Fetched ${data.fetched} products`)
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
    <div className="bg-white border border-slate-200 rounded-2xl p-5 flex flex-col">
      <div className="flex items-center justify-between mb-1">
        <p className="font-semibold text-slate-900 text-sm">Best Buy — US market</p>
        <button
          onClick={refresh}
          disabled={loading}
          className="inline-flex items-center gap-1.5 bg-white border border-slate-200 text-slate-700 text-[11px] font-semibold px-2.5 py-1.5 rounded-lg hover:bg-slate-50 disabled:opacity-60"
        >
          <RefreshCw size={12} className={loading ? 'animate-spin' : ''} />
          Refresh
        </button>
      </div>
      <p className="text-xs text-slate-400 mb-3">Auto-fetched via Best Buy's free API, sorted by review count (closest available popularity signal — no native "trending" field).</p>
      {msg && <p className="text-[11px] text-slate-500 mb-2">{msg}</p>}
      {items.length === 0 ? (
        <p className="text-sm text-slate-400 py-8 text-center flex-1">
          {configured ? 'No data yet — click refresh.' : 'Needs BESTBUY_API_KEY (free, self-serve at developer.bestbuy.com).'}
        </p>
      ) : (
        <ul className="divide-y divide-slate-100 overflow-y-auto max-h-96">
          {items.map((it) => (
            <li key={it.sku} className="py-2.5">
              <a href={it.productUrl ?? '#'} target="_blank" rel="noopener noreferrer" className="text-sm text-slate-800 hover:text-blue-600 line-clamp-2 flex items-start gap-1">
                {it.name}
                <ExternalLink size={11} className="shrink-0 mt-1 text-slate-300" />
              </a>
              <div className="flex items-center justify-between mt-0.5">
                <p className="text-xs text-slate-400 capitalize">{it.keyword}</p>
                <div className="flex items-center gap-2 shrink-0">
                  {it.reviewCount !== null && (
                    <span className="inline-flex items-center gap-0.5 text-[11px] text-amber-600">
                      <Star size={10} className="fill-amber-400 text-amber-400" /> {it.reviewAverage?.toFixed(1)} ({it.reviewCount})
                    </span>
                  )}
                  {it.price !== null && <span className="text-xs font-semibold text-slate-700">{money(it.price)}</span>}
                </div>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}

function ManualColumn({ source, label, items }: { source: 'amazon' | 'aliexpress'; label: string; items: ExternalTrendingItem[] }) {
  const router = useRouter()
  const [showForm, setShowForm] = useState(false)
  const [name, setName] = useState('')
  const [price, setPrice] = useState('')
  const [url, setUrl] = useState('')
  const [saving, setSaving] = useState(false)
  const [err, setErr] = useState<string | null>(null)

  async function submit(e: React.FormEvent) {
    e.preventDefault()
    setSaving(true)
    setErr(null)
    try {
      const res = await fetch('/api/trending/external', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ source, name, url, price: price ? Number(price) : null }),
      })
      const data = await res.json()
      if (data.ok) {
        setName(''); setPrice(''); setUrl(''); setShowForm(false)
        router.refresh()
      } else {
        setErr(data.error ?? 'Failed to save')
      }
    } catch {
      setErr('Failed to save — network error')
    } finally {
      setSaving(false)
    }
  }

  async function remove(id: string) {
    await fetch(`/api/trending/external?id=${id}`, { method: 'DELETE' })
    router.refresh()
  }

  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5 flex flex-col">
      <div className="flex items-center justify-between mb-1">
        <p className="font-semibold text-slate-900 text-sm">{label}</p>
        <button
          onClick={() => setShowForm((v) => !v)}
          className="inline-flex items-center gap-1.5 bg-white border border-slate-200 text-slate-700 text-[11px] font-semibold px-2.5 py-1.5 rounded-lg hover:bg-slate-50"
        >
          <Plus size={12} /> Add
        </button>
      </div>
      <p className="text-xs text-slate-400 mb-3">Staff-curated — no auto-fetch available for {label} right now. Log what you see trending there.</p>

      {showForm && (
        <form onSubmit={submit} className="mb-3 space-y-2 bg-slate-50 rounded-xl p-3">
          <input value={name} onChange={(e) => setName(e.target.value)} placeholder="Product name" required maxLength={200}
            className="w-full text-xs border border-slate-200 rounded-lg px-2.5 py-1.5" />
          <div className="flex gap-2">
            <input value={price} onChange={(e) => setPrice(e.target.value)} placeholder="Price (optional)" type="number" min="0" step="0.01"
              className="w-1/3 text-xs border border-slate-200 rounded-lg px-2.5 py-1.5" />
            <input value={url} onChange={(e) => setUrl(e.target.value)} placeholder="https://..." required type="url"
              className="flex-1 text-xs border border-slate-200 rounded-lg px-2.5 py-1.5" />
          </div>
          {err && <p className="text-[11px] text-red-600">{err}</p>}
          <button type="submit" disabled={saving} className="w-full bg-blue-600 hover:bg-blue-700 text-white text-xs font-semibold rounded-lg py-1.5 disabled:opacity-60">
            {saving ? 'Saving…' : 'Save item'}
          </button>
        </form>
      )}

      {items.length === 0 ? (
        <p className="text-sm text-slate-400 py-8 text-center flex-1">Nothing logged yet.</p>
      ) : (
        <ul className="divide-y divide-slate-100 overflow-y-auto max-h-96">
          {items.map((it) => (
            <li key={it.id} className="py-2.5 flex items-center justify-between gap-2">
              <div className="min-w-0 flex-1">
                <a href={it.url} target="_blank" rel="noopener noreferrer" className="text-sm text-slate-800 hover:text-blue-600 truncate flex items-center gap-1">
                  <span className="truncate">{it.name}</span>
                  <ExternalLink size={11} className="shrink-0 text-slate-300" />
                </a>
                {it.price !== null && <p className="text-xs text-slate-400">{money(it.price)}</p>}
              </div>
              <button onClick={() => remove(it.id)} className="shrink-0 text-slate-300 hover:text-red-500" title="Remove">
                <Trash2 size={14} />
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}

export function ExternalMarketplacesPanel({
  bestBuyItems,
  bestBuyConfigured,
  amazonItems,
}: {
  bestBuyItems: BestBuyTrend[]
  bestBuyConfigured: boolean
  amazonItems: ExternalTrendingItem[]
}) {
  return (
    <div>
      <div className="flex items-center gap-2 mb-4">
        <ShoppingBag size={15} className="text-blue-600" />
        <p className="font-semibold text-slate-900 text-sm">Trending on other marketplaces</p>
      </div>
      <div className="grid lg:grid-cols-3 gap-4">
        <BestBuyColumn items={bestBuyItems} configured={bestBuyConfigured} />
        <ManualColumn source="amazon" label="Amazon" items={amazonItems} />
        <div className="bg-white border border-dashed border-slate-200 rounded-2xl p-5 flex flex-col items-center justify-center text-center gap-2">
          <Lock size={18} className="text-slate-300" />
          <p className="font-semibold text-slate-500 text-sm">AliExpress</p>
          <p className="text-xs text-slate-400 max-w-[220px]">
            Waiting on the AliExpress affiliate API approval (submitted from your own AliExpress account). Once approved, hand over the credentials and this becomes automatic too.
          </p>
        </div>
      </div>
    </div>
  )
}
