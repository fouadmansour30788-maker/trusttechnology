'use client'
import { useState } from 'react'
import Link from 'next/link'
import { Gift, Loader2, CheckCircle2 } from 'lucide-react'

const PRESETS = [25, 50, 100, 200]

export default function GiftCertificatesPage() {
  const [amount, setAmount] = useState<number>(50)
  const [customAmount, setCustomAmount] = useState('')
  const [purchaserName, setPurchaserName] = useState('')
  const [purchaserPhone, setPurchaserPhone] = useState('')
  const [recipientName, setRecipientName] = useState('')
  const [recipientEmail, setRecipientEmail] = useState('')
  const [message, setMessage] = useState('')
  const [website, setWebsite] = useState('') // honeypot
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [done, setDone] = useState<{ reference: string; amount: number } | null>(null)

  const finalAmount = customAmount ? Number(customAmount) : amount

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError(null)
    setLoading(true)
    try {
      const res = await fetch('/api/gift-certificates/purchase', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          amount: finalAmount, purchaserName, purchaserPhone,
          recipientName, recipientEmail, message, website,
        }),
      })
      const data = await res.json()
      if (!res.ok) { setError(data.error ?? 'Something went wrong.'); return }
      setDone({ reference: data.reference, amount: data.amount })
    } catch {
      setError('Could not reach the server. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  if (done) {
    return (
      <div className="max-w-lg mx-auto px-4 py-20 text-center">
        <CheckCircle2 size={44} className="text-emerald-500 mx-auto mb-4" />
        <h1 className="text-2xl font-bold text-slate-900 mb-2">Order received — {done.reference}</h1>
        <p className="text-slate-500">
          We'll call you at the number provided to confirm payment for your ${done.amount.toFixed(2)} gift certificate.
          Once confirmed, we'll activate it and send the code to {recipientEmail || 'the recipient'}.
        </p>
        <Link href="/" className="inline-block mt-6 text-blue-600 hover:text-blue-700 font-medium">← Back to store</Link>
      </div>
    )
  }

  return (
    <div className="max-w-lg mx-auto px-4 sm:px-6 py-12">
      <div className="text-center mb-8">
        <Gift size={36} className="text-blue-600 mx-auto mb-3" />
        <h1 className="text-3xl font-bold text-slate-900">Gift Certificates</h1>
        <p className="text-slate-500 mt-2">Give the gift of tech — redeemable on anything in the store.</p>
      </div>

      <form onSubmit={onSubmit} className="bg-white border border-slate-200 rounded-2xl p-6 space-y-4">
        <div>
          <label className="block text-sm font-medium text-slate-700 mb-2">Amount</label>
          <div className="grid grid-cols-4 gap-2 mb-2">
            {PRESETS.map((p) => (
              <button
                type="button" key={p}
                onClick={() => { setAmount(p); setCustomAmount('') }}
                className={`py-2.5 rounded-xl text-sm font-semibold border transition-colors ${
                  !customAmount && amount === p ? 'bg-blue-600 border-blue-600 text-white' : 'border-slate-200 text-slate-700 hover:border-blue-300'
                }`}
              >
                ${p}
              </button>
            ))}
          </div>
          <input
            type="number" min={10} max={1000} step={1} placeholder="Custom amount ($10–$1000)"
            value={customAmount} onChange={(e) => setCustomAmount(e.target.value)}
            className="w-full px-3 py-2.5 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
          />
        </div>

        <div className="grid grid-cols-2 gap-3">
          <input
            type="text" required placeholder="Your name" maxLength={80}
            value={purchaserName} onChange={(e) => setPurchaserName(e.target.value)}
            className="px-3 py-2.5 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
          />
          <input
            type="tel" required placeholder="Your phone" maxLength={30}
            value={purchaserPhone} onChange={(e) => setPurchaserPhone(e.target.value)}
            className="px-3 py-2.5 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
          />
        </div>

        <div className="grid grid-cols-2 gap-3">
          <input
            type="text" placeholder="Recipient name (optional)" maxLength={80}
            value={recipientName} onChange={(e) => setRecipientName(e.target.value)}
            className="px-3 py-2.5 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
          />
          <input
            type="email" placeholder="Recipient email (optional)"
            value={recipientEmail} onChange={(e) => setRecipientEmail(e.target.value)}
            className="px-3 py-2.5 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
          />
        </div>

        <textarea
          placeholder="Add a message (optional)" maxLength={300} rows={3}
          value={message} onChange={(e) => setMessage(e.target.value)}
          className="w-full px-3 py-2.5 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400 resize-none"
        />

        <input
          type="text" value={website} onChange={(e) => setWebsite(e.target.value)}
          className="hidden" tabIndex={-1} autoComplete="off"
        />

        {error && <p className="text-sm text-red-600">{error}</p>}

        <button
          type="submit" disabled={loading}
          className="w-full inline-flex items-center justify-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white font-semibold py-3 rounded-xl shadow-lg shadow-blue-600/20 disabled:opacity-50"
        >
          {loading ? <Loader2 size={16} className="animate-spin" /> : <Gift size={16} />}
          Order for ${Number.isFinite(finalAmount) && finalAmount > 0 ? finalAmount.toFixed(0) : '0'} — Cash on Delivery
        </button>
        <p className="text-xs text-slate-400 text-center">We'll call to confirm payment, same as any order — no card needed now.</p>
      </form>
    </div>
  )
}
