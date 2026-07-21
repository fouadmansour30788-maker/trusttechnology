import Link from 'next/link'
import { CheckCircle2, MessageCircle, ArrowRight } from 'lucide-react'

export const metadata = { title: 'Order placed' }

export default async function CheckoutSuccessPage({ searchParams }: { searchParams: Promise<{ ref?: string }> }) {
  const { ref } = await searchParams
  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-24 flex flex-col items-center text-center gap-5">
      <span className="w-16 h-16 rounded-full bg-emerald-50 flex items-center justify-center">
        <CheckCircle2 size={34} className="text-emerald-600" />
      </span>
      <h1 className="text-3xl font-bold text-slate-900">Order placed!</h1>
      {ref && (
        <p className="text-slate-600">
          Your order number is <span className="font-bold text-slate-900">{ref}</span> — keep it handy.
        </p>
      )}
      <p className="text-slate-500 max-w-md">
        We’ll call you shortly to confirm availability and arrange delivery.
        You pay in cash when your order arrives.
      </p>
      <div className="flex flex-wrap justify-center gap-3 mt-2">
        <a
          href={`https://wa.me/96171998983?text=${encodeURIComponent(`Hi! I just placed order ${ref ?? ''} on your website.`)}`}
          target="_blank" rel="noopener noreferrer"
          className="inline-flex items-center gap-2 bg-emerald-500 hover:bg-emerald-600 text-white font-semibold px-6 py-3 rounded-xl transition-colors"
        >
          <MessageCircle size={16} /> Chat with us on WhatsApp
        </a>
        <Link href="/track" className="inline-flex items-center gap-2 bg-white border border-slate-200 hover:bg-slate-50 text-slate-700 font-semibold px-6 py-3 rounded-xl transition-colors">
          Track your order
        </Link>
        <Link href="/products" className="inline-flex items-center gap-2 bg-white border border-slate-200 hover:bg-slate-50 text-slate-700 font-semibold px-6 py-3 rounded-xl transition-colors">
          Continue shopping <ArrowRight size={15} />
        </Link>
      </div>
    </div>
  )
}
