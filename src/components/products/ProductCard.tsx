'use client'
import { useRef } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { ShoppingCart, Star, MessageCircle, Square, SquareCheck } from 'lucide-react'
import { motion, useMotionTemplate, useMotionValue, useSpring, useTransform } from 'framer-motion'
import type { Product } from '@/lib/types'
import { useCartStore } from '@/store/cart'
import { useCompareStore } from '@/store/compare'
import { Badge } from '@/components/ui/badge'
import { SPEC_HIDDEN } from '@/lib/specs'
import { WishlistButton } from './WishlistButton'

type Props = { product: Product }

const WHATSAPP = '9613393002'

export function ProductCard({ product }: Props) {
  const addItem = useCartStore((s) => s.addItem)
  const toggleCompare = useCompareStore((s) => s.toggle)
  const comparing = useCompareStore((s) => s.items.some((p) => p.id === product.id))
  const onRequest = product.priceOnRequest || product.price === 0
  // Full spec sheet, shown right on the card (not just on the detail page) —
  // ordered by shopper relevance: performance specs first, housekeeping last.
  // Warranty/OS/Color/Language are dropped here — same on every listing, so
  // they crowded out the specs that actually differ between products.
  const SPEC_PRIORITY = ['CPU', 'RAM', 'Storage', 'Hard Disk', 'VGA', 'Graphics', 'Screen', 'Resolution', 'Connectivity', 'LAN', 'Capacity', 'Keyboard']
  const keySpecs = Object.entries(product.specs ?? {})
    .filter(([k, v]) => v && !SPEC_HIDDEN.has(k))
    .sort((a, b) => {
      const ia = SPEC_PRIORITY.indexOf(a[0])
      const ib = SPEC_PRIORITY.indexOf(b[0])
      return (ia < 0 ? 99 : ia) - (ib < 0 ? 99 : ib)
    })
  const discount = product.compare_at_price
    ? Math.round(((product.compare_at_price - product.price) / product.compare_at_price) * 100)
    : null

  // Mouse-driven 3D tilt (image only — scoped here rather than the whole
  // card so price/specs text stays flat and readable) + light sheen.
  const mx = useMotionValue(0.5)
  const my = useMotionValue(0.5)
  const rotateX = useSpring(useTransform(my, [0, 1], [14, -14]), { stiffness: 200, damping: 20 })
  const rotateY = useSpring(useTransform(mx, [0, 1], [-14, 14]), { stiffness: 200, damping: 20 })
  const sheen = useMotionTemplate`radial-gradient(380px circle at ${useTransform(mx, (v) => v * 100)}% ${useTransform(my, (v) => v * 100)}%, rgba(37,99,235,0.10), transparent 60%)`

  // Cache the rect on enter instead of calling getBoundingClientRect() on
  // every mousemove — that forces a synchronous layout reflow per pixel of
  // movement, which is exactly the kind of long main-thread task that shows
  // up as a bad INP score (measured this on the live site: an 845ms block
  // traced to this exact pattern in the hero's tilt handler).
  const rectRef = useRef<DOMRect | null>(null)
  function onEnter(e: React.MouseEvent<HTMLAnchorElement>) {
    rectRef.current = e.currentTarget.getBoundingClientRect()
  }
  function onMove(e: React.MouseEvent<HTMLAnchorElement>) {
    const r = rectRef.current
    if (!r) return
    mx.set((e.clientX - r.left) / r.width)
    my.set((e.clientY - r.top) / r.height)
  }
  function onLeave() {
    mx.set(0.5)
    my.set(0.5)
    rectRef.current = null
  }

  return (
    <motion.div
      whileHover={{ y: -4 }}
      className="group relative bg-white border border-slate-200 rounded-2xl overflow-hidden hover:border-blue-200 transition-colors duration-300 hover:shadow-xl hover:shadow-blue-900/10 flex flex-col h-full"
    >
      {/* Controls row — sits above the photo instead of floating over it, so
          it never overlaps the product now that images render uncropped
          (object-contain) at varying sizes within the frame. */}
      <div className="grid grid-cols-[1fr_auto_1fr] items-start gap-1.5 px-2.5 pt-2.5">
        <div className="flex flex-col items-start gap-1 min-w-0">
          {discount && <Badge variant="red">-{discount}%</Badge>}
          {product.bestPrice && (
            <span className="inline-flex items-center gap-1 bg-emerald-600 text-white text-[10px] font-semibold rounded-full px-2 py-0.5 shadow-sm">
              🇱🇧 Best price
            </span>
          )}
        </div>
        <div className="flex items-center gap-1.5 shrink-0 justify-self-center">
          <button
            onClick={(e) => { e.preventDefault(); e.stopPropagation(); toggleCompare(product) }}
            title={comparing ? 'Remove from compare' : 'Add to compare'}
            className={`inline-flex items-center gap-1 h-8 pl-2 pr-2.5 rounded-full text-xs font-semibold shadow-sm transition-colors ${
              comparing
                ? 'bg-blue-600 text-white'
                : 'bg-white text-slate-500 hover:text-blue-600 border border-slate-200'
            }`}
          >
            {comparing ? <SquareCheck size={14} /> : <Square size={14} />}
            Compare
          </button>
          <WishlistButton productId={product.id} variant="icon-inline" />
        </div>
        <div />
      </div>

      {/* Image — mouse-tilted in 3D, independent of the card around it */}
      <Link
        href={`/products/${product.slug}`}
        onMouseEnter={onEnter}
        onMouseMove={onMove}
        onMouseLeave={onLeave}
        className="block aspect-square bg-slate-100 overflow-hidden relative [perspective:1200px]"
      >
        <motion.div style={{ background: sheen }} className="pointer-events-none absolute inset-0 z-10 opacity-0 group-hover:opacity-100 transition-opacity" />
        <motion.div style={{ rotateX, rotateY }} className="absolute inset-0 [transform-style:preserve-3d]">
          {product.images[0] ? (
            <Image
              src={product.images[0]}
              alt={product.name}
              fill
              className="object-contain p-3 group-hover:scale-105 transition-transform duration-300"
              style={{ transform: 'translateZ(20px)' }}
            />
          ) : (
            <div className="w-full h-full flex items-center justify-center text-slate-300">
              <span className="text-4xl">📦</span>
            </div>
          )}
        </motion.div>
        {product.stock === 0 && (
          <div className="absolute inset-0 bg-black/60 flex items-center justify-center">
            <span className="text-white text-sm font-medium">Out of Stock</span>
          </div>
        )}
      </Link>

      {/* Info */}
      <div className="p-4 flex flex-col flex-1">
        {/* Tags */}
        {product.tags && product.tags.length > 0 && (
          <div className="flex flex-wrap gap-1 mb-2">
            {product.tags.slice(0, 2).map((t) => (
              <Badge key={t.id}>{t.name}</Badge>
            ))}
          </div>
        )}

        <Link href={`/products/${product.slug}`}>
          <h3 className="text-sm text-slate-900 font-medium leading-snug hover:text-blue-600 transition-colors line-clamp-2">
            {product.name}
          </h3>
        </Link>

        {keySpecs.length > 0 && (
          <div className="mt-2 grid grid-cols-2 gap-x-2 gap-y-1.5 border-t border-slate-100 pt-2">
            {keySpecs.map(([k, v]) => (
              <div key={k} className="min-w-0">
                <p className="text-[10px] uppercase tracking-wide text-slate-400 truncate">{k}</p>
                <p className="text-xs font-medium text-slate-700 truncate" title={v}>{v}</p>
              </div>
            ))}
          </div>
        )}

        <div className="flex items-center gap-1 mt-2 mb-3 min-h-[14px]">
          {(product.reviewCount ?? 0) > 0 && (
            <>
              {[...Array(5)].map((_, i) => (
                <Star key={i} size={10} className={i < Math.round(product.rating!) ? 'fill-amber-400 text-amber-400' : 'text-slate-200'} />
              ))}
              <span className="text-zinc-500 text-xs ml-1">{product.rating?.toFixed(1)} ({product.reviewCount})</span>
            </>
          )}
          {product.stock > 0 && product.stock <= 3 && !onRequest && (
            <span className="ml-auto text-[10px] font-semibold text-amber-600">Only {product.stock} left</span>
          )}
        </div>

        <div className="mt-auto flex items-center justify-between">
          {onRequest ? (
            <span className="text-blue-600 font-semibold text-sm">Call for price</span>
          ) : (
            <div>
              <span className={`font-bold ${product.compare_at_price ? 'text-emerald-600' : 'text-slate-900'}`}>
                ${product.price.toFixed(2)}
              </span>
              {product.compare_at_price && (
                <span className="text-red-500 line-through text-sm ml-2">
                  ${product.compare_at_price.toFixed(2)}
                </span>
              )}
            </div>
          )}

          {onRequest ? (
            <a
              href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent('Hi, I would like a price for: ' + product.name)}`}
              target="_blank"
              rel="noopener noreferrer"
              onClick={(e) => e.stopPropagation()}
              className="w-10 h-10 rounded-lg bg-emerald-500 hover:bg-emerald-600 flex items-center justify-center text-white transition-colors"
              title="Ask for price on WhatsApp"
            >
              <MessageCircle size={16} />
            </a>
          ) : (
            <button
              onClick={() => addItem(product)}
              disabled={product.stock === 0}
              className="w-10 h-10 rounded-lg bg-blue-600 hover:bg-blue-700 disabled:opacity-40 disabled:cursor-not-allowed flex items-center justify-center text-white transition-colors"
            >
              <ShoppingCart size={16} />
            </button>
          )}
        </div>
      </div>
    </motion.div>
  )
}
