'use client'
import Link from 'next/link'
import Image from 'next/image'
import { ShoppingCart, Star, MessageCircle, Square, SquareCheck } from 'lucide-react'
import { motion, useMotionTemplate, useMotionValue, useSpring, useTransform } from 'framer-motion'
import type { Product } from '@/lib/types'
import { useCartStore } from '@/store/cart'
import { useCompareStore } from '@/store/compare'
import { Badge } from '@/components/ui/badge'

type Props = { product: Product }

const WHATSAPP = '96171998983'

export function ProductCard({ product }: Props) {
  const addItem = useCartStore((s) => s.addItem)
  const toggleCompare = useCompareStore((s) => s.toggle)
  const comparing = useCompareStore((s) => s.items.some((p) => p.id === product.id))
  const onRequest = product.priceOnRequest || product.price === 0
  // Full spec sheet, shown right on the card (not just on the detail page) —
  // ordered by shopper relevance: performance specs first, housekeeping last.
  const SPEC_PRIORITY = ['CPU', 'RAM', 'Storage', 'Hard Disk', 'VGA', 'Graphics', 'Screen', 'Resolution', 'Connectivity', 'LAN', 'OS', 'Capacity', 'Keyboard', 'Warranty']
  const keySpecs = Object.entries(product.specs ?? {})
    .filter(([, v]) => v)
    .sort((a, b) => {
      const ia = SPEC_PRIORITY.indexOf(a[0])
      const ib = SPEC_PRIORITY.indexOf(b[0])
      return (ia < 0 ? 99 : ia) - (ib < 0 ? 99 : ib)
    })
  const discount = product.compare_at_price
    ? Math.round(((product.compare_at_price - product.price) / product.compare_at_price) * 100)
    : null

  // Mouse-driven 3D tilt + light sheen
  const mx = useMotionValue(0.5)
  const my = useMotionValue(0.5)
  const rotateX = useSpring(useTransform(my, [0, 1], [6, -6]), { stiffness: 200, damping: 20 })
  const rotateY = useSpring(useTransform(mx, [0, 1], [-6, 6]), { stiffness: 200, damping: 20 })
  const sheen = useMotionTemplate`radial-gradient(380px circle at ${useTransform(mx, (v) => v * 100)}% ${useTransform(my, (v) => v * 100)}%, rgba(37,99,235,0.10), transparent 60%)`

  function onMove(e: React.MouseEvent<HTMLDivElement>) {
    const r = e.currentTarget.getBoundingClientRect()
    mx.set((e.clientX - r.left) / r.width)
    my.set((e.clientY - r.top) / r.height)
  }
  function onLeave() {
    mx.set(0.5)
    my.set(0.5)
  }

  return (
    <motion.div
      onMouseMove={onMove}
      onMouseLeave={onLeave}
      style={{ rotateX, rotateY, transformPerspective: 900 }}
      whileHover={{ y: -4 }}
      className="group relative bg-white border border-slate-200 rounded-2xl overflow-hidden hover:border-blue-200 transition-colors duration-300 hover:shadow-xl hover:shadow-blue-900/10 flex flex-col [transform-style:preserve-3d]"
    >
      <motion.div style={{ background: sheen }} className="pointer-events-none absolute inset-0 z-10 opacity-0 group-hover:opacity-100 transition-opacity" />
      {/* Image */}
      <Link href={`/products/${product.slug}`} className="block aspect-square bg-slate-100 overflow-hidden relative">
        {product.images[0] ? (
          <Image
            src={product.images[0]}
            alt={product.name}
            fill
            className="object-cover group-hover:scale-105 transition-transform duration-300"
          />
        ) : (
          <div className="w-full h-full flex items-center justify-center text-slate-300">
            <span className="text-4xl">📦</span>
          </div>
        )}
        <div className="absolute top-2 left-2 flex flex-col items-start gap-1">
          {discount && <Badge variant="red">-{discount}%</Badge>}
          {product.bestPrice && (
            <span className="inline-flex items-center gap-1 bg-emerald-600 text-white text-[10px] font-semibold rounded-full px-2 py-0.5 shadow-sm">
              🇱🇧 Best price in Lebanon
            </span>
          )}
        </div>
        <button
          onClick={(e) => { e.preventDefault(); e.stopPropagation(); toggleCompare(product) }}
          title={comparing ? 'Remove from compare' : 'Add to compare'}
          className={`absolute top-2 right-2 z-10 inline-flex items-center gap-1 h-7 pl-1.5 pr-2 rounded-full text-[11px] font-semibold shadow-sm transition-colors ${
            comparing
              ? 'bg-blue-600 text-white'
              : 'bg-white/95 text-slate-500 hover:text-blue-600 border border-slate-200'
          }`}
        >
          {comparing ? <SquareCheck size={14} /> : <Square size={14} />}
          Compare
        </button>
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
                <p className="text-[9px] uppercase tracking-wide text-slate-400 truncate">{k}</p>
                <p className="text-[11px] font-medium text-slate-700 truncate" title={v}>{v}</p>
              </div>
            ))}
          </div>
        )}

        <div className="flex items-center gap-1 mt-2 mb-3">
          {[...Array(5)].map((_, i) => (
            <Star key={i} size={10} className="fill-blue-400 text-blue-400" />
          ))}
          <span className="text-zinc-500 text-xs ml-1">(4.8)</span>
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
              className="w-8 h-8 rounded-lg bg-emerald-500 hover:bg-emerald-600 flex items-center justify-center text-white transition-colors"
              title="Ask for price on WhatsApp"
            >
              <MessageCircle size={14} />
            </a>
          ) : (
            <button
              onClick={() => addItem(product)}
              disabled={product.stock === 0}
              className="w-8 h-8 rounded-lg bg-blue-600 hover:bg-blue-700 disabled:opacity-40 disabled:cursor-not-allowed flex items-center justify-center text-white transition-colors"
            >
              <ShoppingCart size={14} />
            </button>
          )}
        </div>
      </div>
    </motion.div>
  )
}
