'use client'
import { useEffect, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { History } from 'lucide-react'
import { useRecentlyViewedStore } from '@/store/recentlyViewed'

/**
 * Reads purely from localStorage (via the persisted zustand store) — no
 * backend call, so this never goes stale-vs-live and costs nothing server
 * side. Hydration-gated behind mounted state since the store's persisted
 * value differs between server (empty) and client (whatever's in
 * localStorage), which would otherwise mismatch on first paint.
 */
export function RecentlyViewedCarousel({ excludeId }: { excludeId?: string }) {
  const [mounted, setMounted] = useState(false)
  const items = useRecentlyViewedStore((s) => s.items)
  useEffect(() => setMounted(true), [])

  if (!mounted) return null
  const shown = items.filter((i) => i.id !== excludeId).slice(0, 10)
  if (shown.length === 0) return null

  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 pb-16">
      <div className="flex items-center gap-2 mb-4">
        <History size={18} className="text-slate-400" />
        <h2 className="text-xl font-bold text-slate-900">Recently viewed</h2>
      </div>
      <div className="flex gap-4 overflow-x-auto pb-2 -mx-1 px-1 [scrollbar-width:thin]">
        {shown.map((p) => (
          <Link
            key={p.id}
            href={`/products/${p.slug}`}
            className="group shrink-0 w-36 sm:w-40 bg-white border border-slate-200 rounded-2xl overflow-hidden hover:border-blue-200 hover:shadow-md transition-all"
          >
            <div className="aspect-square bg-slate-100 relative overflow-hidden">
              {p.image ? (
                <Image src={p.image} alt={p.name} fill className="object-cover group-hover:scale-105 transition-transform duration-300" sizes="160px" />
              ) : (
                <div className="w-full h-full flex items-center justify-center text-slate-300 text-2xl">📦</div>
              )}
            </div>
            <div className="p-3">
              <p className="text-xs text-slate-700 font-medium leading-snug line-clamp-2">{p.name}</p>
              <p className="text-sm font-bold text-slate-900 mt-1">
                {p.priceOnRequest || p.price === 0 ? 'Call for price' : `$${p.price.toFixed(2)}`}
              </p>
            </div>
          </Link>
        ))}
      </div>
    </section>
  )
}
