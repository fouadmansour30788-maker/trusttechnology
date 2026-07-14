'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { ArrowLeft, Plus, Trash2, Loader2 } from 'lucide-react'
import type { Customer, ProductLite } from '@/lib/erp'
import { createSale } from '@/app/admin/erp-actions'
import { BarcodeScanner } from './BarcodeScanner'

type Line = { product_id: string; quantity: number; unit_price: number }

export function SaleForm({ customers, products }: { customers: Customer[]; products: ProductLite[] }) {
  const router = useRouter()
  const [customerId, setCustomerId] = useState('')
  const [discount, setDiscount] = useState(0)
  const [markPaid, setMarkPaid] = useState(true)
  const [method, setMethod] = useState('cash')
  const [lines, setLines] = useState<Line[]>([{ product_id: '', quantity: 1, unit_price: 0 }])
  const [error, setError] = useState<string | null>(null)
  const [saving, start] = useTransition()

  const subtotal = lines.reduce((s, l) => s + l.quantity * l.unit_price, 0)
  const total = Math.max(0, subtotal - discount)
  const inputCls = 'px-3 py-2 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400'

  function setLine(i: number, patch: Partial<Line>) {
    setLines((p) => p.map((l, j) => (j === i ? { ...l, ...patch } : l)))
  }
  function pickProduct(i: number, product_id: string) {
    const prod = products.find((p) => p.id === product_id)
    setLine(i, { product_id, unit_price: prod && prod.price > 0 ? Number(prod.price) : lines[i].unit_price })
  }

  function addScanned(prod: ProductLite) {
    setLines((prev) => {
      const existing = prev.findIndex((l) => l.product_id === prod.id)
      if (existing >= 0) return prev.map((l, j) => (j === existing ? { ...l, quantity: l.quantity + 1 } : l))
      const empty = prev.findIndex((l) => !l.product_id)
      const line = { product_id: prod.id, quantity: 1, unit_price: prod.price > 0 ? Number(prod.price) : 0 }
      if (empty >= 0) return prev.map((l, j) => (j === empty ? line : l))
      return [...prev, line]
    })
  }

  function submit() {
    setError(null)
    start(async () => {
      const res = await createSale({
        customer_id: customerId || null,
        discount: Number(discount) || 0,
        markPaid,
        payment_method: markPaid ? method : null,
        items: lines.filter((l) => l.product_id).map((l) => ({ product_id: l.product_id, quantity: Number(l.quantity), unit_price: Number(l.unit_price) })),
      })
      if (res.error) setError(res.error)
      else router.push(`/admin/sales/${res.id}`)
    })
  }

  return (
    <div className="max-w-3xl">
      <button onClick={() => router.back()} className="inline-flex items-center gap-1 text-sm text-slate-500 hover:text-slate-900 mb-4"><ArrowLeft size={15} /> Back</button>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">New sale</h1>

      <div className="bg-white border border-slate-200 rounded-2xl p-5 mb-5">
        <label className="block text-xs font-medium text-slate-500 mb-1">Customer (optional)</label>
        <select className={inputCls + ' w-full'} value={customerId} onChange={(e) => setCustomerId(e.target.value)}>
          <option value="">Walk-in customer</option>
          {customers.map((c) => <option key={c.id} value={c.id}>{c.name}{c.phone ? ` · ${c.phone}` : ''}</option>)}
        </select>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <p className="text-xs font-medium text-slate-500 mb-3">Items</p>
        <BarcodeScanner products={products} onFound={addScanned} />
        <div className="space-y-2">
          {lines.map((l, i) => {
            const prod = products.find((p) => p.id === l.product_id)
            return (
              <div key={i} className="flex gap-2 items-center">
                <select className={inputCls + ' flex-1'} value={l.product_id} onChange={(e) => pickProduct(i, e.target.value)}>
                  <option value="">— product —</option>
                  {products.map((p) => <option key={p.id} value={p.id}>{p.name} (stock {p.stock})</option>)}
                </select>
                <input type="number" min={1} className={inputCls + ' w-16'} value={l.quantity} onChange={(e) => setLine(i, { quantity: Number(e.target.value) })} title="Qty" />
                <input type="number" step="0.01" className={inputCls + ' w-24'} value={l.unit_price} onChange={(e) => setLine(i, { unit_price: Number(e.target.value) })} title="Unit price" />
                <span className="w-20 text-right text-sm text-slate-600">${(l.quantity * l.unit_price).toFixed(2)}</span>
                <button onClick={() => setLines((p) => p.filter((_, j) => j !== i))} className="p-2 text-slate-400 hover:text-red-600"><Trash2 size={15} /></button>
                {prod && l.quantity > prod.stock && <span className="text-[10px] text-amber-600 absolute" style={{ marginTop: 34 }}></span>}
              </div>
            )
          })}
        </div>
        <button onClick={() => setLines((p) => [...p, { product_id: '', quantity: 1, unit_price: 0 }])} className="inline-flex items-center gap-1 text-sm text-blue-600 hover:text-blue-700 mt-3">
          <Plus size={14} /> Add item
        </button>

        <div className="border-t border-slate-100 mt-4 pt-4 space-y-2 text-sm">
          <div className="flex justify-between text-slate-500"><span>Subtotal</span><span>${subtotal.toFixed(2)}</span></div>
          <div className="flex justify-between items-center text-slate-500">
            <span>Discount</span>
            <input type="number" step="0.01" className={inputCls + ' w-28 text-right'} value={discount} onChange={(e) => setDiscount(Number(e.target.value))} />
          </div>
          <div className="flex justify-between text-lg font-bold text-slate-900 pt-1"><span>Total</span><span>${total.toFixed(2)}</span></div>
        </div>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl p-5 mt-5 flex flex-wrap items-center gap-4">
        <label className="flex items-center gap-2 text-sm text-slate-700">
          <input type="checkbox" checked={markPaid} onChange={(e) => setMarkPaid(e.target.checked)} /> Mark as paid
        </label>
        {markPaid && (
          <select className={inputCls} value={method} onChange={(e) => setMethod(e.target.value)}>
            <option value="cash">Cash</option>
            <option value="card">Card</option>
            <option value="transfer">Bank transfer</option>
            <option value="whatsapp">WhatsApp / online</option>
          </select>
        )}
        <span className="text-xs text-slate-400">Completing the sale deducts stock automatically.</span>
      </div>

      {error && <p className="text-sm text-red-600 mt-4">{error}</p>}

      <button onClick={submit} disabled={saving} className="mt-6 inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white font-semibold px-6 py-2.5 rounded-xl shadow-lg shadow-blue-600/20 disabled:opacity-50">
        {saving && <Loader2 size={16} className="animate-spin" />} Complete sale
      </button>
    </div>
  )
}
