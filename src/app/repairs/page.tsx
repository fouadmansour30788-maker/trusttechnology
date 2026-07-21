'use client'
import { useState } from 'react'
import { Wrench, Loader2, CheckCircle2, PackageSearch, MessageCircle, XCircle } from 'lucide-react'

const WHATSAPP = '96171998983'
const STEPS = ['Received', 'Diagnosing', 'Repairing', 'Ready']

type TrackResult = {
  reference: string; device: string; status: string; statusLabel: string
  step: number; quote: number | null; bookedAt: string
}

export default function RepairsPage() {
  const [tab, setTab] = useState<'book' | 'track'>('book')

  // booking
  const [form, setForm] = useState({ name: '', phone: '', device: '', problem: '', website: '' })
  const [booking, setBooking] = useState(false)
  const [bookError, setBookError] = useState<string | null>(null)
  const [bookedRef, setBookedRef] = useState<string | null>(null)

  // tracking
  const [track, setTrack] = useState({ reference: '', phone: '' })
  const [tracking, setTracking] = useState(false)
  const [trackError, setTrackError] = useState<string | null>(null)
  const [result, setResult] = useState<TrackResult | null>(null)

  async function book(e: React.FormEvent) {
    e.preventDefault()
    setBooking(true)
    setBookError(null)
    try {
      const res = await fetch('/api/repairs', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(form) })
      const data = await res.json()
      if (data.ok) setBookedRef(data.reference)
      else setBookError(data.error === 'unavailable' ? 'Booking is temporarily unavailable — message us on WhatsApp.' : data.error)
    } catch {
      setBookError('Network error — please try again.')
    } finally {
      setBooking(false)
    }
  }

  async function doTrack(e: React.FormEvent) {
    e.preventDefault()
    setTracking(true)
    setTrackError(null)
    setResult(null)
    try {
      const res = await fetch('/api/repairs', { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(track) })
      const data = await res.json()
      if (data.ok) setResult(data)
      else setTrackError(data.error === 'unavailable' ? 'Tracking is temporarily unavailable.' : data.error)
    } catch {
      setTrackError('Network error — please try again.')
    } finally {
      setTracking(false)
    }
  }

  const input = 'w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-400'

  return (
    <div className="max-w-xl mx-auto px-4 sm:px-6 py-14">
      <div className="text-center mb-8">
        <span className="inline-flex w-12 h-12 rounded-2xl bg-blue-50 items-center justify-center mb-3">
          <Wrench size={22} className="text-blue-600" />
        </span>
        <h1 className="text-3xl font-bold text-slate-900">Repairs & Service</h1>
        <p className="text-slate-500 mt-1 text-sm">Free diagnosis — laptops, desktops, printers and POS hardware. Book below or track an existing repair.</p>
      </div>

      <div className="flex bg-slate-100 rounded-xl p-1 mb-6">
        {(['book', 'track'] as const).map((t) => (
          <button key={t} onClick={() => setTab(t)}
            className={`flex-1 py-2.5 text-sm font-semibold rounded-lg transition-colors ${tab === t ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500'}`}>
            {t === 'book' ? 'Book a repair' : 'Track a repair'}
          </button>
        ))}
      </div>

      {tab === 'book' && (
        bookedRef ? (
          <div className="bg-white border border-slate-200 rounded-2xl p-8 text-center">
            <CheckCircle2 size={36} className="text-emerald-600 mx-auto mb-3" />
            <h2 className="text-xl font-bold text-slate-900">Repair booked!</h2>
            <p className="text-slate-600 mt-2">Your repair number is <span className="font-bold">{bookedRef}</span>. We’ll call you to arrange drop-off or pickup. Diagnosis is free.</p>
            <a href={`https://wa.me/${WHATSAPP}?text=${encodeURIComponent(`Hi! I just booked repair ${bookedRef}.`)}`}
              target="_blank" rel="noopener noreferrer"
              className="mt-5 inline-flex items-center gap-2 bg-emerald-500 hover:bg-emerald-600 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-colors">
              <MessageCircle size={15} /> Chat on WhatsApp
            </a>
          </div>
        ) : (
          <form onSubmit={book} className="space-y-3 bg-white border border-slate-200 rounded-2xl p-6">
            <input required placeholder="Your name" value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} className={input} />
            <input required placeholder="Phone (WhatsApp preferred)" inputMode="tel" value={form.phone} onChange={(e) => setForm({ ...form, phone: e.target.value })} className={input} />
            <input required placeholder="Device — e.g. HP 15 laptop, Epson printer" value={form.device} onChange={(e) => setForm({ ...form, device: e.target.value })} className={input} />
            <textarea required rows={3} placeholder="What’s wrong? (doesn’t turn on, broken screen, slow, paper jam…)" value={form.problem}
              onChange={(e) => setForm({ ...form, problem: e.target.value })} className={`${input} resize-none`} />
            <input value={form.website} onChange={(e) => setForm({ ...form, website: e.target.value })} name="website" tabIndex={-1} autoComplete="off" className="hidden" aria-hidden="true" />
            {bookError && <p className="text-sm text-red-600 bg-red-50 rounded-xl px-4 py-3">{bookError}</p>}
            <button type="submit" disabled={booking}
              className="w-full inline-flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-xl transition-colors disabled:opacity-60">
              {booking ? <Loader2 size={16} className="animate-spin" /> : <Wrench size={16} />} Book free diagnosis
            </button>
          </form>
        )
      )}

      {tab === 'track' && (
        <>
          <form onSubmit={doTrack} className="space-y-3 bg-white border border-slate-200 rounded-2xl p-6">
            <input required placeholder="Repair number — REP-0003" value={track.reference} onChange={(e) => setTrack({ ...track, reference: e.target.value })} className={input} />
            <input required placeholder="Phone you booked with" inputMode="tel" value={track.phone} onChange={(e) => setTrack({ ...track, phone: e.target.value })} className={input} />
            {trackError && <p className="text-sm text-red-600 bg-red-50 rounded-xl px-4 py-3">{trackError}</p>}
            <button type="submit" disabled={tracking}
              className="w-full inline-flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 rounded-xl transition-colors disabled:opacity-60">
              {tracking ? <Loader2 size={16} className="animate-spin" /> : <PackageSearch size={16} />} Track repair
            </button>
          </form>

          {result && (
            <div className="mt-6 bg-white border border-slate-200 rounded-2xl p-6">
              <div className="flex items-center justify-between flex-wrap gap-2 mb-5">
                <p className="font-bold text-slate-900">{result.reference} · {result.device}</p>
                <p className="text-xs text-slate-400">Booked {new Date(result.bookedAt).toLocaleDateString('en-GB', { day: 'numeric', month: 'long' })}</p>
              </div>
              {result.status === 'cancelled' ? (
                <p className="flex items-center gap-2 text-red-600 font-medium"><XCircle size={18} /> This repair was cancelled.</p>
              ) : (
                <div className="flex items-center mb-3">
                  {STEPS.map((label, i) => {
                    const done = result.step >= i + 1
                    return (
                      <div key={label} className="flex items-center flex-1 last:flex-none">
                        <div className="flex flex-col items-center">
                          <span className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-bold ${done ? 'bg-blue-600 text-white' : 'bg-slate-100 text-slate-400'}`}>
                            {done ? <CheckCircle2 size={15} /> : i + 1}
                          </span>
                          <span className={`text-[11px] mt-1 ${done ? 'text-slate-700 font-medium' : 'text-slate-400'}`}>{label}</span>
                        </div>
                        {i < STEPS.length - 1 && <div className={`h-0.5 flex-1 mx-2 mb-4 ${result.step > i + 1 ? 'bg-blue-600' : 'bg-slate-100'}`} />}
                      </div>
                    )
                  })}
                </div>
              )}
              <p className="text-sm text-slate-600">{result.statusLabel}</p>
              {result.quote !== null && (
                <p className="mt-3 text-sm bg-amber-50 text-amber-900 rounded-xl px-4 py-3">
                  Repair quote: <span className="font-bold">${result.quote.toLocaleString()}</span> — message us on WhatsApp to approve.
                </p>
              )}
            </div>
          )}
        </>
      )}
    </div>
  )
}
