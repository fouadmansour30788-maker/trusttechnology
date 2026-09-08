'use client'
import { useRef, useState, useEffect, useCallback } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { ChevronLeft, ChevronRight, ArrowRight } from 'lucide-react'
import type { Product } from '@/lib/types'

// A colored "brand banner + scrollable product row" section, the pattern
// retailers like Ayoub Computers use for vendor promo spots (their "Braun
// Promotions" / "Logitech Products" banners). Real catalog products only —
// no fabricated discounts, since nothing in the catalog currently carries
// a compare_at_price.
export function BrandSpotlight({
  eyebrow, title, blurb, viewAllHref, products,
}: {
  eyebrow: string
  title: string
  blurb: string
  viewAllHref: string
  products: Product[]
}) {
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
    el.scrollBy({ left: dir * el.clientWidth * 0.8, behavior: 'smooth' })
  }

  if (products.length === 0) return null

  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-slate-900 via-blue-950 to-slate-900 px-5 sm:px-10 py-10">
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff10_1px,transparent_1px),linear-gradient(to_bottom,#ffffff10_1px,transparent_1px)] bg-[size:2.5rem_2.5rem] [mask-image:radial-gradient(ellipse_at_top_left,black,transparent_70%)]" />
        <div className="absolute -bottom-16 -right-10 w-72 h-72 rounded-full bg-blue-600/20 blur-3xl" />

        <div className="relative flex flex-col md:flex-row md:items-end justify-between gap-4 mb-8">
          <div>
            <p className="text-blue-400 text-xs font-semibold uppercase tracking-widest mb-2">{eyebrow}</p>
            <h2 className="text-3xl md:text-4xl font-bold text-white leading-tight">{title}</h2>
            <p className="text-slate-400 mt-2 max-w-md">{blurb}</p>
          </div>
          <Link
            href={viewAllHref}
            className="inline-flex items-center gap-1.5 shrink-0 bg-white text-slate-900 font-semibold text-sm px-4 py-2.5 rounded-xl hover:bg-blue-50 transition-colors w-fit"
          >
            View All <ArrowRight size={15} />
          </Link>
        </div>

        <div className="relative">
          {canScrollLeft && (
            <button
              onClick={() => scrollBy(-1)}
              aria-label="Scroll left"
              className="hidden sm:flex absolute -left-3 top-1/2 -translate-y-1/2 z-10 w-9 h-9 rounded-full bg-white shadow-md items-center justify-center text-slate-600 hover:text-blue-600 transition-colors"
            >
              <ChevronLeft size={18} />
            </button>
          )}
          <div
            ref={scrollerRef}
            className="relative flex gap-4 overflow-x-auto scroll-smooth [scrollbar-width:none] [-ms-overflow-style:none] [&::-webkit-scrollbar]:hidden pb-1"
          >
            {products.map((p) => (
              <SpotlightCard key={p.id} product={p} />
            ))}
          </div>
          {canScrollRight && (
            <button
              onClick={() => scrollBy(1)}
              aria-label="Scroll right"
              className="hidden sm:flex absolute -right-3 top-1/2 -translate-y-1/2 z-10 w-9 h-9 rounded-full bg-white shadow-md items-center justify-center text-slate-600 hover:text-blue-600 transition-colors"
            >
              <ChevronRight size={18} />
            </button>
          )}
        </div>
      </div>
    </section>
  )
}

function SpotlightCard({ product: p }: { product: Product }) {
  const onRequest = p.priceOnRequest || p.price === 0
  return (
    <Link
      href={`/products/${p.slug}`}
      className="group shrink-0 w-44 sm:w-48 bg-white rounded-2xl overflow-hidden hover:-translate-y-1 transition-transform duration-300"
    >
      <div className="aspect-square relative bg-white">
        {p.images[0] && (
          <Image
            src={p.images[0]}
            alt={p.name}
            fill
            sizes="192px"
            className="object-contain p-4 group-hover:scale-105 transition-transform duration-300"
          />
        )}
      </div>
      <div className="px-3.5 pb-4 pt-1">
        <h3 className="text-xs font-medium text-slate-800 leading-snug line-clamp-2 min-h-[2.2em]">{p.name}</h3>
        <p className="mt-1.5 font-bold text-slate-900 text-sm">
          {onRequest ? <span className="text-blue-600">Call for price</span> : `$${p.price.toFixed(2)}`}
        </p>
      </div>
    </Link>
  )
}
