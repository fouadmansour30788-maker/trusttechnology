'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { Loader2, Plus, Minus, AlertTriangle } from 'lucide-react'
import type { ProductLite, StockMovement } from '@/lib/erp'
import { adjustStock } from '@/app/admin/erp-actions'

const REASON: Record<string, string> = {
  purchase: 'text-blue-600', sale: 'text-red-500', adjustment: 'text-blue-600',
  return: 'text-blue-600', initial: 'text-slate-500',
}

export function InventoryManager({ lowStock, movements, products }: { lowStock: ProductLite[]; movements: StockMovement[]; products: ProductLite[] }) {
  const router = useRouter()
  const [productId, setProductId] = useState('')
  const [qty, setQty] = useState(1)
  const [dir, setDir] = useState<1 | -1>(1)
  const [note, setNote] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [pending, start] = useTransition()
  const inputCls = 'px-3 py-2 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400'

  function submit(e: React.FormEvent) {
    e.preventDefault()
    setError(null)
    start(async () => {
      const res = await adjustStock(productId, dir * Math.abs(qty), note)
      if (res.error) setError(res.error)
      else { setProductId(''); setQty(1); setNote(''); router.refresh() }
    })
  }

  return (
    <div className="space-y-6">
      {/* Adjust */}
      <form onSubmit={submit} className="bg-white border border-slate-200 rounded-2xl p-5">
        <p className="text-xs font-medium text-slate-500 mb-3">Manual stock adjustment</p>
        <div className="flex flex-wrap items-center gap-2">
          <select required className={inputCls + ' flex-1 min-w-[200px]'} value={productId} onChange={(e) => setProductId(e.target.value)}>
            <option value="">— select product —</option>
            {products.map((p) => <option key={p.id} value={p.id}>{p.name} (stock {p.stock})</option>)}
          </select>
          <div className="flex rounded-lg border border-slate-200 overflow-hidden">
            <button type="button" onClick={() => setDir(1)} className={`px-3 py-2 ${dir === 1 ? 'bg-blue-600 text-white' : 'text-slate-500'}`}><Plus size={14} /></button>
            <button type="button" onClick={() => setDir(-1)} className={`px-3 py-2 ${dir === -1 ? 'bg-red-500 text-white' : 'text-slate-500'}`}><Minus size={14} /></button>
          </div>
          <input type="number" min={1} className={inputCls + ' w-20'} value={qty} onChange={(e) => setQty(Number(e.target.value))} />
          <input className={inputCls + ' flex-1 min-w-[160px]'} placeholder="Reason (optional)" value={note} onChange={(e) => setNote(e.target.value)} />
          <button type="submit" disabled={pending} className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white text-sm font-semibold px-4 py-2 rounded-lg disabled:opacity-50">
            {pending && <Loader2 size={15} className="animate-spin" />} Apply
          </button>
        </div>
        {error && <p className="text-sm text-red-600 mt-2">{error}</p>}
      </form>

      <div className="grid lg:grid-cols-2 gap-6">
        {/* Low stock */}
        <div className="bg-white border border-slate-200 rounded-2xl overflow-hidden">
          <div className="px-5 py-3 border-b border-slate-100 flex items-center gap-2">
            <AlertTriangle size={15} className="text-blue-500" />
            <span className="font-semibold text-slate-900 text-sm">Low stock (≤ 5)</span>
            <span className="ml-auto text-xs text-slate-400">{lowStock.length}</span>
          </div>
          <table className="w-full text-sm">
            <tbody className="divide-y divide-slate-100">
              {lowStock.map((p) => (
                <tr key={p.id}>
                  <td className="px-5 py-2.5 text-slate-700 truncate max-w-[240px]">{p.name}</td>
                  <td className="px-5 py-2.5 text-right">
                    <span className={p.stock === 0 ? 'text-red-500 font-medium' : 'text-blue-600'}>{p.stock === 0 ? 'Out' : p.stock}</span>
                  </td>
                </tr>
              ))}
              {lowStock.length === 0 && <tr><td className="px-5 py-8 text-center text-slate-400">All stocked up 🎉</td></tr>}
            </tbody>
          </table>
        </div>

        {/* Movements ledger */}
        <div className="bg-white border border-slate-200 rounded-2xl overflow-hidden">
          <div className="px-5 py-3 border-b border-slate-100"><span className="font-semibold text-slate-900 text-sm">Recent stock movements</span></div>
          <div className="max-h-[360px] overflow-y-auto">
            <table className="w-full text-sm">
              <tbody className="divide-y divide-slate-100">
                {movements.map((m) => (
                  <tr key={m.id}>
                    <td className="px-5 py-2.5">
                      <p className="text-slate-700 truncate max-w-[200px]">{m.product?.name ?? '—'}</p>
                      <p className="text-xs text-slate-400">{m.reason}{m.reference ? ` · ${m.reference}` : ''}</p>
                    </td>
                    <td className={`px-5 py-2.5 text-right font-medium ${m.delta >= 0 ? 'text-blue-600' : 'text-red-500'}`}>
                      {m.delta >= 0 ? '+' : ''}{m.delta}
                    </td>
                  </tr>
                ))}
                {movements.length === 0 && <tr><td className="px-5 py-8 text-center text-slate-400">No movements yet</td></tr>}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  )
}
