import Link from 'next/link'
import { HelpCircle, MessageCircle } from 'lucide-react'

export const metadata = {
  title: 'FAQ – Trust Technology',
  description: 'Ordering, delivery, cash on delivery, warranty and pricing questions — answered by Trust Technology, Tripoli.',
}

const FAQS: { q: string; a: string }[] = [
  {
    q: 'How do I order?',
    a: 'Add products to your cart and check out with cash on delivery — you pay when the order arrives. You can also order via WhatsApp (+961 71 998 983) or visit us in Tripoli.',
  },
  {
    q: 'Do you deliver outside Tripoli?',
    a: 'Yes — we deliver across all of Lebanon. Delivery fees depend on your region and are shown at checkout before you place the order.',
  },
  {
    q: 'How does cash on delivery work?',
    a: 'You inspect the sealed box with the delivery person before paying. If something is wrong, refuse the delivery and pay nothing. After we receive your order, we call to confirm availability and delivery time.',
  },
  {
    q: 'What does “Call for price” mean?',
    a: 'Prices for some laptops change with the market, so we confirm the day’s best price when you ask. Tap the WhatsApp button on the product and we reply quickly with a firm quote.',
  },
  {
    q: 'Are your products genuine? Is there warranty?',
    a: 'Everything we sell is 100% genuine. Laptops, desktops, monitors and printers carry a 1-year warranty against manufacturing defects unless stated otherwise; accessories carry 3 months. See our Warranty Policy for details.',
  },
  {
    q: 'Can I exchange a product?',
    a: 'Yes — within 3 days if it’s unused and sealed with all accessories, and immediately if it arrives defective (DOA). See our Returns & Exchange policy.',
  },
  {
    q: 'How can I track my order?',
    a: 'Use the Track Order page with your order number (e.g. SO-0012) and the phone number you ordered with.',
  },
  {
    q: 'Do you match competitor prices?',
    a: 'We monitor prices across Lebanese stores every day, and products carrying our “Best price in Lebanon” badge are verified cheaper than every other store we track. If you find a better documented price, message us — we’ll do our best.',
  },
  {
    q: 'Can you help me choose the right laptop?',
    a: 'Yes — three ways: the AI advisor chat, the “Will it work for me?” check on every product page, or the Setup Builder that assembles a full setup for your budget. And WhatsApp is always open.',
  },
]

export default function FaqPage() {
  const ld = {
    '@context': 'https://schema.org',
    '@type': 'FAQPage',
    mainEntity: FAQS.map((f) => ({
      '@type': 'Question',
      name: f.q,
      acceptedAnswer: { '@type': 'Answer', text: f.a },
    })),
  }

  return (
    <div className="max-w-3xl mx-auto px-4 sm:px-6 py-14">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(ld) }} />
      <div className="mb-10">
        <span className="inline-flex w-12 h-12 rounded-2xl bg-blue-50 items-center justify-center mb-3">
          <HelpCircle size={22} className="text-blue-600" />
        </span>
        <h1 className="text-3xl font-bold text-slate-900">Frequently asked questions</h1>
      </div>

      <div className="space-y-4">
        {FAQS.map((f) => (
          <details key={f.q} className="group bg-white border border-slate-200 rounded-2xl px-5 py-4">
            <summary className="font-semibold text-slate-900 cursor-pointer list-none flex items-center justify-between gap-3">
              {f.q}
              <span className="text-slate-300 group-open:rotate-45 transition-transform text-xl leading-none shrink-0">+</span>
            </summary>
            <p className="text-slate-600 leading-relaxed mt-3">{f.a}</p>
          </details>
        ))}
      </div>

      <div className="mt-10 bg-blue-50 rounded-2xl p-5 flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm text-blue-900 font-medium">Didn’t find your answer?</p>
        <a href={`https://wa.me/96171998983?text=${encodeURIComponent('Hi! I have a question.')}`}
          target="_blank" rel="noopener noreferrer"
          className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-4 py-2.5 rounded-xl transition-colors">
          <MessageCircle size={15} /> Ask on WhatsApp
        </a>
      </div>

      <p className="text-xs text-slate-400 mt-8">
        See also: <Link href="/warranty" className="text-blue-600 hover:underline">Warranty</Link> ·{' '}
        <Link href="/returns" className="text-blue-600 hover:underline">Returns</Link> ·{' '}
        <Link href="/track" className="text-blue-600 hover:underline">Track order</Link> ·{' '}
        <Link href="/guides" className="text-blue-600 hover:underline">Buying guides</Link>
      </p>
    </div>
  )
}
