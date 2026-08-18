import 'server-only'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import type { Product } from '@/lib/types'

export type ReviewStats = { rating: number; reviewCount: number }

/**
 * Published-review aggregates for every product, in one query — mirrors
 * getBestPriceIds()'s shape so it can be stamped onto product lists the
 * same way. Returns an empty map (never throws) when Supabase isn't
 * configured, so the storefront never breaks.
 */
export async function getReviewStatsMap(): Promise<Map<string, ReviewStats>> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return new Map()
  try {
    const s = createServiceClient(url, key, { auth: { persistSession: false } })
    const { data } = await s.from('reviews').select('product_id, rating').eq('is_published', true)
    const sums = new Map<string, { total: number; count: number }>()
    for (const r of ((data as { product_id: string; rating: number }[]) ?? [])) {
      const cur = sums.get(r.product_id) ?? { total: 0, count: 0 }
      cur.total += Number(r.rating)
      cur.count += 1
      sums.set(r.product_id, cur)
    }
    const stats = new Map<string, ReviewStats>()
    for (const [id, { total, count }] of sums) {
      stats.set(id, { rating: Math.round((total / count) * 10) / 10, reviewCount: count })
    }
    return stats
  } catch {
    return new Map()
  }
}

/** Stamp review rating/count onto a product list (same convention as withBestPrice). */
export function withReviewStats<T extends Product>(products: T[], stats: Map<string, ReviewStats>): T[] {
  if (stats.size === 0) return products
  return products.map((p) => {
    const s = stats.get(p.id)
    return s ? { ...p, rating: s.rating, reviewCount: s.reviewCount } : p
  })
}

export type Review = {
  id: string
  customerName: string
  rating: number
  comment: string | null
  createdAt: string
}

/** Published reviews for one product (product detail page). */
export async function getPublishedReviews(productId: string): Promise<Review[]> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return []
  try {
    const s = createServiceClient(url, key, { auth: { persistSession: false } })
    const { data } = await s
      .from('reviews')
      .select('id, customer_name, rating, comment, created_at')
      .eq('product_id', productId)
      .eq('is_published', true)
      .order('created_at', { ascending: false })
      .limit(50)
    type Row = { id: string; customer_name: string; rating: number; comment: string | null; created_at: string }
    return ((data as Row[]) ?? []).map((r) => ({
      id: r.id, customerName: r.customer_name, rating: Number(r.rating), comment: r.comment, createdAt: r.created_at,
    }))
  } catch {
    return []
  }
}
