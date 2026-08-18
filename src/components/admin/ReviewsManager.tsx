'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { Star, Trash2, CheckCircle2, Eye, EyeOff } from 'lucide-react'
import { setReviewPublished, deleteReview } from '@/app/admin/reviews/actions'

export type ReviewRow = {
  id: string; customer_name: string; rating: number; comment: string | null
  is_published: boolean; created_at: string
  product: { name: string; slug: string } | null
}

function Row({ r }: { r: ReviewRow }) {
  const router = useRouter()
  const [pending, startTransition] = useTransition()

  function toggle() {
    startTransition(async () => {
      await setReviewPublished(r.id, !r.is_published)
      router.refresh()
    })
  }
  function remove() {
    if (!confirm('Delete this review?')) return
    startTransition(async () => {
      await deleteReview(r.id)
      router.refresh()
    })
  }

  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5">
      <div className="flex items-start justify-between gap-3">
        <div className="min-w-0">
          <div className="flex items-center gap-2 flex-wrap">
            <p className="text-sm font-semibold text-slate-900">{r.customer_name}</p>
            <div className="flex items-center gap-0.5">
              {[1, 2, 3, 4, 5].map((i) => <Star key={i} size={12} className={i <= r.rating ? 'fill-amber-400 text-amber-400' : 'text-slate-200'} />)}
            </div>
            {r.is_published && <span className="inline-flex items-center gap-1 text-emerald-600 font-medium text-xs"><CheckCircle2 size={11} /> published</span>}
          </div>
          {r.comment && <p className="text-sm text-slate-600 mt-1.5">{r.comment}</p>}
          <p className="text-xs text-slate-400 mt-1.5">
            {new Date(r.created_at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short' })} · on{' '}
            {r.product ? <Link href={`/products/${r.product.slug}`} target="_blank" className="text-blue-600 hover:underline">{r.product.name}</Link> : 'deleted product'}
          </p>
        </div>
        <div className="flex items-center gap-1 shrink-0">
          <button onClick={toggle} disabled={pending}
            className={`inline-flex items-center gap-1.5 text-xs font-semibold px-3 py-1.5 rounded-lg disabled:opacity-50 ${r.is_published ? 'text-slate-600 bg-slate-100 hover:bg-slate-200' : 'text-emerald-700 bg-emerald-50 hover:bg-emerald-100'}`}>
            {r.is_published ? <><EyeOff size={12} /> Unpublish</> : <><Eye size={12} /> Publish</>}
          </button>
          <button onClick={remove} className="p-1.5 text-slate-300 hover:text-red-600"><Trash2 size={15} /></button>
        </div>
      </div>
    </div>
  )
}

export function ReviewsManager({ reviews }: { reviews: ReviewRow[] }) {
  const [filter, setFilter] = useState<'pending' | 'published' | 'all'>('pending')
  const shown = reviews.filter((r) => filter === 'all' ? true : filter === 'pending' ? !r.is_published : r.is_published)
  return (
    <>
      <div className="flex gap-2 mb-5">
        {(['pending', 'published', 'all'] as const).map((f) => (
          <button key={f} onClick={() => setFilter(f)}
            className={`text-xs font-medium rounded-full px-3 py-1.5 border capitalize transition-colors ${filter === f ? 'bg-blue-600 text-white border-blue-600' : 'text-slate-500 border-slate-200 hover:border-blue-300'}`}>
            {f}
          </button>
        ))}
      </div>
      {shown.length === 0 ? (
        <p className="text-sm text-slate-400 py-16 text-center bg-white border border-slate-200 rounded-2xl">No reviews here.</p>
      ) : (
        <div className="space-y-3">{shown.map((r) => <Row key={r.id} r={r} />)}</div>
      )}
    </>
  )
}
