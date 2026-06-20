'use client'
import Link from 'next/link'
import { motion } from 'framer-motion'
import { ShieldCheck, Wallet, Activity, Check, ArrowRight, Cpu } from 'lucide-react'

const PILLS = [
  { icon: Wallet, label: 'Honest Pricing', pos: 'left-0 top-8' },
  { icon: ShieldCheck, label: 'Genuine Warranty', pos: 'right-0 top-28' },
  { icon: Activity, label: 'Same-Day Service', pos: 'left-6 bottom-10' },
]

const POINTS = [
  'Authorized dealer — every product is 100% genuine',
  'Free diagnostics and expert advice before you buy',
  'Fast delivery across Tripoli and all of Lebanon',
  'Smart recommendation wizard finds your perfect setup',
]

export function WhyChooseUs() {
  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 py-20">
      <div className="grid lg:grid-cols-2 gap-12 lg:gap-16 items-center">
        {/* ── Left: floating pills over gradient orb ─────────────── */}
        <motion.div
          initial={{ opacity: 0, scale: 0.92 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true, margin: '-80px' }}
          transition={{ duration: 0.7, ease: [0.22, 1, 0.36, 1] }}
          className="relative h-[380px] flex items-center justify-center"
        >
          {/* Gradient orb */}
          <div className="relative w-64 h-64 rounded-full bg-gradient-to-br from-blue-500 via-blue-500 to-blue-400 shadow-2xl shadow-blue-500/30 flex items-center justify-center">
            <div className="absolute inset-3 rounded-full border border-white/20" />
            <Cpu size={88} className="text-white/90" strokeWidth={1.2} />
            <div className="absolute -inset-6 rounded-full border border-blue-200/60" />
          </div>

          {/* Floating pills */}
          {PILLS.map(({ icon: Icon, label, pos }, i) => (
            <motion.div
              key={label}
              initial={{ opacity: 0, y: 16 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: 0.3 + i * 0.15 }}
              className={`absolute ${pos} animate-float-y flex items-center gap-2.5 bg-white rounded-2xl shadow-xl shadow-slate-900/10 border border-slate-100 px-4 py-3`}
              style={{ animationDelay: `${-i * 1.6}s` }}
            >
              <span className="w-9 h-9 rounded-xl bg-blue-50 flex items-center justify-center">
                <Icon size={18} className="text-blue-600" />
              </span>
              <span className="text-sm font-semibold text-slate-800 whitespace-nowrap">{label}</span>
            </motion.div>
          ))}
        </motion.div>

        {/* ── Right: copy ────────────────────────────────────────── */}
        <motion.div
          initial={{ opacity: 0, y: 24 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: '-80px' }}
          transition={{ duration: 0.6 }}
        >
          <h2 className="text-3xl md:text-4xl font-bold text-slate-900 leading-tight">
            Why choose us for your <span className="text-gradient">technology needs?</span>
          </h2>
          <p className="text-slate-500 mt-4 text-lg leading-relaxed">
            We pair premium hardware with honest, expert service — so businesses and
            individuals across Lebanon get exactly the right tech, the first time.
          </p>

          <ul className="mt-8 space-y-4">
            {POINTS.map((point, i) => (
              <motion.li
                key={point}
                initial={{ opacity: 0, x: -16 }}
                whileInView={{ opacity: 1, x: 0 }}
                viewport={{ once: true }}
                transition={{ duration: 0.4, delay: i * 0.1 }}
                className="flex items-start gap-3"
              >
                <span className="mt-0.5 w-6 h-6 rounded-full bg-blue-600 flex items-center justify-center shrink-0 shadow-sm shadow-blue-600/30">
                  <Check size={13} className="text-white" strokeWidth={3} />
                </span>
                <span className="text-slate-700">{point}</span>
              </motion.li>
            ))}
          </ul>

          <Link
            href="/recommend"
            className="group mt-9 inline-flex items-center gap-3 bg-gradient-to-r from-blue-600 to-blue-800 hover:from-blue-700 hover:to-blue-900 text-white font-semibold pl-6 pr-2 py-2 rounded-full shadow-lg shadow-blue-600/25 transition-all"
          >
            Find My Setup
            <span className="w-9 h-9 rounded-full bg-white flex items-center justify-center text-blue-600 group-hover:translate-x-0.5 transition-transform">
              <ArrowRight size={16} />
            </span>
          </Link>
        </motion.div>
      </div>
    </section>
  )
}
