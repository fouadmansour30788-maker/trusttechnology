import Link from 'next/link'
import { ShieldCheck, MessageCircle } from 'lucide-react'

export const metadata = {
  title: 'Warranty Policy – Trust Technology',
  description: 'Warranty coverage for laptops, desktops, monitors, printers and accessories bought from Trust Technology, Tripoli.',
}

const SECTIONS = [
  {
    title: 'What’s covered',
    body: [
      'Every product we sell is 100% genuine. Unless stated otherwise on the product page, new laptops, desktops, monitors and printers carry a 1-year warranty against manufacturing defects (the warranty period for each product is listed in its specifications).',
      'Accessories (bags, mice, cables, adapters) carry a 3-month warranty against manufacturing defects unless stated otherwise.',
    ],
  },
  {
    title: 'What’s not covered',
    body: [
      'Physical damage (drops, cracks, broken hinges or screens), liquid damage, electrical damage from power surges, and damage caused by unauthorized repair or modification.',
      'Software issues, viruses, data loss and consumables (batteries lose capacity naturally; ink and toner are consumables).',
    ],
  },
  {
    title: 'How to make a claim',
    body: [
      'Message us on WhatsApp (+961 71 998 983) with your order number or invoice, the product, and a short description or photo/video of the issue.',
      'Bring or send the product to our shop in Tripoli with its box and accessories. We diagnose free of charge — covered defects are repaired or the unit replaced; if neither is possible, we refund.',
      'Typical diagnosis takes 2–5 working days depending on the brand.',
    ],
  },
]

export default function WarrantyPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 sm:px-6 py-14">
      <div className="mb-10">
        <span className="inline-flex w-12 h-12 rounded-2xl bg-blue-50 items-center justify-center mb-3">
          <ShieldCheck size={22} className="text-blue-600" />
        </span>
        <h1 className="text-3xl font-bold text-slate-900">Warranty Policy</h1>
        <p className="text-slate-500 mt-2">
          Genuine products, real coverage — here’s exactly what your warranty includes.
        </p>
      </div>

      <div className="space-y-8">
        {SECTIONS.map((s) => (
          <section key={s.title}>
            <h2 className="text-lg font-bold text-slate-900 mb-2">{s.title}</h2>
            {s.body.map((p, i) => (
              <p key={i} className="text-slate-600 leading-relaxed mb-2">{p}</p>
            ))}
          </section>
        ))}
      </div>

      <div className="mt-10 bg-blue-50 rounded-2xl p-5 flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm text-blue-900 font-medium">Need to claim, or unsure if you’re covered?</p>
        <a href={`https://wa.me/96171998983?text=${encodeURIComponent('Hi! I have a warranty question.')}`}
          target="_blank" rel="noopener noreferrer"
          className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-4 py-2.5 rounded-xl transition-colors">
          <MessageCircle size={15} /> WhatsApp us
        </a>
      </div>

      <p className="text-xs text-slate-400 mt-8">
        See also our <Link href="/returns" className="text-blue-600 hover:underline">Returns & Exchange policy</Link>.
      </p>
    </div>
  )
}
