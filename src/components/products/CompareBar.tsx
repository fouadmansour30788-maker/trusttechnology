'use client'
import Link from 'next/link'
import Image from 'next/image'
import { usePathname } from 'next/navigation'
import { Scale, X, ArrowRight } from 'lucide-react'
import { useCompareStore } from '@/store/compare'

/** Floating bar shown while products are selected for comparison. */
export function CompareBar() {
  const { items, remove, clear } = useCompareStore()
  const pathname = usePathname()
  if (items.length === 0 || pathname === '/compare' || pathname.startsWith('/admin')) return null

  return (
    <div className="fixed bottom-4 left-1/2 -translate-x-1/2 z-40 bg-white border border-slate-200 rounded-2xl shadow-2xl shadow-slate-900/15 px-4 py-3 flex items-center gap-3 max-w-[calc(100vw-2rem)]">
      <span className="hidden sm:inline-flex items-center gap-1.5 text-sm font-semibold text-slate-700">
        <Scale size={15} className="text-blue-600" /> Compare
      </span>
      <div className="flex items-center gap-2">
        {items.map((p) => (
          <div key={p.id} className="relative w-11 h-11 rounded-lg bg-slate-100 border border-slate-200 overflow-hidden shrink-0" title={p.name}>
            {p.images[0] && <Image src={p.images[0]} alt={p.name} fill className="object-cover" sizes="44px" />}
            <button onClick={() => remove(p.id)}
              className="absolute -top-0 -right-0 w-4 h-4 bg-slate-900/70 hover:bg-slate-900 text-white rounded-bl-lg flex items-center justify-center">
              <X size={9} />
            </button>
          </div>
        ))}
      </div>
      <Link href="/compare"
        className="inline-flex items-center gap-1.5 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-4 py-2 rounded-xl transition-colors whitespace-nowrap">
        Compare {items.length > 1 ? `(${items.length})` : ''} <ArrowRight size={14} />
      </Link>
      <button onClick={clear} className="text-xs text-slate-400 hover:text-slate-600">Clear</button>
    </div>
  )
}
