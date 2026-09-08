'use client'
import { useRef, useState, useEffect, useCallback } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import { CATEGORIES } from '@/lib/categories-data'

// Compact horizontal quick-nav — a row of circular category thumbnails the
// shopper can scan/scroll in one glance, distinct from BentoGrid's larger
// photo-card grid further down the page. Scroll position drives which arrow
// shows so we never render a dead button at either end.
export function CategoryScroller() {
  const scrollerRef = useRef<HTMLDivElement>(null)
  const [canScrollLeft, setCanScrollLeft] = useState(false)
  const [canScrollRight, setCanScrollRight] = useState(false)

  const updateArrows = useCallback(() => {
    const el = scrollerRef.current
    if (!el) return
    setCanScrollLeft(el.scrollLeft > 8)
    setCanScrollRight(el.scrollLeft < el.scrollWidth - el.clientWidth - 8)
  }, [])

  useEffect(() => {
    updateArrows()
    const el = scrollerRef.current
    if (!el) return
    el.addEventListener('scroll', updateArrows, { passive: true })
    window.addEventListener('resize', updateArrows)
    return () => {
      el.removeEventListener('scroll', updateArrows)
      window.removeEventListener('resize', updateArrows)
    }
  }, [updateArrows])

  function scrollBy(dir: 1 | -1) {
    const el = scrollerRef.current
    if (!el) return
    el.scrollBy({ left: dir * el.clientWidth * 0.7, behavior: 'smooth' })
  }

  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 py-8 relative">
      <div className="relative">
        {canScrollLeft && (
          <button
            onClick={() => scrollBy(-1)}
            aria-label="Scroll categories left"
            className="hidden sm:flex absolute -left-4 top-1/2 -translate-y-1/2 z-10 w-9 h-9 rounded-full bg-white border border-slate-200 shadow-md items-center justify-center text-slate-500 hover:text-blue-600 hover:border-blue-200 transition-colors"
          >
            <ChevronLeft size={18} />
          </button>
        )}

        <div
          ref={scrollerRef}
          className="flex justify-center sm:justify-between gap-6 sm:gap-4 overflow-x-auto scroll-smooth [scrollbar-width:none] [-ms-overflow-style:none] [&::-webkit-scrollbar]:hidden px-1 py-1"
        >
          {CATEGORIES.map((c) => (
            <Link
              key={c.id}
              href={c.href}
              className="group flex flex-col items-center gap-2.5 shrink-0 w-24 text-center"
            >
              <div className="w-20 h-20 rounded-full bg-slate-100 border border-slate-200 flex items-center justify-center overflow-hidden relative transition-colors group-hover:border-blue-200 group-hover:bg-blue-50">
                <Image
                  src={c.image}
                  alt={c.label}
                  fill
                  sizes="80px"
                  className="object-contain p-3 transition-transform duration-300 group-hover:scale-110"
                />
              </div>
              <span className="text-[11px] font-bold uppercase tracking-wide text-slate-700 leading-tight group-hover:text-blue-600 transition-colors">
                {c.label}
              </span>
            </Link>
          ))}
        </div>

        {canScrollRight && (
          <button
            onClick={() => scrollBy(1)}
            aria-label="Scroll categories right"
            className="hidden sm:flex absolute -right-4 top-1/2 -translate-y-1/2 z-10 w-9 h-9 rounded-full bg-white border border-slate-200 shadow-md items-center justify-center text-slate-500 hover:text-blue-600 hover:border-blue-200 transition-colors"
          >
            <ChevronRight size={18} />
          </button>
        )}
      </div>
    </section>
  )
}
