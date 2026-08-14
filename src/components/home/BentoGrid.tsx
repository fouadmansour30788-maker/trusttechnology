'use client'
import { useRef } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { motion, useMotionValue, useSpring, useTransform } from 'framer-motion'
import { Monitor, Laptop, Printer, Package, Apple, Zap, ArrowRight, type LucideIcon } from 'lucide-react'

type Category = {
  id: number; label: string; sublabel: string; href: string
  icon: LucideIcon; image: string; blurb: string
}

const CATEGORIES: Category[] = [
  {
    id: 1, label: 'Computing', sublabel: 'Laptops & Desktops', href: '/categories/computing',
    icon: Laptop, image: '/products/lenovo-legion-5-83nx0000us-storm-grey.webp',
    blurb: 'High-performance laptops and desktops for work, study and play.',
  },
  {
    id: 2, label: 'Apple Collection', sublabel: 'Mac · iPhone · iPad', href: '/categories/apple',
    icon: Apple, image: '/products/apple-mhff4hn-a.jpg',
    blurb: 'Genuine Apple devices with full warranty and expert setup.',
  },
  {
    id: 3, label: 'Displays', sublabel: 'Monitors & POS Screens', href: '/categories/displays',
    icon: Monitor, image: '/products/philips-346b1c.png',
    blurb: 'From FHD office monitors to ultrawide and 4K creator displays.',
  },
  {
    id: 4, label: 'Printing', sublabel: 'Inkjet · Laser · Toner', href: '/categories/printing',
    icon: Printer, image: '/products/cedar-cedar-ce285a-35.jpg',
    blurb: 'Printers and genuine-quality toner & ink for home and office.',
  },
  {
    id: 5, label: 'Professional', sublabel: 'POS · Storage · Networking', href: '/categories/professional',
    icon: Package, image: '/products/receipt-printer-t80-usb-lan.jpg',
    blurb: 'Complete POS systems, scanners and networking for your business.',
  },
  {
    id: 6, label: 'Bundle & Save', sublabel: 'Curated deals — up to 20% off', href: '/bundles',
    icon: Zap, image: '/products/hp-victus-15-fa2082wm-mica-silver.webp',
    blurb: 'Pre-matched setups for gaming, business and retail at a discount.',
  },
]

/** Same tilt technique as the hero video card and homepage showcase — rect
 * cached on mouseenter, not re-measured on every mousemove (INP-safe). */
function CategoryTile({ c, index }: { c: Category; index: number }) {
  const Icon = c.icon
  const rectRef = useRef<DOMRect | null>(null)
  const mx = useMotionValue(0.5)
  const my = useMotionValue(0.5)
  const rotateX = useSpring(useTransform(my, [0, 1], [8, -8]), { stiffness: 200, damping: 20 })
  const rotateY = useSpring(useTransform(mx, [0, 1], [-8, 8]), { stiffness: 200, damping: 20 })

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

  return (
    <motion.div
      initial={{ opacity: 0, y: 24 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, margin: '-60px' }}
      transition={{ duration: 0.5, delay: index * 0.07, ease: [0.22, 1, 0.36, 1] }}
      className="relative"
    >
      <Link
        href={c.href}
        onMouseEnter={onEnter}
        onMouseMove={onMove}
        onMouseLeave={onLeave}
        className="group relative block [perspective:1400px]"
      >
        {/* Spotlight glow */}
        <div className="pointer-events-none absolute -inset-6 -z-10 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
          <div className="absolute inset-0 rounded-full bg-[radial-gradient(closest-side,#2563eb35,transparent_70%)] blur-2xl" />
        </div>

        {/* Dark stage — the photo floats on it like a rendered object, not a full-bleed cover shot */}
        <motion.div
          style={{ rotateX, rotateY }}
          className="relative rounded-3xl overflow-hidden border border-white/70 bg-gradient-to-br from-slate-900 to-slate-950 shadow-soft group-hover:shadow-[0_25px_60px_-15px_#1e3a8a55] transition-shadow duration-300 [transform-style:preserve-3d]"
        >
          <div className="aspect-[4/3] relative flex items-center justify-center" style={{ transform: 'translateZ(30px)' }}>
            <Image
              src={c.image}
              alt={c.label}
              fill
              sizes="(max-width:768px) 50vw, 33vw"
              className="object-contain p-2 drop-shadow-2xl transition-transform duration-300 group-hover:scale-105"
            />
          </div>
          <div className="pointer-events-none absolute inset-0 bg-[radial-gradient(ellipse_at_center,transparent_55%,#00000050)]" />
          <div className="absolute top-3 left-3 w-9 h-9 rounded-xl bg-white/15 backdrop-blur-md flex items-center justify-center ring-1 ring-white/25">
            <Icon size={16} className="text-white" />
          </div>
        </motion.div>

        {/* Floating plate — same composition as the homepage showcase's price plate */}
        <div className="relative -mt-5 mx-3 bg-white rounded-2xl shadow-xl shadow-slate-900/15 border border-slate-100 px-4 py-3">
          <h3 className="font-bold text-slate-900 leading-tight">{c.label}</h3>
          <p className="text-slate-500 text-sm mt-0.5">{c.sublabel}</p>
          {/* Reserved fixed height so the reveal never shifts sibling tiles' grid row */}
          <div className="h-10 mt-1.5 overflow-hidden">
            <div className="opacity-0 -translate-y-1 group-hover:opacity-100 group-hover:translate-y-0 transition-all duration-300">
              <p className="text-slate-400 text-xs leading-relaxed line-clamp-1">{c.blurb}</p>
              <span className="inline-flex items-center gap-1.5 mt-1.5 text-xs font-semibold text-blue-600">
                Shop now <ArrowRight size={12} />
              </span>
            </div>
          </div>
        </div>
      </Link>
    </motion.div>
  )
}

export function BentoGrid() {
  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 py-16">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: '-80px' }}
        transition={{ duration: 0.5 }}
        className="mb-8"
      >
        <p className="text-xs uppercase tracking-widest text-blue-600 font-semibold mb-2">Browse by Category</p>
        <h2 className="text-3xl font-bold text-slate-900">Shop Everything</h2>
      </motion.div>

      <div className="grid grid-cols-2 md:grid-cols-3 gap-4 sm:gap-5">
        {CATEGORIES.map((c, i) => <CategoryTile key={c.id} c={c} index={i} />)}
      </div>
    </section>
  )
}
