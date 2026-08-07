'use client'
import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import Image from 'next/image'
import { Banknote, Loader2, MessageCircle, ShoppingCart, Truck, Gift, CheckCircle2 } from 'lucide-react'
import { useCartStore } from '@/store/cart'
import { DELIVERY_REGIONS, deliveryFee } from '@/lib/delivery'

const WHATSAPP = '96171998983'

export default function CheckoutPage() {
  const router = useRouter()
  const { items, removeItem } = useCartStore()
  const [form, setForm] = useState({ name: '', phone: '', address: '', note: '', website: '' })
  const [region, setRegion] = useState<string>(DELIVERY_REGIONS[0].id)
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [giftCode, setGiftCode] = useState('')
  const [giftCheck, setGiftCheck] = useState<{ checking: boolean; valid: boolean | null; balance: number | null; error: string | null }>(
    { checking: false, valid: null, balance: null, error: null }
  )

  const priced = items.filter((i) => !i.product.priceOnRequest && i.product.price > 0)
  const callItems = items.filter((i) => i.product.priceOnRequest || i.product.price === 0)
  const subtotal = priced.reduce((s, i) => s + i.product.price * i.quantity, 0)
  const { fee } = deliveryFee(region, subtotal)
  const preDiscountTotal = subtotal + fee
  const giftDiscount = giftCheck.valid && giftCheck.balance !== null ? Math.min(giftCheck.balance, preDiscountTotal) : 0
  const total = preDiscountTotal - giftDiscount

  async function checkGiftCode() {
    const code = giftCode.trim().toUpperCase()
    if (!code) return
    setGiftCheck({ checking: true, valid: null, balance: null, error: null })
    try {
      const res = await fetch(`/api/gift-certificates/validate?code=${encodeURIComponent(code)}`)
      const data = await res.json()
      if (data.valid) setGiftCheck({ checking: false, valid: true, balance: data.remainingBalance, error: null })
      else setGiftCheck({ checking: false, valid: false, balance: null, error: data.error ?? 'Invalid code' })
    } catch {
      setGiftCheck({ checking: false, valid: false, balance: null, error: 'Could not check that code.' })
    }
  }

  async function submit(e: React.FormEvent) {
    e.preventDefault()
    setSubmitting(true)
    setError(null)
    try {
      const res = await fetch('/api/checkout', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          ...form,
          region,
          items: priced.map((i) => ({ slug: i.product.slug, quantity: i.quantity })),
          giftCertificateCode: giftCheck.valid ? giftCode.trim().toUpperCase() : undefined,
        }),
      })
      const data = await res.json()
      if (data.ok) {
        priced.forEach((i) => removeItem(i.product.id))
        router.push(`/checkout/success?ref=${encodeURIComponent(data.reference)}`)
      } else {
        setError(data.error === 'unavailable'
          ? 'Online ordering is temporarily unavailable — please order via WhatsApp instead.'
          : data.error ?? 'Something went wrong — please try again.')
        setSubmitting(false)
      }
    } catch {
      setError('Network error — please try again or order via WhatsApp.')
      setSubmitting(false)
    }
  }

  if (priced.length === 0) {
    return (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 py-24 flex flex-col items-center text-center gap-5">
        <ShoppingCart size={48} className="text-slate-300" />
        <h1 className="text-2xl font-bold text-slate-900">Nothing to check out</h1>
        <p className="text-slate-500 max-w-md">
          {callItems.length > 0
            ? 'The items in your cart are “Call for price” — send them as a WhatsApp quote instead.'
            : 'Your cart is empty. Add some products first.'}
        </p>
        <Link href={callItems.length > 0 ? '/cart' : '/products'} className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-3 rounded-xl transition-colors">
          {callItems.length > 0 ? 'Back to cart' : 'Shop now'}
        </Link>
      </div>
    )
  }

  return (
    <div className="max-w-5xl mx-auto px-4 sm:px-6 py-10">
      <h1 className="text-3xl font-bold text-slate-900 mb-1">Checkout</h1>
      <p className="text-slate-500 mb-8 flex items-center gap-2"><Banknote size={16} className="text-blue-600" /> Cash on delivery — pay when your order arrives.</p>

      <div className="grid lg:grid-cols-2 gap-8">
        {/* Form */}
        <form onSubmit={submit} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Full name</label>
            <input required value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })}
              className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400" placeholder="Your name" />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Phone (WhatsApp preferred)</label>
            <input required value={form.phone} onChange={(e) => setForm({ ...form, phone: e.target.value })}
              className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400" placeholder="+961 71 123 456" inputMode="tel" />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Delivery region</label>
            <select value={region} onChange={(e) => setRegion(e.target.value)}
              className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400">
              {DELIVERY_REGIONS.map((r) => (
                <option key={r.id} value={r.id}>{r.label} — ${r.fee} delivery</option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Delivery address</label>
            <textarea required value={form.address} onChange={(e) => setForm({ ...form, address: e.target.value })} rows={3}
              className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400 resize-none" placeholder="City / area, street, building…" />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Note <span className="text-slate-400 font-normal">(optional)</span></label>
            <input value={form.note} onChange={(e) => setForm({ ...form, note: e.target.value })}
              className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400" placeholder="Anything we should know?" />
          </div>
          <div>
            <label className="block text-sm font-medium text-slate-700 mb-1">Gift certificate code <span className="text-slate-400 font-normal">(optional)</span></label>
            <div className="flex gap-2">
              <input
                value={giftCode}
                onChange={(e) => { setGiftCode(e.target.value); setGiftCheck({ checking: false, valid: null, balance: null, error: null }) }}
                placeholder="GC-XXXXXXXX"
                className="flex-1 bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400 uppercase"
              />
              <button
                type="button" onClick={checkGiftCode} disabled={!giftCode.trim() || giftCheck.checking}
                className="shrink-0 px-4 rounded-xl border border-slate-200 text-sm font-semibold text-slate-600 hover:border-blue-300 disabled:opacity-50"
              >
                {giftCheck.checking ? <Loader2 size={15} className="animate-spin" /> : 'Apply'}
              </button>
            </div>
            {giftCheck.valid === true && (
              <p className="text-xs text-emerald-600 mt-1.5 flex items-center gap-1"><CheckCircle2 size={12} /> ${giftCheck.balance?.toFixed(2)} available — applied to your order.</p>
            )}
            {giftCheck.valid === false && <p className="text-xs text-red-600 mt-1.5">{giftCheck.error}</p>}
          </div>
          {/* Honeypot */}
          <input value={form.website} onChange={(e) => setForm({ ...form, website: e.target.value })} name="website" tabIndex={-1} autoComplete="off" className="hidden" aria-hidden="true" />

          {error && <p className="text-sm text-red-600 bg-red-50 rounded-xl px-4 py-3">{error}</p>}

          <button type="submit" disabled={submitting}
            className="w-full inline-flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3.5 rounded-xl shadow-lg shadow-blue-600/20 transition-colors disabled:opacity-60">
            {submitting ? <Loader2 size={17} className="animate-spin" /> : <Truck size={17} />}
            {submitting ? 'Placing order…' : `Place order — $${total.toLocaleString(undefined, { maximumFractionDigits: 2 })} on delivery`}
          </button>
          <p className="text-xs text-slate-400 text-center">We’ll call you to confirm availability and delivery time before anything ships.</p>
        </form>

        {/* Summary */}
        <div className="bg-white border border-slate-200 rounded-2xl p-6 h-fit space-y-4">
          <h2 className="text-lg font-bold text-slate-900">Your order</h2>
          <div className="space-y-3">
            {priced.map(({ product, quantity }) => (
              <div key={product.id} className="flex items-center gap-3">
                <div className="w-12 h-12 rounded-lg bg-slate-100 shrink-0 overflow-hidden relative">
                  {product.images[0] && <Image src={product.images[0]} alt={product.name} fill className="object-cover" sizes="48px" />}
                </div>
                <p className="text-sm text-slate-700 flex-1 min-w-0 truncate">{product.name} <span className="text-slate-400">× {quantity}</span></p>
                <p className="text-sm font-semibold text-slate-900 tabular-nums">${(product.price * quantity).toFixed(2)}</p>
              </div>
            ))}
          </div>
          <div className="border-t border-slate-100 pt-4 space-y-1.5">
            <div className="flex justify-between text-sm">
              <span className="text-slate-500">Subtotal</span>
              <span className="text-slate-700 tabular-nums">${subtotal.toFixed(2)}</span>
            </div>
            <div className="flex justify-between text-sm">
              <span className="text-slate-500">Delivery</span>
              <span className="text-slate-700 tabular-nums">{fee === 0 ? 'Free' : `$${fee.toFixed(2)}`}</span>
            </div>
            {giftDiscount > 0 && (
              <div className="flex justify-between text-sm">
                <span className="text-emerald-600 flex items-center gap-1"><Gift size={12} /> Gift certificate</span>
                <span className="text-emerald-600 tabular-nums">−${giftDiscount.toFixed(2)}</span>
              </div>
            )}
            <div className="flex justify-between pt-2">
              <span className="font-bold text-slate-900">Total (cash on delivery)</span>
              <span className="font-bold text-slate-900 text-xl tabular-nums">${total.toFixed(2)}</span>
            </div>
          </div>
          {callItems.length > 0 && (
            <div className="bg-blue-50 rounded-xl px-4 py-3 text-xs text-blue-800">
              {callItems.length} “Call for price” item{callItems.length > 1 ? 's are' : ' is'} not included —{' '}
              <a className="font-semibold underline text-emerald-700" target="_blank" rel="noopener noreferrer"
                href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent('Hi! Price request: ' + callItems.map((i) => `${i.quantity}× ${i.product.name}`).join(', '))}`}>
                ask on WhatsApp <MessageCircle size={11} className="inline" />
              </a>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
