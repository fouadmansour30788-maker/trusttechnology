import 'server-only'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import type { SupabaseClient } from '@supabase/supabase-js'
import { comparablePrice } from '@/lib/competitors'
import type { Product, Category } from '@/lib/types'

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type AnyClient = SupabaseClient<any, any, any>

function serviceClient() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return null
  return createServiceClient(url, key, { auth: { persistSession: false } })
}

export type TrendingProduct = { product: Product; views: number }

/**
 * Most-viewed products over the last N days. Reads via service role —
 * product_view_events is staff-only under RLS — so this is safe to call
 * from a public page; returns [] rather than throwing when unconfigured.
 */
export async function getStoreTrending(allProducts: Product[], days = 7, limit = 8): Promise<TrendingProduct[]> {
  const s = serviceClient()
  if (!s) return []
  try {
    const since = new Date(Date.now() - days * 86_400_000).toISOString()
    const counts = new Map<string, number>()
    for (let from = 0; ; from += 1000) {
      const { data, error } = await s
        .from('product_view_events')
        .select('product_id')
        .gte('viewed_at', since)
        .range(from, from + 999)
      if (error) return []
      const rows = (data as { product_id: string }[]) ?? []
      for (const r of rows) counts.set(r.product_id, (counts.get(r.product_id) ?? 0) + 1)
      if (rows.length < 1000) break
    }
    const byId = new Map(allProducts.map((p) => [p.id, p]))
    return [...counts.entries()]
      .map(([id, views]) => ({ product: byId.get(id), views }))
      .filter((t): t is TrendingProduct => !!t.product && t.product.is_active)
      .sort((a, b) => b.views - a.views)
      .slice(0, limit)
  } catch {
    return []
  }
}

/** Log one product-detail view. Best-effort — never throws, never blocks the page. */
export async function trackProductView(productId: string): Promise<void> {
  const s = serviceClient()
  if (!s) return
  try {
    await s.from('product_view_events').insert({ product_id: productId })
  } catch {
    // best-effort telemetry
  }
}

export type LocalMarketTrend = {
  productId: string
  productName: string
  competitor: string
  price: number
  previousPrice: number
  changedAt: string
  ourPrice: number
  diff: number
  diffPct: number
}

/**
 * "Trending in Lebanon" proxy built from data we already collect: our
 * matched products that competitors have most recently repriced. Frequent
 * repricing tracks real stock/demand movement in the local market, with no
 * extra scraping beyond the existing daily competitor sync.
 */
export async function getLocalMarketTrending(supabase: AnyClient, limit = 8): Promise<LocalMarketTrend[]> {
  const { data, error } = await supabase
    .from('competitor_prices')
    .select('matched_product_id, name, competitor, price, previous_price, price_changed_at, products:matched_product_id(name, price)')
    .not('matched_product_id', 'is', null)
    .not('price_changed_at', 'is', null)
    .order('price_changed_at', { ascending: false })
    .limit(60)
  if (error) return []
  type Row = {
    matched_product_id: string; name: string; competitor: string; price: number
    previous_price: number; price_changed_at: string; products: { name: string; price: number } | null
  }
  const seen = new Set<string>()
  const out: LocalMarketTrend[] = []
  for (const r of ((data as unknown as Row[]) ?? [])) {
    if (seen.has(r.matched_product_id)) continue
    seen.add(r.matched_product_id)
    const theirPrice = comparablePrice(r.competitor, r.name, Number(r.price))
    const ourPrice = Number(r.products?.price ?? 0)
    out.push({
      productId: r.matched_product_id,
      productName: r.products?.name ?? r.name,
      competitor: r.competitor,
      price: theirPrice,
      previousPrice: Number(r.previous_price),
      changedAt: r.price_changed_at,
      ourPrice,
      diff: ourPrice > 0 ? Math.round((ourPrice - theirPrice) * 100) / 100 : 0,
      diffPct: ourPrice > 0 && theirPrice > 0 ? Math.round(((ourPrice - theirPrice) / theirPrice) * 100) : 0,
    })
    if (out.length >= limit) break
  }
  return out
}

// ── Keyword → catalog matching ──────────────────────────────────────────
// Turns an abstract Google Trends score into concrete items: which of OUR
// products correspond to each trending search term. A keyword with zero
// matches is itself a useful signal (a demand gap in our assortment).

