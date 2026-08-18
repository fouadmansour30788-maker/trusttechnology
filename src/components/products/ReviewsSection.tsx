'use client'
import { useState } from 'react'
import { Star, Loader2, CheckCircle2 } from 'lucide-react'
import type { Review } from '@/lib/reviews'

function Stars({ value, size = 14 }: { value: number; size?: number }) {
  return (
    <div className="flex items-center gap-0.5">
      {[1, 2, 3, 4, 5].map((i) => (
        <Star key={i} size={size} className={i <= Math.round(value) ? 'fill-amber-400 text-amber-400' : 'text-slate-200'} />
      ))}
    </div>
  )
}

export function ReviewsSection({ productId, reviews, rating, reviewCount }: {
  productId: string
  reviews: Review[]
  rating?: number
  reviewCount?: number
}) {
  const [name, setName] = useState('')
  const [rate, setRate] = useState(0)
  const [hoverRate, setHoverRate] = useState(0)
  const [comment, setComment] = useState('')
  const [website, setWebsite] = useState('')
  const [sending, setSending] = useState(false)
  const [sent, setSent] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function submit(e: React.FormEvent) {
    e.preventDefault()
    if (rate < 1) { setError('Please choose a star rating.'); return }
    setSending(true)
    setError(null)
    try {
      const res = await fetch('/api/reviews', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ productId, name, rating: rate, comment, website }),
      })
      const data = await res.json()
      if (data.ok) setSent(true)
      else setError(typeof data.error === 'string' && data.error.length > 5 ? data.error : 'Could not send — try again.')
    } catch {
      setError('Could not send — try again.')
    } finally {
      setSending(false)
    }
  }

  return (
    <section id="reviews" className="max-w-7xl mx-auto px-4 sm:px-6 pb-16 scroll-mt-20">
      <div className="flex items-center gap-3 mb-1">
        <h2 className="text-xl font-bold text-slate-900">Reviews</h2>
        {reviewCount ? (
          <span className="inline-flex items-center gap-1.5 text-sm text-slate-500">
            <Stars value={rating ?? 0} /> {rating?.toFixed(1)} · {reviewCount} review{reviewCount === 1 ? '' : 's'}
          </span>
        ) : (
          <span className="text-sm text-slate-400">No reviews yet</span>
        )}
      </div>
      <p className="text-sm text-slate-400 mb-5">Real reviews from customers, moderated by the Trust Technology team.</p>

      {reviews.length > 0 && (
        <div className="space-y-4 mb-8">
          {reviews.map((r) => (
            <div key={r.id} className="bg-white border border-slate-200 rounded-2xl p-5">
              <div className="flex items-center justify-between gap-3 flex-wrap">
                <p className="text-sm font-semibold text-slate-900">{r.customerName}</p>
                <Stars value={r.rating} />
              </div>
              {r.comment && <p className="text-sm text-slate-600 leading-relaxed mt-2">{r.comment}</p>}
              <p className="text-xs text-slate-400 mt-2">{new Date(r.createdAt).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })}</p>
            </div>
          ))}
        </div>
      )}

      {sent ? (
        <p className="flex items-center gap-2 text-sm text-emerald-700 bg-emerald-50 rounded-xl px-4 py-3">
          <CheckCircle2 size={16} /> Thanks — your review will appear here once approved.
        </p>
      ) : (
        <form onSubmit={submit} className="bg-white border border-slate-200 rounded-2xl p-5 space-y-3 max-w-xl">
          <p className="text-sm font-semibold text-slate-900">{reviewCount ? 'Write a review' : 'Be the first to review this product'}</p>
          <div className="flex items-center gap-1" onMouseLeave={() => setHoverRate(0)}>
            {[1, 2, 3, 4, 5].map((i) => (
              <button key={i} type="button" onClick={() => setRate(i)} onMouseEnter={() => setHoverRate(i)} className="p-0.5">
                <Star size={22} className={i <= (hoverRate || rate) ? 'fill-amber-400 text-amber-400' : 'text-slate-200'} />
              </button>
            ))}
          </div>
          <input required value={name} onChange={(e) => setName(e.target.value)} placeholder="Your name" maxLength={60}
            className="w-full bg-white border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 outline-none focus:border-blue-400" />
          <textarea value={comment} onChange={(e) => setComment(e.target.value)} rows={2} maxLength={1000}
            placeholder="What did you think? (optional)"
            className="w-full bg-white border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 outline-none focus:border-blue-400 resize-none" />
          <input value={website} onChange={(e) => setWebsite(e.target.value)} name="website" tabIndex={-1} autoComplete="off" className="hidden" aria-hidden="true" />
          {error && <p className="text-sm text-red-600">{error}</p>}
          <button type="submit" disabled={sending || rate < 1 || name.trim().length < 2}
            className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-colors disabled:opacity-50">
            {sending ? <Loader2 size={14} className="animate-spin" /> : <Star size={14} />} Submit review
          </button>
        </form>
      )}
    </section>
  )
}
