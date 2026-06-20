'use client'
import Link from 'next/link'
import { useRef } from 'react'
import {
  motion,
  useScroll,
  useTransform,
  useMotionValue,
  useSpring,
  type Variants,
} from 'framer-motion'
import { ArrowRight, Shield, Truck, Headphones, Check, TrendingUp, Sparkles } from 'lucide-react'
import { Button } from '@/components/ui/button'

const TRUST_ITEMS = [
  { icon: Shield, label: 'Genuine Products', sub: 'Authorized dealer' },
  { icon: Truck, label: 'Fast Delivery', sub: 'Tripoli & beyond' },
  { icon: Headphones, label: 'Expert Support', sub: '3-month warranty' },
]

const fadeUp: Variants = {
  hidden: { opacity: 0, y: 24 },
  show: (i: number = 0) => ({
    opacity: 1,
    y: 0,
    transition: { duration: 0.6, delay: i * 0.1, ease: [0.22, 1, 0.36, 1] },
  }),
}

export function HeroSection() {
  const sectionRef = useRef<HTMLElement>(null)

  // Scroll-driven parallax for the background layers
  const { scrollYProgress } = useScroll({
    target: sectionRef,
    offset: ['start start', 'end start'],
  })
  const blobY = useTransform(scrollYProgress, [0, 1], [0, 160])
  const blobY2 = useTransform(scrollYProgress, [0, 1], [0, -120])
  const contentY = useTransform(scrollYProgress, [0, 1], [0, 80])

  // Mouse-driven 3D tilt for the showcase card
  const mx = useMotionValue(0)
  const my = useMotionValue(0)
  const rotateX = useSpring(useTransform(my, [-0.5, 0.5], [10, -10]), { stiffness: 150, damping: 18 })
  const rotateY = useSpring(useTransform(mx, [-0.5, 0.5], [-14, 14]), { stiffness: 150, damping: 18 })

  function handleMove(e: React.MouseEvent<HTMLDivElement>) {
    const rect = e.currentTarget.getBoundingClientRect()
    mx.set((e.clientX - rect.left) / rect.width - 0.5)
    my.set((e.clientY - rect.top) / rect.height - 0.5)
  }
  function handleLeave() {
    mx.set(0)
    my.set(0)
  }

  return (
    <section ref={sectionRef} className="relative overflow-hidden">
      {/* Animated aurora + gradient orbs */}
      <motion.div style={{ y: blobY }} className="pointer-events-none absolute inset-0">
        <div className="animate-aurora absolute -top-32 right-[6%] w-[520px] h-[520px] rounded-full bg-gradient-to-br from-blue-300/50 to-blue-400/40 blur-3xl" />
        <div className="animate-blob absolute top-40 -left-24 w-[440px] h-[440px] rounded-full bg-gradient-to-br from-blue-300/45 to-blue-300/30 blur-3xl [animation-delay:-4s]" />
      </motion.div>
      <motion.div style={{ y: blobY2 }} className="pointer-events-none absolute inset-0">
        <div className="animate-aurora absolute bottom-[-10%] left-1/2 w-[420px] h-[420px] rounded-full bg-gradient-to-tr from-blue-200/50 to-blue-300/35 blur-3xl [animation-delay:-9s]" />
      </motion.div>
      {/* Grid + dots overlay */}
      <div className="pointer-events-none absolute inset-0 bg-grid-light [mask-image:radial-gradient(ellipse_at_center,black,transparent_72%)]" />
      <div className="pointer-events-none absolute inset-0 bg-dots opacity-60 [mask-image:radial-gradient(ellipse_at_70%_40%,black,transparent_60%)]" />

      <motion.div style={{ y: contentY }} className="relative max-w-7xl mx-auto px-4 sm:px-6 py-20 md:py-28">
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-8 items-center">
          {/* ── Left: copy ─────────────────────────────────────────── */}
          <div>
            <motion.div
              variants={fadeUp} initial="hidden" animate="show" custom={0}
              className="inline-flex items-center gap-2 bg-white/70 backdrop-blur border border-blue-100 rounded-full px-4 py-1.5 text-sm text-blue-700 mb-6 shadow-sm"
            >
              <span className="w-2 h-2 rounded-full bg-blue-500 animate-pulse" />
              Tripoli&apos;s Premier Tech Store
            </motion.div>

            <motion.h1
              variants={fadeUp} initial="hidden" animate="show" custom={1}
              className="text-5xl md:text-6xl font-bold text-slate-900 leading-[1.05] tracking-tight"
            >
              Technology
              <span className="block text-gradient">You Can Trust</span>
            </motion.h1>

            <motion.p
              variants={fadeUp} initial="hidden" animate="show" custom={2}
              className="text-slate-500 text-lg mt-6 leading-relaxed max-w-xl"
            >
              From professional POS systems to premium laptops — curated tech solutions
              for businesses and individuals across Lebanon.
            </motion.p>

            <motion.div
              variants={fadeUp} initial="hidden" animate="show" custom={3}
              className="flex flex-wrap gap-3 mt-8"
            >
              <Link href="/products">
                <Button size="lg">
                  Shop Now <ArrowRight size={18} />
                </Button>
              </Link>
              <Link href="/recommend">
                <Button size="lg" variant="outline">
                  <Sparkles size={18} /> Find My Setup
                </Button>
              </Link>
            </motion.div>

            {/* Trust badges */}
            <motion.div
              variants={fadeUp} initial="hidden" animate="show" custom={4}
              className="grid grid-cols-3 gap-4 mt-14 max-w-lg"
            >
              {TRUST_ITEMS.map(({ icon: Icon, label, sub }) => (
                <div key={label} className="text-center">
                  <div className="w-11 h-11 rounded-xl bg-white border border-slate-200 shadow-sm flex items-center justify-center mx-auto mb-2">
                    <Icon size={18} className="text-blue-600" />
                  </div>
                  <p className="text-slate-900 text-sm font-medium">{label}</p>
                  <p className="text-slate-400 text-xs">{sub}</p>
                </div>
              ))}
            </motion.div>
          </div>

          {/* ── Right: 3D tilt showcase ────────────────────────────── */}
          <motion.div
            initial={{ opacity: 0, scale: 0.92 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 0.8, delay: 0.2, ease: [0.22, 1, 0.36, 1] }}
            className="relative [perspective:1600px] hidden lg:block"
            onMouseMove={handleMove}
            onMouseLeave={handleLeave}
          >
            <motion.div
              style={{ rotateX, rotateY }}
              className="glow-ring preserve-3d relative rounded-3xl glass-card border border-white/70 shadow-glow p-6"
            >
              {/* Dashboard mockup */}
              <div style={{ transform: 'translateZ(55px)' }} className="preserve-3d">
                <div className="flex items-center justify-between mb-5">
                  <div>
                    <p className="text-slate-400 text-xs">Best Seller</p>
                    <p className="text-slate-900 font-bold text-lg">MacBook Air M3</p>
                  </div>
                  <span className="inline-flex items-center gap-1 text-xs font-semibold text-blue-600 bg-blue-50 px-2.5 py-1 rounded-full">
                    <TrendingUp size={12} /> In stock
                  </span>
                </div>

                {/* Showcase video */}
                <div className="h-44 rounded-2xl overflow-hidden border border-slate-100 bg-slate-900">
                  <video
                    src="/hero/hero.mp4"
                    autoPlay
                    muted
                    loop
                    playsInline
                    preload="auto"
                    className="w-full h-full object-cover"
                  />
                </div>

                <div className="flex items-center justify-between mt-5">
                  <div>
                    <p className="text-slate-400 text-xs">Starting at</p>
                    <p className="text-slate-900 font-bold text-2xl">$1,299</p>
                  </div>
                  <Link href="/products" className="text-sm font-semibold text-blue-600 hover:text-blue-700 inline-flex items-center gap-1">
                    Browse all <ArrowRight size={14} />
                  </Link>
                </div>
              </div>
            </motion.div>

            {/* Floating sub-cards (deeper Z) */}
            <motion.div
              style={{ rotateX, rotateY }}
              className="preserve-3d pointer-events-none absolute -left-8 top-10"
            >
              <div
                style={{ transform: 'translateZ(90px)' }}
                className="animate-float-y flex items-center gap-2 bg-white rounded-2xl shadow-xl shadow-slate-900/10 border border-slate-100 px-4 py-3"
              >
                <span className="w-8 h-8 rounded-full bg-blue-50 flex items-center justify-center">
                  <Check size={16} className="text-blue-600" />
                </span>
                <div>
                  <p className="text-slate-900 text-sm font-semibold leading-none">Genuine</p>
                  <p className="text-slate-400 text-xs mt-0.5">Authorized dealer</p>
                </div>
              </div>
            </motion.div>

            <motion.div
              style={{ rotateX, rotateY }}
              className="preserve-3d pointer-events-none absolute -right-6 bottom-6"
            >
              <div
                style={{ transform: 'translateZ(110px)' }}
                className="animate-float-y [animation-delay:-2.5s] bg-white rounded-2xl shadow-xl shadow-slate-900/10 border border-slate-100 px-4 py-3"
              >
                <div className="flex -space-x-2 mb-1.5">
                  {['from-blue-400 to-blue-600', 'from-blue-400 to-blue-800', 'from-blue-400 to-blue-600'].map((g) => (
                    <span key={g} className={`w-6 h-6 rounded-full bg-gradient-to-br ${g} ring-2 ring-white`} />
                  ))}
                </div>
                <p className="text-slate-900 text-sm font-bold leading-none">10K+ customers</p>
                <p className="text-slate-400 text-xs mt-0.5">across Lebanon</p>
              </div>
            </motion.div>
          </motion.div>
        </div>
      </motion.div>
    </section>
  )
}
