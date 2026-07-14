import 'server-only'
import { createClient as createServiceClient } from '@supabase/supabase-js'
import type { Product } from '@/lib/types'

/**
 * Products verifiably cheaper than every matched competitor listing
 * (Mojitech, PC and Parts, Ayoub, Multitech, Mediatech) — powers the
 * "Best price in Lebanon" badge. Reads via the service role because
 * competitor_prices is staff-only under RLS; returns empty when the
 * key isn't configured (e.g. local dev), so the storefront never breaks.
 */
export async function getBestPriceIds(): Promise<Set<string>> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return new Set()
  try {
    const s = createServiceClient(url, key, { auth: { persistSession: false } })
    const [{ data: cp }, { data: prods }] = await Promise.all([
      s.from('competitor_prices').select('price, matched_product_id').not('matched_product_id', 'is', null).gt('price', 0),
      s.from('products').select('id, price').gt('price', 0),
    ])
    const minCompetitor = new Map<string, number>()
    for (const r of ((cp as { price: number; matched_product_id: string }[]) ?? [])) {
      const p = Number(r.price)
      const cur = minCompetitor.get(r.matched_product_id)
      if (cur === undefined || p < cur) minCompetitor.set(r.matched_product_id, p)
    }
    const ids = new Set<string>()
    for (const p of ((prods as { id: string; price: number }[]) ?? [])) {
      const min = minCompetitor.get(p.id)
      if (min !== undefined && Number(p.price) < min) ids.add(p.id)
    }
    return ids
  } catch {
    return new Set()
  }
}

export type MarketRange = { min: number; max: number; stores: number }

/**
 * Anonymous market range for one product from matched competitor listings.
 * Only meant to be displayed when it flatters us — the caller decides.
 */
export async function getMarketRange(productId: string): Promise<MarketRange | null> {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY
  if (!url || !key) return null
  try {
    const s = createServiceClient(url, key, { auth: { persistSession: false } })
    const { data } = await s
      .from('competitor_prices')
      .select('competitor, price')
      .eq('matched_product_id', productId)
      .gt('price', 0)
    const rows = (data as { competitor: string; price: number }[]) ?? []
    if (rows.length < 2) return null
    const prices = rows.map((r) => Number(r.price))
    return {
      min: Math.min(...prices),
      max: Math.max(...prices),
      stores: new Set(rows.map((r) => r.competitor)).size,
    }
  } catch {
    return null
  }
}

/** Stamp the bestPrice flag onto a product list. */
export function withBestPrice<T extends Product>(products: T[], ids: Set<string>): T[] {
  if (ids.size === 0) return products
  return products.map((p) => (ids.has(p.id) ? { ...p, bestPrice: true } : p))
}
