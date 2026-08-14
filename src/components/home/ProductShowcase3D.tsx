'use client'
import { useRef } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { motion, useMotionValue, useSpring, useTransform } from 'framer-motion'
import type { Product } from '@/lib/types'

/**
 * A dramatic "product theatre" presentation of REAL product photos — mouse
 * tilt, spotlight glow, floating shadow — not a literal 3D model (no such
 * asset exists to source honestly for licensed hardware). Same tilt
 * technique as the hero video card: rect is cached on mouseenter, not
 * re-measured on every mousemove, which is what keeps this INP-safe.
 */
function ShowcaseCard({ product, index }: { product: Product; index: number }) {
  const rectRef = useRef<DOMRect | null>(null)
  const mx = useMotionValue(0.5)
  const my = useMotionValue(0.5)
  const rotateX = useSpring(useTransform(my, [0, 1], [12, -12]), { stiffness: 180, damping: 20 })
  const rotateY = useSpring(useTransform(mx, [0, 1], [-16, 16]), { stiffness: 180, damping: 20 })

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
  }

  const onRequest = product.priceOnRequest || product.price === 0

  return (
    <motion.div
      initial={{ opacity: 0, y: 24 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, margin: '-80px' }}
      transition={{ duration: 0.6, delay: index * 0.1, ease: [0.22, 1, 0.36, 1] }}
      className="relative [perspective:1400px]"
    >
      <Link
        href={`/products/${product.slug}`}
        onMouseEnter={onEnter}
        onMouseMove={onMove}
        onMouseLeave={onLeave}
        className="block"
      >
        {/* Spotlight glow */}
        <div className="pointer-events-none absolute -inset-10 -z-10">
          <div className="absolute inset-0 rounded-full bg-[radial-gradient(closest-side,#2563eb35,transparent_72%)] blur-2xl" />
        </div>

        <motion.div
          style={{ rotateX, rotateY }}
          className="group relative rounded-3xl overflow-hidden border border-white/70 bg-gradient-to-br from-slate-900 to-slate-950 shadow-[0_30px_70px_-20px_#1e3a8a70] [transform-style:preserve-3d]"
        >
          <div className="aspect-[4/3] relative flex items-center justify-center p-8" style={{ transform: 'translateZ(30px)' }}>
            {product.images[0] ? (
              <Image
                src={product.images[0]}
                alt={product.name}
                fill
                className="object-contain p-6 drop-shadow-2xl transition-transform duration-300 group-hover:scale-105"
                sizes="(max-width: 768px) 90vw, 380px"
              />
            ) : (
              <span className="text-5xl">📦</span>
            )}
          </div>
          {/* Vignette for product-shot contrast */}
          <div className="pointer-events-none absolute inset-0 bg-[radial-gradient(ellipse_at_center,transparent_55%,#00000055)]" />
        </motion.div>

        {/* Floating price/name plate */}
        <div className="relative -mt-6 mx-4 bg-white rounded-2xl shadow-xl shadow-slate-900/15 border border-slate-100 px-4 py-3">
          <p className="text-sm font-semibold text-slate-900 line-clamp-1">{product.name}</p>
          <p className="text-blue-600 font-bold mt-0.5">
            {onRequest ? 'Call for price' : `$${product.price.toLocaleString()}`}
          </p>
        </div>
      </Link>
    </motion.div>
  )
}

export function ProductShowcase3D({ products }: { products: Product[] }) {
  if (products.length === 0) return null
  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 pt-16 pb-4">
      <div className="text-center mb-12">
        <p className="text-xs uppercase tracking-widest text-blue-600 font-semibold mb-1">In the spotlight</p>
        <h2 className="text-3xl font-bold text-slate-900">Up close with the good stuff</h2>
      </div>
      <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-x-6 gap-y-16">
        {products.map((p, i) => <ShowcaseCard key={p.id} product={p} index={i} />)}
      </div>
    </section>
  )
}
