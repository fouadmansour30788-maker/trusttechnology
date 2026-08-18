import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { ReviewsManager, type ReviewRow } from '@/components/admin/ReviewsManager'

export const dynamic = 'force-dynamic'

export default async function AdminReviewsPage() {
  let reviews: ReviewRow[] = []
  if (isSupabaseConfigured()) {
    const supabase = await createClient()
    const { data } = await supabase
      .from('reviews')
      .select('id, customer_name, rating, comment, is_published, created_at, product:products(name, slug)')
      .order('created_at', { ascending: false })
      .limit(300)
    reviews = (data as unknown as ReviewRow[]) ?? []
  }
  return (
    <div className="p-8">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Reviews</h1>
        <p className="text-slate-500 text-sm mt-0.5">
          Customer reviews from product pages — publish to show them (and the star rating) on the storefront.
          {reviews.length === 0 && ' If the table doesn’t exist yet, run supabase/migrations/018_reviews.sql.'}
        </p>
      </div>
      <ReviewsManager reviews={reviews} />
    </div>
  )
}