/** Resolve a product's category slug regardless of static-catalog vs Supabase mode (mirrors categories/[slug]/page.tsx). */
function categorySlugOf(p: Product, categories: Category[]): string | null {
  if (!p.primary_category_id) return null
  if (categories.length === 0) return p.primary_category_id // static catalog: already a slug
  return categories.find((c) => c.id === p.primary_category_id)?.slug ?? null
}

const GAMING_RE = /gaming|legion|omen|victus|nitro|predator|\brog\b|\btuf\b/i
const GPU_RE = /\b(rtx|gtx|radeon)\s?\d{3,4}/i

/** Maps a curated Google Trends keyword (see google-trends.ts) to a predicate over our catalog. */
const KEYWORD_MATCHERS: Record<string, (p: Product, categorySlug: string | null) => boolean> = {
  laptop: (_p, cat) => cat === 'laptops',
  'gaming laptop': (p, cat) => cat === 'laptops' && GAMING_RE.test(p.name),
  iphone: (p) => /iphone/i.test(p.name),
  macbook: (p) => /macbook/i.test(p.name),
  monitor: (_p, cat) => cat === 'monitors',
  'graphics card': (p) => GPU_RE.test(p.name) || Object.values(p.specs ?? {}).some((v) => GPU_RE.test(String(v))),
  printer: (_p, cat) => cat === 'printing' || cat === 'ink-toner',
  'pos system': (_p, cat) => cat === 'pos-systems',
}

export type KeywordMatch = { id: string; name: string; price: number; priceOnRequest: boolean; image: string | null }

/** Which of our own active products correspond to each trending search keyword. */
export function getKeywordProductMatches(
  keywords: string[],
  allProducts: Product[],
  categories: Category[],
  limit = 4
): Record<string, KeywordMatch[]> {
  const withCat = allProducts.filter((p) => p.is_active).map((p) => ({ p, cat: categorySlugOf(p, categories) }))
  const out: Record<string, KeywordMatch[]> = {}
  for (const keyword of keywords) {
    const matcher = KEYWORD_MATCHERS[keyword]
    if (!matcher) continue
    out[keyword] = withCat
      .filter(({ p, cat }) => matcher(p, cat))
      .sort((a, b) => (b.p.images?.length ? 1 : 0) - (a.p.images?.length ? 1 : 0))
      .slice(0, limit)
      .map(({ p }) => ({ id: p.id, name: p.name, price: p.price, priceOnRequest: p.priceOnRequest || p.price === 0, image: p.images?.[0] ?? null }))
  }
  return out
}

export type SearchTrend = { keyword: string; score: number; prevScore: number | null; direction: 'up' | 'down' | 'flat' }

/** Cached Google Trends search-interest scores for Lebanon (see refreshSearchTrending). */
export async function getSearchTrending(supabase: AnyClient): Promise<SearchTrend[]> {
  const { data, error } = await supabase
    .from('trending_searches')
    .select('keyword, score, prev_score, fetched_at')
    .eq('geo', 'LB')
    .order('score', { ascending: false })
  if (error) return []
  type Row = { keyword: string; score: number; prev_score: number | null }
  return ((data as Row[]) ?? []).map((r) => ({
    keyword: r.keyword,
    score: r.score,
    prevScore: r.prev_score,
    direction: r.prev_score === null || r.score === r.prev_score ? 'flat' : r.score > r.prev_score ? 'up' : 'down',
  }))
}

/**
 * Refresh trending_searches from live Google Trends — called by the digest
 * cron (tight deadline, so it never risks the digest's own 60s budget) and
 * the admin refresh button (full budget).
 */
export async function refreshSearchTrending(deadline?: number): Promise<{ ok: boolean; fetched: number; error?: string }> {
  const s = serviceClient()
  if (!s) return { ok: false, fetched: 0, error: 'not configured' }
  try {
    const { fetchAllTrends } = await import('@/lib/google-trends')
    const results = await fetchAllTrends(deadline)
    if (results.length === 0) return { ok: false, fetched: 0, error: 'no data fetched (Google Trends may be rate-limiting)' }
    const nowIso = new Date().toISOString()
    const rows = results.map((r) => ({ keyword: r.keyword, geo: 'LB', score: r.score, prev_score: r.prevScore, fetched_at: nowIso }))
    const { error } = await s.from('trending_searches').upsert(rows, { onConflict: 'keyword,geo' })
    if (error) return { ok: false, fetched: 0, error: error.message }
    return { ok: true, fetched: rows.length }
  } catch (e) {
    return { ok: false, fetched: 0, error: e instanceof Error ? e.message : String(e) }
  }
}
