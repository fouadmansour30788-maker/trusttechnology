'use client'
import { useState, useTransition } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { Search, Edit, Trash2, ToggleLeft, ToggleRight, Package } from 'lucide-react'
import type { Product } from '@/lib/types'
import { Badge } from '@/components/ui/badge'
import { setProductActive, deleteProduct } from '@/app/admin/actions'

export function ProductsTable({ initial }: { initial: Product[] }) {
  const [products, setProducts] = useState(initial)
  const [search, setSearch] = useState('')
  const [, startTransition] = useTransition()

  const filtered = products.filter(
    (p) =>
      p.name.toLowerCase().includes(search.toLowerCase()) ||
      p.sku?.toLowerCase().includes(search.toLowerCase())
  )

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
      <div className="flex items-center gap-3 bg-white border border-slate-200 rounded-xl px-4 py-2.5 mb-6 max-w-md">
        <Search size={16} className="text-slate-400" />
        <input
          placeholder="Search by name or SKU…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="bg-transparent text-sm text-slate-900 placeholder-slate-400 outline-none flex-1"
        />
        <span className="text-xs text-slate-400">{filtered.length}</span>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl overflow-hidden">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-slate-200 bg-slate-50/60">
              <th className="text-left px-5 py-3 text-slate-500 font-medium">Product</th>
              <th className="text-left px-5 py-3 text-slate-500 font-medium hidden md:table-cell">SKU</th>
              <th className="text-left px-5 py-3 text-slate-500 font-medium">Price</th>
              <th className="text-left px-5 py-3 text-slate-500 font-medium hidden lg:table-cell">Stock</th>
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
                        {p.images[0] ? (
                          <Image src={p.images[0]} alt={p.name} fill className="object-cover" sizes="40px" />
                        ) : (
                          <Package size={15} className="text-slate-300" />
                        )}
                      </div>
                      <div className="min-w-0">
                        <p className="text-slate-900 font-medium truncate max-w-[260px]">{p.name}</p>
                        <div className="flex gap-1 mt-0.5 flex-wrap">
                          {p.tags?.slice(0, 2).map((t) => <Badge key={t.id}>{t.name}</Badge>)}
                          {p.is_featured && <Badge variant="amber">Featured</Badge>}
                        </div>
                      </div>
                    </div>
                  </td>
                  <td className="px-5 py-3 text-slate-400 hidden md:table-cell">{p.sku ?? '—'}</td>
                  <td className="px-5 py-3">
                    {onRequest ? <span className="text-blue-600 font-medium">Call</span> : <span className="text-slate-900 font-semibold">${p.price}</span>}
                  </td>
                  <td className="px-5 py-3 hidden lg:table-cell">
                    <span className={p.stock === 0 ? 'text-red-500' : 'text-slate-600'}>{p.stock === 0 ? 'Out' : p.stock}</span>
                  </td>
                  <td className="px-5 py-3">
                    <button onClick={() => toggle(p)} className="flex items-center gap-1.5 text-sm">
                      {p.is_active
                        ? <><ToggleRight size={18} className="text-blue-500" /><span className="text-blue-600">Active</span></>
                        : <><ToggleLeft size={18} className="text-slate-300" /><span className="text-slate-400">Hidden</span></>}
                    </button>
                  </td>
                  <td className="px-5 py-3">
                    <div className="flex items-center gap-1 justify-end">
                      <Link href={`/admin/products/${p.id}`} className="p-1.5 text-slate-400 hover:text-blue-600 hover:bg-blue-50 rounded-lg transition-colors">
                        <Edit size={15} />
                      </Link>
                      <button onClick={() => remove(p)} className="p-1.5 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors">
                        <Trash2 size={15} />
                      </button>
                    </div>
                  </td>
                </tr>
              )
            })}
            {filtered.length === 0 && (
              <tr><td colSpan={6} className="px-5 py-12 text-center text-slate-400">No products found</td></tr>
            )}
          </tbody>
        </table>
      </div>
    </>
  )
}
