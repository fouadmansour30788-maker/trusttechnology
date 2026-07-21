'use client'
import { useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import {
  Scale, Square, X, ShoppingCart, MessageCircle, ArrowRight,
  Sparkles, Loader2, Trophy, CheckCircle2, Gem, AlertTriangle,
} from 'lucide-react'
import { useCompareStore } from '@/store/compare'
import { useCartStore } from '@/store/cart'

const WHATSAPP = '96171998983'

type Verdict = 'best' | 'good' | 'overkill' | 'not-ideal'
type AnalysisItem = { slug: string; verdict: Verdict; reason: string }
type Analysis = { recommended: string; headline: string; items: AnalysisItem[] }

const VERDICT_STYLE: Record<Verdict, { icon: typeof CheckCircle2; cls: string; bg: string; label: string }> = {
  best: { icon: Trophy, cls: 'text-emerald-700', bg: 'bg-emerald-50 border-emerald-200', label: 'Best fit' },
  good: { icon: CheckCircle2, cls: 'text-blue-700', bg: 'bg-blue-50 border-blue-100', label: 'Good fit' },
  overkill: { icon: Gem, cls: 'text-purple-700', bg: 'bg-purple-50 border-purple-100', label: 'Overkill' },
  'not-ideal': { icon: AlertTriangle, cls: 'text-amber-700', bg: 'bg-amber-50 border-amber-100', label: 'Not ideal' },
}

const SUGGESTIONS = ['University & office work', 'Gaming', 'Graphic design / video editing', 'Programming', 'Everyday home use']

export default function ComparePage() {
  const { items, remove, clear } = useCompareStore()
  const addItem = useCartStore((s) => s.addItem)

  const [useCase, setUseCase] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [analysis, setAnalysis] = useState<Analysis | null>(null)

  async function check(text: string) {
    if (text.trim().length < 3 || loading || items.length < 2) return
    setLoading(true)
    setError(null)
    setAnalysis(null)
    try {
      const res = await fetch('/api/compare-check', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ slugs: items.map((p) => p.slug), useCase: text }),
      })
      const data = await res.json()
      if (data.ok) setAnalysis(data)
      else setError(typeof data.error === 'string' && data.error.length > 10 ? data.error : 'Could not analyse right now — try again.')
    } catch {
      setError('Could not analyse right now — try again.')
    } finally {
      setLoading(false)
    }
  }

  if (items.length === 0) {
    return (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 py-24 flex flex-col items-center text-center gap-5">
        <Scale size={44} className="text-slate-300" />
        <h1 className="text-2xl font-bold text-slate-900">Nothing to compare yet</h1>
        <p className="text-slate-500 max-w-md">Tap <span className="inline-flex items-center gap-1 text-blue-600 font-medium align-middle"><Square size={13} className="inline" /> Compare</span> on any product card to add it — pick up to 3 products.</p>
        <Link href="/products" className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-3 rounded-xl transition-colors">
          Browse products <ArrowRight size={15} />
        </Link>
      </div>
    )
  }

  // Union of spec keys across the selected products, keeping a sensible order.
  const PRIORITY = ['CPU', 'RAM', 'Storage', 'Hard Disk', 'VGA', 'Graphics', 'Screen', 'Resolution', 'Connectivity', 'Capacity', 'LAN', 'Keyboard', 'OS', 'Warranty']
  const specKeys = [...new Set(items.flatMap((p) => Object.keys(p.specs ?? {})))].sort((a, b) => {
    const ia = PRIORITY.indexOf(a); const ib = PRIORITY.indexOf(b)
    return (ia < 0 ? 99 : ia) - (ib < 0 ? 99 : ib)
  })

  const byslug = (slug: string) => analysis?.items.find((it) => it.slug === slug)

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-10">
      <div className="flex items-center justify-between flex-wrap gap-3 mb-6">
        <div>
          <h1 className="text-3xl font-bold text-slate-900">Compare products</h1>
          <p className="text-slate-500 text-sm mt-0.5">{items.length} of 3 selected</p>
        </div>
        <button onClick={() => { clear(); setAnalysis(null) }} className="text-sm text-slate-400 hover:text-slate-700">Clear all</button>
      </div>

      {/* AI: which one fits me? */}
      <div className="border border-slate-200 rounded-2xl p-5 bg-gradient-to-br from-blue-50/60 to-white mb-8">
        <div className="flex items-center gap-2 mb-1">
          <Sparkles size={15} className="text-blue-600" />
          <p className="font-semibold text-slate-900 text-sm">Which one fits me?</p>
        </div>
        <p className="text-xs text-slate-400 mb-3">
          {items.length < 2
            ? 'Add one more product to compare, then tell us what it’s for.'
            : 'Tell us what you’ll use it for — our AI checks all your picks and recommends the best fit.'}
        </p>

        <form onSubmit={(e) => { e.preventDefault(); check(useCase) }} className="flex gap-2">
          <input
            value={useCase}
            onChange={(e) => setUseCase(e.target.value)}
            placeholder="e.g. video editing and light gaming"
            maxLength={200}
            disabled={items.length < 2}
            className="flex-1 bg-white border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 outline-none focus:border-blue-400 disabled:opacity-50"
          />
          <button type="submit" disabled={loading || items.length < 2 || useCase.trim().length < 3}
            className="inline-flex items-center gap-1.5 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-4 py-2.5 rounded-xl transition-colors disabled:opacity-50">
            {loading ? <Loader2 size={14} className="animate-spin" /> : <Sparkles size={14} />} Compare for me
          </button>
        </form>

        {items.length >= 2 && !analysis && !loading && (
          <div className="flex flex-wrap gap-1.5 mt-3">
            {SUGGESTIONS.map((s) => (
              <button key={s} onClick={() => { setUseCase(s); check(s) }}
                className="text-xs text-slate-500 bg-white border border-slate-200 hover:border-blue-300 hover:text-blue-700 rounded-full px-3 py-1 transition-colors">
                {s}
              </button>
            ))}
          </div>
        )}

        {error && <p className="text-sm text-red-600 mt-3">{error}</p>}

        {analysis && (
          <div className="mt-4 border border-emerald-200 bg-emerald-50 rounded-xl p-4 flex items-start gap-2.5">
            <Trophy size={17} className="text-emerald-600 mt-0.5 shrink-0" />
            <div>
              <p className="text-sm font-bold text-emerald-900">{analysis.headline}</p>
              <p className="text-xs text-emerald-700 mt-0.5">Recommendation based on your stated use — always weigh your own priorities too.</p>
            </div>
          </div>
        )}
      </div>

      <div className="overflow-x-auto">
        <table className="w-full text-sm border-separate border-spacing-0">
          <thead>
            <tr>
              <th className="w-32 min-w-[8rem]" />
              {items.map((p) => {
                const isRecommended = analysis?.recommended === p.slug
                return (
                  <th key={p.id} className={`text-left align-top pb-4 pr-6 min-w-[220px] ${isRecommended ? 'relative' : ''}`}>
                    <div className={`relative ${isRecommended ? 'ring-2 ring-emerald-400 rounded-2xl p-3 -m-3 bg-emerald-50/40' : ''}`}>
                      {isRecommended && (
                        <span className="absolute -top-2.5 left-3 inline-flex items-center gap-1 bg-emerald-600 text-white text-[10px] font-bold rounded-full px-2 py-0.5 shadow-sm">
                          <Trophy size={10} /> Recommended for you
                        </span>
                      )}
                      <button onClick={() => remove(p.id)} className="absolute -top-1 right-2 text-slate-300 hover:text-slate-600" title="Remove">
                        <X size={15} />
                      </button>
                      <Link href={`/products/${p.slug}`} className="block w-28 h-28 rounded-xl bg-slate-100 overflow-hidden relative mb-3 mt-1">
                        {p.images[0] && <Image src={p.images[0]} alt={p.name} fill className="object-cover" sizes="112px" />}
                      </Link>
                      <Link href={`/products/${p.slug}`} className="font-semibold text-slate-900 hover:text-blue-600 leading-snug line-clamp-3">
                        {p.name}
                      </Link>
                      <p className="mt-2">
                        {p.priceOnRequest || p.price === 0
                          ? <span className="text-blue-600 font-semibold">Call for price</span>
                          : <span className="text-slate-900 font-bold text-lg">${p.price.toFixed(2)}</span>}
                        {p.bestPrice && <span className="ml-2 text-[10px] font-semibold text-white bg-emerald-600 rounded-full px-1.5 py-0.5 align-middle">🇱🇧 Best price</span>}
                      </p>

                      {byslug(p.slug) && (() => {
                        const it = byslug(p.slug)!
                        const v = VERDICT_STYLE[it.verdict]
                        const Icon = v.icon
                        return (
                          <div className={`mt-2 border rounded-lg px-2.5 py-2 ${v.bg}`}>
                            <p className={`flex items-center gap-1 text-xs font-bold ${v.cls}`}><Icon size={12} /> {v.label}</p>
                            {it.reason && <p className="text-[11px] text-slate-600 mt-0.5 leading-snug">{it.reason}</p>}
                          </div>
                        )
                      })()}

                      <div className="mt-3">
                        {p.priceOnRequest || p.price === 0 ? (
                          <a href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent('Hi, I would like a price for: ' + p.name)}`}
                            target="_blank" rel="noopener noreferrer"
                            className="inline-flex items-center gap-1.5 text-xs font-semibold text-emerald-700 bg-emerald-50 hover:bg-emerald-100 rounded-lg px-3 py-2">
                            <MessageCircle size={12} /> Ask price
                          </a>
                        ) : (
                          <button onClick={() => addItem(p)} disabled={p.stock === 0}
                            className="inline-flex items-center gap-1.5 text-xs font-semibold text-white bg-blue-600 hover:bg-blue-700 disabled:opacity-40 rounded-lg px-3 py-2">
                            <ShoppingCart size={12} /> Add to cart
                          </button>
                        )}
                      </div>
                    </div>
                  </th>
                )
              })}
            </tr>
          </thead>
          <tbody>
            <tr>
              <td className="py-2.5 pr-4 text-xs font-semibold uppercase tracking-wide text-slate-400 border-t border-slate-100">Availability</td>
              {items.map((p) => (
                <td key={p.id} className="py-2.5 pr-6 border-t border-slate-100">
                  {p.stock === 0
                    ? <span className="text-red-500 font-medium">Out of stock</span>
                    : p.stock <= 3
                      ? <span className="text-amber-600 font-medium">Only {p.stock} left</span>
                      : <span className="text-emerald-600 font-medium">In stock</span>}
                </td>
              ))}
            </tr>
            {specKeys.map((key) => (
              <tr key={key}>
                <td className="py-2.5 pr-4 text-xs font-semibold uppercase tracking-wide text-slate-400 border-t border-slate-100">{key}</td>
                {items.map((p) => (
                  <td key={p.id} className="py-2.5 pr-6 text-slate-700 border-t border-slate-100">
                    {p.specs?.[key] ?? <span className="text-slate-300">—</span>}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}
