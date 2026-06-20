'use client'
import Link from 'next/link'
import { motion } from 'framer-motion'
import { Monitor, Laptop, Printer, Package, Apple, Zap, ArrowRight } from 'lucide-react'

const BENTO_ITEMS = [
  {
    id: 1, label: 'Computing', sublabel: 'Laptops & Desktops', href: '/categories/computing',
    icon: Laptop, span: 'md:col-span-2 md:row-span-2',
    gradient: 'from-blue-50 to-blue-50', iconBg: 'bg-blue-600', size: 'large',
  },
  {
    id: 2, label: 'Apple Collection', sublabel: 'Mac · iPhone · iPad', href: '/categories/apple',
    icon: Apple, span: 'md:col-span-1', gradient: 'from-slate-50 to-slate-100', iconBg: 'bg-slate-900', size: 'medium',
  },
  {
    id: 3, label: 'Displays', sublabel: 'Monitors & POS Screens', href: '/categories/displays',
    icon: Monitor, span: 'md:col-span-1', gradient: 'from-blue-50 to-blue-50', iconBg: 'bg-blue-600', size: 'medium',
  },
  {
    id: 4, label: 'Printing', sublabel: 'Inkjet · Laser · Toner', href: '/categories/printing',
    icon: Printer, span: 'md:col-span-1', gradient: 'from-blue-50 to-blue-50', iconBg: 'bg-blue-600', size: 'medium',
  },
  {
    id: 5, label: 'Professional', sublabel: 'POS · Storage · Networking', href: '/categories/professional',
    icon: Package, span: 'md:col-span-1', gradient: 'from-blue-50 to-blue-50', iconBg: 'bg-blue-500', size: 'medium',
  },
  {
    id: 6, label: 'Bundle & Save', sublabel: 'Curated setup deals — save up to 20%', href: '/bundles',
    icon: Zap, span: 'md:col-span-2', gradient: 'from-blue-50 to-slate-100', iconBg: 'bg-blue-500', size: 'wide',
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
        <p className="text-xs uppercase tracking-widest text-blue-600 font-semibold mb-2">
          Browse by Category
        </p>
        <h2 className="text-3xl font-bold text-slate-900">Shop Everything</h2>
      </motion.div>

      <div className="grid grid-cols-2 md:grid-cols-4 gap-4 auto-rows-[160px]">
        {BENTO_ITEMS.map((item, i) => {
          const Icon = item.icon
          return (
            <motion.div
              key={item.id}
              initial={{ opacity: 0, y: 24 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: '-60px' }}
              transition={{ duration: 0.5, delay: i * 0.07, ease: [0.22, 1, 0.36, 1] }}
              className={item.span}
            >
              <Link
                href={item.href}
                className={`group relative bg-gradient-to-br ${item.gradient} border border-slate-200/80 rounded-2xl p-6 flex flex-col justify-between overflow-hidden hover:shadow-xl hover:shadow-slate-900/5 hover:-translate-y-1 transition-all duration-300 h-full`}
              >
                <div
                  className={`${item.iconBg} rounded-xl flex items-center justify-center shadow-lg shadow-slate-900/10 ${
                    item.size === 'large' ? 'w-14 h-14' : 'w-10 h-10'
                  }`}
                >
                  <Icon className="text-white" size={item.size === 'large' ? 28 : 20} />
                </div>

                <div>
                  <h3
                    className={`font-bold text-slate-900 ${
                      item.size === 'large' ? 'text-2xl' : item.size === 'wide' ? 'text-xl' : 'text-base'
                    }`}
                  >
                    {item.label}
                  </h3>
                  <p className="text-slate-500 text-sm mt-1">{item.sublabel}</p>
                  <div className="flex items-center gap-1 mt-3 text-xs font-medium text-blue-600 group-hover:gap-2 transition-all">
                    Shop now <ArrowRight size={12} />
                  </div>
                </div>

                {/* Decorative blur */}
                <div className="absolute -bottom-10 -right-10 w-36 h-36 rounded-full bg-white/40 blur-2xl" />
              </Link>
            </motion.div>
          )
        })}
      </div>
    </section>
  )
}
