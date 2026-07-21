import Link from 'next/link'
import { RotateCcw, MessageCircle } from 'lucide-react'

export const metadata = {
  title: 'Returns & Exchange – Trust Technology',
  description: 'Return and exchange policy for products bought from Trust Technology, Tripoli — online or in-store.',
}

const SECTIONS = [
  {
    title: 'Exchange window',
    body: [
      'You can exchange a product within 3 days of receiving it, as long as it is unused, in its original sealed packaging with all accessories, and you have the invoice or order number.',
      'Opened products can only be exchanged if the item is defective on arrival (DOA) — we’ll verify the fault and replace the unit.',
    ],
  },
  {
    title: 'Dead on arrival (DOA)',
    body: [
      'If your product doesn’t work out of the box, contact us within 3 days. After we confirm the fault, you get an immediate replacement — or a full refund if no replacement is available.',
    ],
  },
  {
    title: 'Online (cash-on-delivery) orders',
    body: [
      'You can inspect the box with the delivery person before paying. If something is wrong with the order, refuse the delivery — you pay nothing.',
      'After payment, the standard 3-day exchange window above applies.',
    ],
  },
  {
    title: 'Not exchangeable',
    body: [
      'Software licenses, opened consumables (ink, toner), and special-order items brought in specifically for you — unless defective.',
    ],
  },
]

export default function ReturnsPage() {
  return (
    <div className="max-w-3xl mx-auto px-4 sm:px-6 py-14">
      <div className="mb-10">
        <span className="inline-flex w-12 h-12 rounded-2xl bg-blue-50 items-center justify-center mb-3">
          <RotateCcw size={22} className="text-blue-600" />
        </span>
        <h1 className="text-3xl font-bold text-slate-900">Returns & Exchange</h1>
        <p className="text-slate-500 mt-2">Simple and fair — inspect before you pay, exchange within 3 days.</p>
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
        <p className="text-sm text-blue-900 font-medium">Want to arrange an exchange?</p>
        <a href={`https://wa.me/96171998983?text=${encodeURIComponent('Hi! I would like to exchange a product.')}`}
          target="_blank" rel="noopener noreferrer"
          className="inline-flex items-center gap-2 bg-emerald-500 hover:bg-emerald-600 text-white text-sm font-semibold px-4 py-2.5 rounded-xl transition-colors">
          <MessageCircle size={15} /> WhatsApp us
        </a>
      </div>

      <p className="text-xs text-slate-400 mt-8">
        See also our <Link href="/warranty" className="text-blue-600 hover:underline">Warranty Policy</Link>.
      </p>
    </div>
  )
}
