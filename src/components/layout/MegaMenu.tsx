'use client'
import Link from 'next/link'
import { ArrowRight } from 'lucide-react'
import type { NavCategory } from '@/lib/types'

type Props = {
  category: NavCategory
  onClose: () => void
}

export function MegaMenu({ category, onClose }: Props) {
  return (
    <div className="absolute top-full left-0 w-full bg-white border-b border-slate-200 shadow-xl shadow-slate-900/5 z-50">
      <div className="max-w-7xl mx-auto px-6 py-8">
        <div className="flex gap-12">
          {/* Columns */}
          <div className="flex gap-12 flex-1">
            {category.columns.map((col) => (
              <div key={col.title} className="min-w-[160px]">
                <p className="text-xs font-semibold uppercase tracking-widest text-slate-400 mb-4">
                  {col.title}
                </p>
                <ul className="space-y-2">
                  {col.items.map((item) => (
                    <li key={item.slug}>
                      <Link
                        href={`/categories/${item.slug}`}
                        onClick={onClose}
                        className="text-sm text-slate-600 hover:text-blue-600 transition-colors"
                      >
                        {item.label}
                      </Link>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>

          {/* Featured */}
          {category.featured && (
            <div className="w-56 shrink-0">
              <div className="bg-gradient-to-br from-blue-600 to-blue-800 rounded-2xl p-5 h-full flex flex-col justify-between shadow-lg shadow-blue-600/20">
                <div>
                  <p className="text-xs font-semibold uppercase tracking-widest text-blue-100 mb-2">
                    Featured
                  </p>
                  <p className="text-white font-semibold text-lg leading-snug">
                    {category.featured.label}
                  </p>
                </div>
                <Link
                  href={`/bundles?type=${category.featured.tag ?? ''}`}
                  onClick={onClose}
                  className="mt-4 inline-flex items-center gap-1 text-sm text-white/90 hover:text-white transition-colors"
                >
                  Shop now <ArrowRight size={14} />
                </Link>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
