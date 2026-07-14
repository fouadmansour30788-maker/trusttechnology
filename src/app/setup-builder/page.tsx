'use client'
import { useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { Wand2, Loader2, ShoppingCart, Check, RefreshCw, Package } from 'lucide-react'
import { useCartStore } from '@/store/cart'
import type { Product } from '@/lib/types'

type SetupItem = { product: Product; role: string; reason: string }
type Setup = { intro: string; items: SetupItem[]; total: number; budget: number }

const BUDGET_CHIPS = [500, 800, 1200, 2000, 3000]
const USE_CHIPS = ['University student', 'Gaming setup', 'Graphic design studio', 'Office / accounting', 'Shop POS system']

export default function SetupBuilderPage() {
  const addItem = useCartStore((s) => s.addItem)
  const [budget, setBudget] = useState('1200')
  const [useCase, setUseCase] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [setup, setSetup] = useState<Setup | null>(null)
  const [added, setAdded] = useState(false)

  async function build() {
    if (loading) return
    setLoading(true)
    setError(null)
    setSetup(null)
    setAdded(false)
    try {
      const res = await fetch('/api/setup-builder', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ budget: Number(budget), useCase }),
      })
      const data = await res.json()
      if (data.ok) setSetup(data)
      else setError(typeof data.error === 'string' && data.error.length > 12 ? data.error : 'The builder is busy — try again in a moment.')
    } catch {
      setError('Network error — please try again.')
    } finally {
      setLoading(false)
    }
  }

  function addAll() {
    if (!setup) return
    setup.items.forEach((it) => addItem(it.product))
    setAdded(true)
  }

  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 py-12">
      <div className="text-center mb-10">
        <span className="inline-flex items-center gap-2 bg-blue-50 text-blue-700 text-sm font-medium rounded-full px-4 py-1.5 mb-4">
          <Wand2 size={14} /> AI setup builder
        </span>
        <h1 className="text-3xl sm:text-4xl font-bold text-slate-900">Tell us your budget.<br className="sm:hidden" /> We build the whole setup.</h1>
        <p className="text-slate-500 mt-3 max-w-xl mx-auto">
          Computer, monitor, printer, accessories — assembled from real stock to fit your money and your goal. One tap adds it all to the cart.
        </p>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl p-6 space-y-4">
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-1.5">Budget (USD)</label>
          <div className="flex flex-wrap items-center gap-2">
            <input value={budget} onChange={(e) => setBudget(e.target.value.replace(/[^\d]/g, ''))} inputMode="numeric"
              className="w-32 bg-white border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 outline-none focus:border-blue-400" />
            {BUDGET_CHIPS.map((b) => (
              <button key={b} onClick={() => setBudget(String(b))}
                className={`text-xs rounded-full px-3 py-1.5 border transition-colors ${budget === String(b) ? 'bg-blue-600 text-white border-blue-600' : 'text-slate-500 border-slate-200 hover:border-blue-300'}`}>
                ${b.toLocaleString()}
              </button>
            ))}
          </div>
        </div>
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-1.5">What’s it for?</label>
          <input value={useCase} onChange={(e) => setUseCase(e.target.value)} maxLength={300}
            placeholder="e.g. architecture student — AutoCAD, Revit, some gaming"
            className="w-full bg-white border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 outline-none focus:border-blue-400" />
          <div className="flex flex-wrap gap-1.5 mt-2">
            {USE_CHIPS.map((u) => (
              <button key={u} onClick={() => setUseCase(u)}
                className={`text-xs rounded-full px-3 py-1 border transition-colors ${useCase === u ? 'bg-blue-50 text-blue-700 border-blue-300' : 'text-slate-500 border-slate-200 hover:border-blue-300'}`}>
                {u}
              </button>
            ))}
          </div>
        </div>
        {error && <p className="text-sm text-red-600 bg-red-50 rounded-xl px-4 py-3">{error}</p>}
        <button onClick={build} disabled={loading || useCase.trim().length < 3 || Number(budget) < 100}
          className="w-full inline-flex items-center justify-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 hover:from-blue-700 hover:to-blue-900 text-white font-semibold py-3.5 rounded-xl shadow-lg shadow-blue-600/20 transition-colors disabled:opacity-50">
          {loading ? <Loader2 size={17} className="animate-spin" /> : <Wand2 size={17} />}
          {loading ? 'Building your setup…' : 'Build my setup'}
        </button>
      </div>

      {setup && (
        <div className="mt-8">
          <p className="text-slate-700 leading-relaxed mb-5">{setup.intro}</p>
          <div className="space-y-3">
            {setup.items.map(({ product: p, role, reason }) => (
              <div key={p.id} className="flex gap-4 bg-white border border-slate-200 rounded-2xl p-4">
                <Link href={`/products/${p.slug}`} className="w-20 h-20 rounded-xl bg-slate-100 shrink-0 overflow-hidden relative flex items-center justify-center">
                  {p.images[0] ? <Image src={p.images[0]} alt={p.name} fill className="object-cover" sizes="80px" /> : <Package size={20} className="text-slate-300" />}
                </Link>
                <div className="flex-1 min-w-0">
                  <p className="text-[11px] font-semibold uppercase tracking-wide text-blue-600">{role}</p>
                  <Link href={`/products/${p.slug}`} className="font-semibold text-slate-900 hover:text-blue-600 leading-snug line-clamp-2">{p.name}</Link>
                  <p className="text-xs text-slate-500 mt-1 leading-relaxed">{reason}</p>
                </div>
                <p className="font-bold text-slate-900 tabular-nums shrink-0">${p.price.toLocaleString()}</p>
              </div>
            ))}
          </div>

          <div className="mt-5 bg-white border border-slate-200 rounded-2xl p-5">
            <div className="flex items-center justify-between mb-2">
              <span className="text-sm text-slate-500">Setup total</span>
              <span className="font-bold text-slate-900 text-xl tabular-nums">${setup.total.toLocaleString()}</span>
            </div>
            <div className="h-2 bg-slate-100 rounded-full overflow-hidden mb-1">
              <div className={`h-full rounded-full ${setup.total <= setup.budget ? 'bg-emerald-500' : 'bg-amber-500'}`}
                style={{ width: `${Math.min(100, (setup.total / setup.budget) * 100)}%` }} />
            </div>
            <p className="text-xs text-slate-400 mb-4">
              {setup.total <= setup.budget
                ? `$${(setup.budget - setup.total).toLocaleString()} left of your $${setup.budget.toLocaleString()} budget`
                : `$${(setup.total - setup.budget).toLocaleString()} over budget`}
            </p>
            <div className="flex flex-wrap gap-3">
              {added ? (
                <Link href="/checkout" className="inline-flex items-center gap-2 bg-emerald-600 hover:bg-emerald-700 text-white font-semibold px-6 py-3 rounded-xl transition-colors">
                  <Check size={16} /> Added — go to checkout
                </Link>
              ) : (
                <button onClick={addAll} className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-3 rounded-xl transition-colors">
                  <ShoppingCart size={16} /> Add all to cart
                </button>
              )}
              <button onClick={build} className="inline-flex items-center gap-2 bg-white border border-slate-200 hover:bg-slate-50 text-slate-700 font-semibold px-5 py-3 rounded-xl transition-colors">
                <RefreshCw size={15} /> Try another mix
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
