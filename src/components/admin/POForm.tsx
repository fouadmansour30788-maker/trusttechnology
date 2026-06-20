'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { ArrowLeft, Plus, Trash2, Loader2 } from 'lucide-react'
import type { Supplier, ProductLite } from '@/lib/erp'
import { createPurchaseOrder } from '@/app/admin/erp-actions'

type Line = { product_id: string; quantity: number; unit_cost: number }

export function POForm({ suppliers, products }: { suppliers: Supplier[]; products: ProductLite[] }) {
  const router = useRouter()
  const [supplierId, setSupplierId] = useState('')
  const [expected, setExpected] = useState('')
  const [notes, setNotes] = useState('')
  const [lines, setLines] = useState<Line[]>([{ product_id: '', quantity: 1, unit_cost: 0 }])
  const [error, setError] = useState<string | null>(null)
  const [saving, start] = useTransition()

  const total = lines.reduce((s, l) => s + l.quantity * l.unit_cost, 0)
  const setLine = (i: number, patch: Partial<Line>) => setLines((p) => p.map((l, j) => (j === i ? { ...l, ...patch } : l)))
  const inputCls = 'px-3 py-2 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400'

  function submit(status: 'draft' | 'ordered') {
    setError(null)
    start(async () => {
      const res = await createPurchaseOrder({
        supplier_id: supplierId || null,
        expected_date: expected || null,
        notes: notes || null,
        status,
        items: lines.filter((l) => l.product_id).map((l) => ({ product_id: l.product_id, quantity: Number(l.quantity), unit_cost: Number(l.unit_cost) })),
      })
      if (res.error) setError(res.error)
      else router.push(`/admin/purchase-orders/${res.id}`)
    })
  }

  return (
    <div className="max-w-3xl">
      <button onClick={() => router.back()} className="inline-flex items-center gap-1 text-sm text-slate-500 hover:text-slate-900 mb-4"><ArrowLeft size={15} /> Back</button>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">New purchase order</h1>

      <div className="bg-white border border-slate-200 rounded-2xl p-5 space-y-4 mb-5">
        <div className="grid sm:grid-cols-2 gap-4">
          <div>
            <label className="block text-xs font-medium text-slate-500 mb-1">Supplier</label>
            <select className={inputCls + ' w-full'} value={supplierId} onChange={(e) => setSupplierId(e.target.value)}>
              <option value="">— select —</option>
              {suppliers.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
            </select>
          </div>
          <div>
            <label className="block text-xs font-medium text-slate-500 mb-1">Expected date</label>
            <input type="date" className={inputCls + ' w-full'} value={expected} onChange={(e) => setExpected(e.target.value)} />
          </div>
        </div>
        <div>
          <label className="block text-xs font-medium text-slate-500 mb-1">Notes</label>
          <input className={inputCls + ' w-full'} value={notes} onChange={(e) => setNotes(e.target.value)} />
        </div>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <p className="text-xs font-medium text-slate-500 mb-3">Line items</p>
        <div className="space-y-2">
          {lines.map((l, i) => (
            <div key={i} className="flex gap-2 items-center">
              <select className={inputCls + ' flex-1'} value={l.product_id} onChange={(e) => setLine(i, { product_id: e.target.value })}>
                <option value="">— product —</option>
                {products.map((p) => <option key={p.id} value={p.id}>{p.name}{p.sku ? ` (${p.sku})` : ''}</option>)}
              </select>
              <input type="number" min={1} className={inputCls + ' w-20'} value={l.quantity} onChange={(e) => setLine(i, { quantity: Number(e.target.value) })} title="Qty" />
              <input type="number" step="0.01" className={inputCls + ' w-28'} value={l.unit_cost} onChange={(e) => setLine(i, { unit_cost: Number(e.target.value) })} title="Unit cost" placeholder="Cost" />
              <span className="w-24 text-right text-sm text-slate-600">${(l.quantity * l.unit_cost).toFixed(2)}</span>
              <button onClick={() => setLines((p) => p.filter((_, j) => j !== i))} className="p-2 text-slate-400 hover:text-red-600"><Trash2 size={15} /></button>
            </div>
          ))}
        </div>
        <button onClick={() => setLines((p) => [...p, { product_id: '', quantity: 1, unit_cost: 0 }])} className="inline-flex items-center gap-1 text-sm text-blue-600 hover:text-blue-700 mt-3">
          <Plus size={14} /> Add line
        </button>
        <div className="flex justify-end mt-4 pt-4 border-t border-slate-100">
          <span className="text-slate-500 text-sm mr-3 self-center">Total</span>
          <span className="text-xl font-bold text-slate-900">${total.toFixed(2)}</span>
        </div>
      </div>

      {error && <p className="text-sm text-red-600 mt-4">{error}</p>}

      <div className="flex gap-3 mt-6">
        <button onClick={() => submit('ordered')} disabled={saving} className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white font-semibold px-6 py-2.5 rounded-xl shadow-lg shadow-blue-600/20 disabled:opacity-50">
          {saving && <Loader2 size={16} className="animate-spin" />} Create &amp; mark ordered
        </button>
        <button onClick={() => submit('draft')} disabled={saving} className="px-5 py-2.5 rounded-xl border border-slate-200 text-sm font-medium text-slate-600 hover:bg-slate-50">Save as draft</button>
      </div>
    </div>
  )
}
