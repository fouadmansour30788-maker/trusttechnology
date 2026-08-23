'use client'
import { useState } from 'react'
import { Building2, Loader2, CheckCircle2, MessageCircle } from 'lucide-react'
import { PageHeader } from '@/components/ui/PageHeader'

const WHATSAPP = '9613393002'

export default function QuotePage() {
  const [form, setForm] = useState({ companyName: '', contactName: '', phone: '', email: '', details: '', budget: '', website: '' })
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [reference, setReference] = useState<string | null>(null)

  async function submit(e: React.FormEvent) {
    e.preventDefault()
    setSubmitting(true)
    setError(null)
    try {
      const res = await fetch('/api/quote-requests', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(form),
      })
      const data = await res.json()
      if (data.ok) setReference(data.reference)
      else setError(data.error === 'unavailable' ? 'Quote requests are temporarily unavailable — message us on WhatsApp instead.' : data.error)
    } catch {
      setError('Network error — please try again.')
    } finally {
      setSubmitting(false)
    }
  }

  const input = 'w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400'

  return (
    <div className="max-w-xl mx-auto px-4 sm:px-6 py-14">
      <PageHeader
        center
        icon={<Building2 size={22} />}
        title="Business & Bulk Orders"
        subtitle="Outfitting an office, restaurant, school or retail chain? Tell us what you need and we'll come back with a tailored quote — bulk pricing, financing terms and delivery scheduled around you."
      />

      {reference ? (
        <div className="bg-white border border-slate-200 rounded-2xl p-8 text-center">
          <CheckCircle2 size={36} className="text-emerald-600 mx-auto mb-3" />
          <h2 className="text-xl font-bold text-slate-900">Request received!</h2>
          <p className="text-slate-600 mt-2">
            Your reference is <span className="font-bold">{reference}</span>. Our team will reach out within one business day with a quote.
          </p>
          <a href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent(`Hi! I just submitted a business quote request, ${reference}.`)}`}
            target="_blank" rel="noopener noreferrer"
            className="mt-5 inline-flex items-center gap-2 bg-emerald-500 hover:bg-emerald-600 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-colors">
            <MessageCircle size={15} /> Chat on WhatsApp now
          </a>
        </div>
      ) : (
        <form onSubmit={submit} className="space-y-3 bg-white border border-slate-200 rounded-2xl p-6">
          <input required placeholder="Company name" value={form.companyName} onChange={(e) => setForm({ ...form, companyName: e.target.value })} className={input} />
          <div className="grid grid-cols-2 gap-3">
            <input required placeholder="Contact name" value={form.contactName} onChange={(e) => setForm({ ...form, contactName: e.target.value })} className={input} />
            <input required placeholder="Phone" inputMode="tel" value={form.phone} onChange={(e) => setForm({ ...form, phone: e.target.value })} className={input} />
          </div>
          <input type="email" placeholder="Email (optional)" value={form.email} onChange={(e) => setForm({ ...form, email: e.target.value })} className={input} />
          <textarea required rows={4} placeholder="What do you need? Products, quantities, and timeline — e.g. 15 POS terminals + receipt printers for 3 branches, needed within a month."
            value={form.details} onChange={(e) => setForm({ ...form, details: e.target.value })} className={`${input} resize-none`} />
          <input placeholder="Budget range (optional)" value={form.budget} onChange={(e) => setForm({ ...form, budget: e.target.value })} className={input} />
          <input value={form.website} onChange={(e) => setForm({ ...form, website: e.target.value })} name="website" tabIndex={-1} autoComplete="off" className="hidden" aria-hidden="true" />
          {error && <p className="text-sm text-red-600 bg-red-50 rounded-xl px-4 py-3">{error}</p>}
          <button type="submit" disabled={submitting}
            className="w-full inline-flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-xl transition-colors disabled:opacity-60">
            {submitting ? <Loader2 size={16} className="animate-spin" /> : <Building2 size={16} />} Request a quote
          </button>
        </form>
      )}
    </div>
  )
}
