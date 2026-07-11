'use client'
import { useState, useTransition } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { Search, Edit, Trash2, ToggleLeft, ToggleRight, Package } from 'lucide-react'
import type { Product, Category } from '@/lib/types'
import { Badge } from '@/components/ui/badge'
import { setProductActive, deleteProduct } from '@/app/admin/actions'

export type MarketPrice = { price: number; competitor: string }

export function ProductsTable({ initial, categories = [], marketPrices = {} }: {
  initial: Product[]
  categories?: Category[]
  marketPrices?: Record<string, MarketPrice>
}) {
  const [products, setProducts] = useState(initial)
  const [search, setSearch] = useState('')
  const [cat, setCat] = useState('')
  const [, startTransition] = useTransition()

  const catName = (id: string | null) => categories.find((c) => c.id === id)?.name ?? '—'

  const filtered = products.filter((p) => {
    const matchesSearch =
      p.name.toLowerCase().includes(search.toLowerCase()) || p.sku?.toLowerCase().includes(search.toLowerCase())
    const matchesCat = !cat || p.primary_category_id === cat
    return matchesSearch && matchesCat
  })

  function toggle(p: Product) {
    setProducts((prev) => prev.map((x) => (x.id === p.id ? { ...x, is_active: !x.is_active } : x)))
    startTransition(() => { setProductActive(p.id, !p.is_active) })
  }
  function remove(p: Product) {
    if (!confirm(`Delete "${p.name}"? This cannot be undone.`)) return
    setProducts((prev) => prev.filter((x) => x.id !== p.id))
    startTransition(() => { deleteProduct(p.id) })
  }

  return (
    <>
      <div className="flex flex-wrap items-center gap-3 mb-6">
        <div className="flex items-center gap-3 bg-white border border-slate-200 rounded-xl px-4 py-2.5 flex-1 min-w-[220px] max-w-md">
          <Search size={16} className="text-slate-400" />
          <input
            placeholder="Search by name or SKU…"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="bg-transparent text-sm text-slate-900 placeholder-slate-400 outline-none flex-1"
          />
        </div>
        {categories.length > 0 && (
          <select value={cat} onChange={(e) => setCat(e.target.value)} className="bg-white border border-slate-200 rounded-xl px-3 py-2.5 text-sm text-slate-700 outline-none focus:border-blue-400">
            <option value="">All categories</option>
            {categories.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
          </select>
        )}
        <span className="text-xs text-slate-400 ml-auto">{filtered.length} shown</span>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl overflow-x-auto">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-slate-200 bg-slate-50/60">
              <th className="text-left px-5 py-3 text-slate-500 font-medium">Product</th>
              <th className="text-left px-5 py-3 text-slate-500 font-medium hidden md:table-cell">Category</th>
              <th className="text-right px-5 py-3 text-slate-500 font-medium hidden lg:table-cell">Cost</th>
              <th className="text-right px-5 py-3 text-slate-500 font-medium">Price</th>
              <th className="text-right px-5 py-3 text-slate-500 font-medium hidden lg:table-cell">VAT</th>
              <th className="text-right px-5 py-3 text-slate-500 font-medium hidden xl:table-cell">Stock</th>
              <th className="text-left px-5 py-3 text-slate-500 font-medium">Status</th>
              <th className="text-right px-5 py-3 text-slate-500 font-medium">Actions</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {filtered.map((p) => {
              const onRequest = p.priceOnRequest || p.price === 0
              return (
                <tr key={p.id} className="hover:bg-slate-50/60 transition-colors">
                  <td className="px-5 py-3">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-lg bg-slate-100 overflow-hidden relative shrink-0 flex items-center justify-center">
                        {p.images[0] ? <Image src={p.images[0]} alt={p.name} fill className="object-cover" sizes="40px" /> : <Package size={15} className="text-slate-300" />}
                      </div>
                      <div className="min-w-0">
                        <p className="text-slate-900 font-medium truncate max-w-[240px]">{p.name}</p>
                        <div className="flex gap-1 mt-0.5 flex-wrap">
                          {p.tags?.slice(0, 2).map((t) => <Badge key={t.id}>{t.name}</Badge>)}
                          {p.is_featured && <Badge variant="amber">Featured</Badge>}
                        </div>
                      </div>
                    </div>
                  </td>
                  <td className="px-5 py-3 text-slate-500 hidden md:table-cell">{catName(p.primary_category_id)}</td>
                  <td className="px-5 py-3 text-right text-slate-500 hidden lg:table-cell">{p.cost ? `$${Number(p.cost).toFixed(2)}` : '—'}</td>
                  <td className="px-5 py-3 text-right">
                    {onRequest ? <span className="text-blue-600 font-medium">Call</span> : <span className="text-slate-900 font-semibold">${p.price}</span>}
                    {marketPrices[p.id] && (
                      <p
                        className={`text-[11px] whitespace-nowrap ${
                          onRequest ? 'text-slate-400' : Number(p.price) > marketPrices[p.id].price * 1.03 ? 'text-red-500' : 'text-emerald-600'
                        }`}
                        title={`Cheapest competitor: ${marketPrices[p.id].competitor}`}
                      >
                        mkt ${marketPrices[p.id].price.toLocaleString(undefined, { maximumFractionDigits: 0 })}
                      </p>
                    )}
                  </td>
                  <td className="px-5 py-3 text-right text-slate-500 hidden lg:table-cell">{p.vat_rate != null ? `${Number(p.vat_rate)}%` : '—'}</td>
                  <td className="px-5 py-3 text-right hidden xl:table-cell">
                    <span className={p.stock === 0 ? 'text-red-500' : 'text-slate-600'}>{p.stock === 0 ? 'Out' : p.stock}</span>
                  </td>
                  <td className="px-5 py-3">
                    <button onClick={() => toggle(p)} className="flex items-center gap-1.5 text-sm">
                      {p.is_active
                        ? <><ToggleRight size={18} className="text-blue-600" /><span className="text-blue-700">Active</span></>
                        : <><ToggleLeft size={18} className="text-slate-300" /><span className="text-slate-400">Hidden</span></>}
                    </button>
                  </td>
                  <td className="px-5 py-3">
                    <div className="flex items-center gap-1 justify-end">
                      <Link href={`/admin/products/${p.id}`} className="p-1.5 text-slate-400 hover:text-blue-600 hover:bg-blue-50 rounded-lg transition-colors"><Edit size={15} /></Link>
                      <button onClick={() => remove(p)} className="p-1.5 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors"><Trash2 size={15} /></button>
                    </div>
                  </td>
                </tr>
              )
            })}
            {filtered.length === 0 && (
              <tr><td colSpan={8} className="px-5 py-12 text-center text-slate-400">No products found</td></tr>
            )}
          </tbody>
        </table>
      </div>
    </>
  )
}
