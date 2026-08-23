'use client'
import { useRef } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import { motion, useScroll, useTransform } from 'framer-motion'
import { ArrowRight } from 'lucide-react'

// Apple's signature move: pin the viewport for the length of a tall section
// and let scroll position (not time) drive the animation. The section is
// 300vh tall; the inner frame stays sticky at the top for that whole
// distance while scrollYProgress sweeps 0→1, so the product tells a
// three-beat story — headline, reveal, CTA — timed entirely to the scrub.
export function ScrollShowcase() {
  const sectionRef = useRef<HTMLElement>(null)
  const { scrollYProgress } = useScroll({
    target: sectionRef,
    offset: ['start start', 'end end'],
  })

  const introOpacity = useTransform(scrollYProgress, [0, 0.08, 0.16, 0.25], [0, 1, 1, 0])
  const introY = useTransform(scrollYProgress, [0, 0.08], [28, 0])

  // Image stays fully transparent through the headline beat so the two
  // never occupy the same space at once -- it only starts fading/growing
  // in once the headline has finished clearing (>0.25).
  const imgScale = useTransform(scrollYProgress, [0.28, 0.58], [0.5, 1.1])
  const imgRotate = useTransform(scrollYProgress, [0.28, 0.58], [10, 0])
  const imgY = useTransform(scrollYProgress, [0.5, 0.68], [0, -170])
  const imgOpacity = useTransform(scrollYProgress, [0.24, 0.32, 0.92, 1], [0, 1, 1, 0])

  const outroOpacity = useTransform(scrollYProgress, [0.62, 0.74, 0.94, 1], [0, 1, 1, 0])
  const outroY = useTransform(scrollYProgress, [0.62, 0.74], [28, 0])

  const sceneOpacity = useTransform(scrollYProgress, [0, 0.04, 0.96, 1], [0, 1, 1, 0])

  return (
    <section ref={sectionRef} className="relative h-[300vh]">
      <motion.div
        style={{ opacity: sceneOpacity }}
        className="sticky top-0 h-screen overflow-hidden bg-slate-950"
      >
        <div className="pointer-events-none absolute inset-0 bg-[radial-gradient(closest-side,#1d4ed855,transparent_70%)]" />
        <div className="pointer-events-none absolute inset-0 bg-grid-dark [mask-image:radial-gradient(ellipse_at_center,black,transparent_75%)]" />

        <div className="relative h-full flex flex-col items-center justify-center px-6">
          <motion.div
            style={{ opacity: introOpacity, y: introY }}
            className="absolute inset-x-0 top-1/2 -translate-y-1/2 text-center px-6"
          >
            <p className="text-blue-400 text-sm font-semibold uppercase tracking-[0.2em] mb-4">Apple Collection</p>
            <h2 className="text-5xl md:text-7xl font-extrabold text-white tracking-tighter leading-[0.95]">
              Power, refined.
            </h2>
          </motion.div>

          <motion.div
            style={{ scale: imgScale, rotate: imgRotate, y: imgY, opacity: imgOpacity }}
            className="relative w-[82vw] max-w-3xl aspect-[16/10]"
          >
            <Image
              src="/products/apple-macbook-pro-16-m5-max-48gb-2tb-ssd-space-black-3d.png"
              alt="Apple MacBook Pro 16&quot; M5 Max"
              fill
              className="object-contain drop-shadow-[0_60px_120px_rgba(0,0,0,0.65)]"
              sizes="(max-width: 768px) 90vw, 768px"
            />
          </motion.div>

          <motion.div
            style={{ opacity: outroOpacity, y: outroY }}
            className="absolute inset-x-0 bottom-[12%] text-center px-6 max-w-xl mx-auto"
          >
            <h3 className="text-2xl md:text-4xl font-bold text-white tracking-tight mb-3">MacBook Pro 16&quot; — M5 Max</h3>
            <p className="text-slate-400 mb-8">Genuine Apple. Full warranty. In stock in Tripoli.</p>
            <Link
              href="/products/apple-macbook-pro-16-m5-max-48gb-2tb-ssd-space-black"
              className="inline-flex items-center gap-2 bg-white text-slate-900 font-semibold px-6 py-3 rounded-full hover:bg-slate-100 transition-colors"
            >
              Shop now <ArrowRight size={18} />
            </Link>
          </motion.div>
        </div>
      </motion.div>
    </section>
  )
}
