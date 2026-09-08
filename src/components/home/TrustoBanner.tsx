'use client'
import Link from 'next/link'
import { ArrowRight, Wand2 } from 'lucide-react'
import { TrustoAvatar } from '@/components/trusto/TrustoAvatar'

// Full-bleed spotlight for the site's own AI feature (the Setup Builder),
// same beat as a brand's "our AI" hero banner — but pointed at something
// trust-technology actually has, not an invented campaign.
export function TrustoBanner() {
  return (
    <section className="relative overflow-hidden bg-gradient-to-br from-blue-700 via-blue-800 to-slate-900 py-20 sm:py-28">
      <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff12_1px,transparent_1px),linear-gradient(to_bottom,#ffffff12_1px,transparent_1px)] bg-[size:3rem_3rem] [mask-image:radial-gradient(ellipse_at_center,black,transparent_75%)]" />
      <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] rounded-full bg-blue-400/20 blur-3xl" />

      <div className="relative max-w-3xl mx-auto px-4 sm:px-6 text-center flex flex-col items-center">
        <TrustoAvatar mood="excited" size={96} holdingLaptop walking={false} />
        <p className="mt-6 text-blue-200 text-xs font-semibold uppercase tracking-widest">Meet Trusto</p>
        <h2 className="mt-2 text-4xl sm:text-5xl font-bold text-white tracking-tight leading-tight">
          Tell it your budget.<br />It builds the setup.
        </h2>
        <p className="mt-4 text-blue-100 text-lg max-w-xl">
          Trusto is trust-technology&apos;s AI setup builder — give it a budget and what you&apos;ll use it for
          (university, gaming, design, POS) and it puts together a complete setup from our real, in-stock catalog.
        </p>
        <Link
          href="/setup-builder"
          className="mt-8 inline-flex items-center gap-2 bg-white text-blue-700 font-bold px-7 py-3.5 rounded-2xl hover:bg-blue-50 transition-colors"
        >
          <Wand2 size={18} /> Build My Setup <ArrowRight size={16} />
        </Link>
      </div>
    </section>
  )
}
