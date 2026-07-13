'use client'
import Link from 'next/link'
import Image from 'next/image'
import { Scale, X, ShoppingCart, MessageCircle, ArrowRight } from 'lucide-react'
import { useCompareStore } from '@/store/compare'
import { useCartStore } from '@/store/cart'

const WHATSAPP = '96171998983'

export default function ComparePage() {
  const { items, remove, clear } = useCompareStore()
  const addItem = useCartStore((s) => s.addItem)

  if (items.length === 0) {
    return (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 py-24 flex flex-col items-center text-center gap-5">
        <Scale size={44} className="text-slate-300" />
        <h1 className="text-2xl font-bold text-slate-900">Nothing to compare yet</h1>
        <p className="text-slate-500 max-w-md">Tap the <Scale size={13} className="inline text-blue-600" /> compare icon on any product card to add it — pick up to 3 products.</p>
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

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-10">
      <div className="flex items-center justify-between flex-wrap gap-3 mb-8">
        <div>
          <h1 className="text-3xl font-bold text-slate-900">Compare products</h1>
          <p className="text-slate-500 text-sm mt-0.5">{items.length} of 3 selected</p>
        </div>
        <button onClick={clear} className="text-sm text-slate-400 hover:text-slate-700">Clear all</button>
      </div>

      <div className="overflow-x-auto">
        <table className="w-full text-sm border-separate border-spacing-0">
          <thead>
            <tr>
              <th className="w-32 min-w-[8rem]" />
              {items.map((p) => (
                <th key={p.id} className="text-left align-top pb-4 pr-6 min-w-[220px]">
                  <div className="relative">
                    <button onClick={() => remove(p.id)} className="absolute -top-1 right-2 text-slate-300 hover:text-slate-600" title="Remove">
                      <X size={15} />
                    </button>
                    <Link href={`/products/${p.slug}`} className="block w-28 h-28 rounded-xl bg-slate-100 overflow-hidden relative mb-3">
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
                    <div className="mt-3">
                      {p.priceOnRequest || p.price === 0 ? (
                        <a href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent('Hi, I would like a price for: ' + p.name)}`}
                          target="_blank" rel="noopener noreferrer"
                          className="inline-flex items-center gap-1.5 text-xs font-semibold text-blue-700 bg-blue-50 hover:bg-blue-100 rounded-lg px-3 py-2">
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
              ))}
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
