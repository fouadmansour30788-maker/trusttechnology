'use client'
import Link from 'next/link'
import Image from 'next/image'
import { motion } from 'framer-motion'
import { Monitor, Laptop, Printer, Package, Apple, Zap, ArrowRight } from 'lucide-react'

const CATEGORIES = [
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
        {CATEGORIES.map((c, i) => {
          const Icon = c.icon
          return (
            <motion.div
              key={c.id}
              initial={{ opacity: 0, y: 24 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: '-60px' }}
              transition={{ duration: 0.5, delay: i * 0.07, ease: [0.22, 1, 0.36, 1] }}
            >
              <Link href={c.href} className="group block h-52 sm:h-60 [perspective:1400px]">
                <div className="relative w-full h-full transition-transform duration-[600ms] [transform-style:preserve-3d] group-hover:[transform:rotateY(180deg)]">
                  {/* Front — real photo */}
                  <div className="absolute inset-0 rounded-3xl overflow-hidden border border-slate-200 shadow-soft [backface-visibility:hidden]">
                    <Image src={c.image} alt={c.label} fill sizes="(max-width:768px) 50vw, 33vw" className="object-cover" />
                    <div className="absolute inset-0 bg-gradient-to-t from-slate-950/85 via-slate-900/20 to-transparent" />
                    <div className="absolute top-4 left-4 w-10 h-10 rounded-xl bg-white/15 backdrop-blur-md flex items-center justify-center ring-1 ring-white/25">
                      <Icon size={18} className="text-white" />
                    </div>
                    <div className="absolute bottom-0 left-0 right-0 p-5">
                      <h3 className="text-white font-bold text-lg leading-tight">{c.label}</h3>
                      <p className="text-white/70 text-sm mt-0.5">{c.sublabel}</p>
                    </div>
                  </div>

                  {/* Back — blue/navy detail */}
                  <div className="absolute inset-0 rounded-3xl bg-gradient-to-br from-blue-600 to-blue-900 p-5 flex flex-col justify-between text-white [backface-visibility:hidden] [transform:rotateY(180deg)] shadow-glow">
                    <div className="w-11 h-11 rounded-xl bg-white/15 flex items-center justify-center ring-1 ring-white/20">
                      <Icon size={20} className="text-white" />
                    </div>
                    <div>
                      <h3 className="font-bold text-lg leading-tight">{c.label}</h3>
                      <p className="text-blue-100/90 text-sm mt-1 leading-relaxed">{c.blurb}</p>
                      <span className="inline-flex items-center gap-1.5 mt-3 text-sm font-semibold">
                        Shop now <ArrowRight size={15} className="group-hover:translate-x-0.5 transition-transform" />
                      </span>
                    </div>
                  </div>
                </div>
              </Link>
            </motion.div>
          )
        })}
      </div>
    </section>
  )
}
