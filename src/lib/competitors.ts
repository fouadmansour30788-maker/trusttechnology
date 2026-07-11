import 'server-only'
import type { SupabaseClient } from '@supabase/supabase-js'

/**
 * Competitor price monitoring.
 *
 * Sources:
 *  - Mojitech + PC and Parts: public WooCommerce Store API (clean JSON).
 *  - Ayoub Computers: BigCommerce — parsed from category listing pages.
 *
 * Matching links competitor items to our products by normalized SKU / model
 * tokens (e.g. "83N30002US", "NX.JDJAA.003", "S5606CA-SB92").
 */

export type CompetitorItem = {
  competitor: string
  external_id: string
  name: string
  sku: string | null
  url: string | null
  price: number
  in_stock: boolean
}

export const COMPETITOR_LABELS: Record<string, string> = {
  mojitech: 'Mojitech',
  pcandparts: 'PC and Parts',
  ayoubcomputers: 'Ayoub Computers',
  multitech: 'Multitech',
  mediatech: 'Mediatech',
}

export type SyncSummary = {
  sources: { competitor: string; items: number; error?: string }[]
  total: number
  matched: number
  updatedPrices: number
}

const UA = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36'
const CATEGORY_PATTERN = /laptop|notebook|desktop|all-?in-?one|monitor|printer|toner|ink|pos/i
const MAX_PAGES_PER_SOURCE = 20

async function getJson(url: string): Promise<unknown> {
  const res = await fetch(url, {
    headers: {
      'User-Agent': UA,
      Accept: 'application/json',
      'Accept-Language': 'en-US,en;q=0.9',
      Referer: url.split('/wp-json')[0] + '/',
    },
    signal: AbortSignal.timeout(15000),
    cache: 'no-store',
  })
  if (!res.ok) throw new Error(`HTTP ${res.status} on ${url}`)
  return res.json()
}

async function getHtml(url: string): Promise<string | null> {
  try {
    const res = await fetch(url, {
      headers: { 'User-Agent': UA },
      signal: AbortSignal.timeout(15000),
      cache: 'no-store',
    })
    if (!res.ok) return null
    return await res.text()
  } catch {
    return null
  }
}

// ── WooCommerce Store API sources ───────────────────────────────────────
type WooCategory = { id: number; slug: string; name: string; count: number }
type WooProduct = {
  id: number; name: string; sku: string; permalink: string
  is_in_stock?: boolean
  prices: { price: string; currency_minor_unit: number }
}

function decodeEntities(s: string): string {
  return s
    .replace(/&#(\d+);/g, (_, n) => String.fromCharCode(Number(n)))
    .replace(/&quot;/g, '"').replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&nbsp;/g, ' ')
    .replace(/\s+/g, ' ').trim()
}

async function fetchWooCompetitor(competitor: string, base: string): Promise<CompetitorItem[]> {
  const cats: WooCategory[] = []
  for (let page = 1; page <= 4; page++) {
    const batch = (await getJson(`${base}/wp-json/wc/store/v1/products/categories?per_page=100&page=${page}`)) as WooCategory[]
    cats.push(...batch)
    if (batch.length < 100) break
  }
  const wanted = cats.filter((c) => CATEGORY_PATTERN.test(`${c.slug} ${c.name}`) && c.count > 0)
  const byId = new Map<number, CompetitorItem>()
  let pageBudget = MAX_PAGES_PER_SOURCE
  for (const cat of wanted) {
    for (let page = 1; page <= 6 && pageBudget > 0; page++) {
      pageBudget--
      const batch = (await getJson(
        `${base}/wp-json/wc/store/v1/products?category=${cat.id}&per_page=100&page=${page}`
      )) as WooProduct[]
      for (const p of batch) {
        const minor = p.prices?.currency_minor_unit ?? 2
        const price = Number(p.prices?.price ?? 0) / 10 ** minor
        if (price <= 0) continue
        byId.set(p.id, {
          competitor,
          external_id: String(p.id),
          name: decodeEntities(p.name),
          sku: p.sku || null,
          url: p.permalink || null,
          price,
          in_stock: p.is_in_stock !== false,
        })
      }
      if (batch.length < 100) break
    }
  }
  return [...byId.values()]
}

// ── Ayoub Computers (BigCommerce, HTML) ─────────────────────────────────
const AYOUB_CATEGORIES = ['laptops', 'desktops', 'monitors', 'printers']

function parseAyoubPage(html: string): CompetitorItem[] {
  const items: CompetitorItem[] = []
  const chunks = html.split('class="card-title"').slice(1)
  for (const chunk of chunks) {
    const link = chunk.match(/<a href="(https:\/\/ayoubcomputers\.com\/[^"]+)"[^>]*>([^<]+)<\/a>/)
    const price = chunk.match(/price--withoutTax price--main">\$([\d,]+(?:\.\d+)?)/)
    if (!link || !price) continue
    const name = link[2].replace(/&quot;/g, '"').replace(/&amp;/g, '&').trim()
    items.push({
      competitor: 'ayoubcomputers',
      external_id: link[1].replace('https://ayoubcomputers.com/', '').replace(/\/$/, ''),
      name,
      sku: null,
      url: link[1],
      price: Number(price[1].replace(/,/g, '')),
      in_stock: true, // listing pages only show purchasable items
    })
  }
  return items
}

async function fetchAyoub(): Promise<CompetitorItem[]> {
  const byId = new Map<string, CompetitorItem>()
  let pageBudget = MAX_PAGES_PER_SOURCE
  for (const cat of AYOUB_CATEGORIES) {
    for (let page = 1; page <= 8 && pageBudget > 0; page++) {
      pageBudget--
      const html = await getHtml(`https://ayoubcomputers.com/${cat}/?page=${page}`)
      if (!html) break
      const items = parseAyoubPage(html)
      if (items.length === 0) break
      for (const it of items) byId.set(it.external_id, it)
      if (items.length < 12) break
    }
  }
  return [...byId.values()]
}

// ── Model-token matching ────────────────────────────────────────────────
const NON_MODEL = /^(i[3579]|r[3579]|m[1234]|rtx|gtx|rx\d|arc|core|ultra|ryzen|ddr|lpddr|pcie|nvme|usb|hdmi|wifi|win(dows)?\d|gen\d|intel|amd|gb|tb)/i
const UNIT_TOKEN = /^\d+(gb|tb|ghz|mhz|hz|w|wh|mm|cm|in(ch)?|k|p|ms|nits?)$/i

export function normalizeToken(s: string): string {
  return s.toUpperCase().replace(/[^A-Z0-9]/g, '')
}

export function extractModelTokens(name: string, sku?: string | null): string[] {
  const tokens = new Set<string>()
  if (sku) {
    const n = normalizeToken(sku)
    if (n.length >= 5) tokens.add(n)
  }
  for (const raw of name.split(/[\s,()|/]+/)) {
    const part = raw.replace(/^[^A-Za-z0-9]+|[^A-Za-z0-9]+$/g, '')
    if (!part || UNIT_TOKEN.test(part) || NON_MODEL.test(part)) continue
    const hasDigit = /\d/.test(part)
    const hasAlpha = /[A-Za-z]/.test(part)
    const n = normalizeToken(part)
    // Model numbers: alnum mixes ≥5 chars, or long digit-dash codes (e.g. 910-005182)
    if ((hasDigit && hasAlpha && n.length >= 5) || (hasDigit && !hasAlpha && n.length >= 7 && part.includes('-'))) {
      tokens.add(n)
    }
  }
  return [...tokens]
}

type OurProduct = { id: string; name: string; sku: string | null; price: number }

export function matchItems(items: CompetitorItem[], products: OurProduct[]): Map<string, string> {
  // token → our product id (first wins; tokens are near-unique model numbers)
  const tokenToProduct = new Map<string, string>()
  for (const p of products) {
    for (const t of extractModelTokens(p.name, p.sku)) {
      if (!tokenToProduct.has(t)) tokenToProduct.set(t, p.id)
    }
  }
  const matches = new Map<string, string>()
  for (const it of items) {
    for (const t of extractModelTokens(it.name, it.sku)) {
      const pid = tokenToProduct.get(t)
      if (pid) {
        matches.set(`${it.competitor}:${it.external_id}`, pid)
        break
      }
    }
  }
  return matches
}

// ── Sync orchestration ──────────────────────────────────────────────────
// eslint-disable-next-line @typescript-eslint/no-explicit-any
type AnyClient = SupabaseClient<any, any, any>

export async function syncCompetitorPrices(supabase: AnyClient): Promise<SyncSummary> {
  const sourceResults = await Promise.allSettled([
    fetchWooCompetitor('mojitech', 'https://mojitech.net'),
    fetchWooCompetitor('pcandparts', 'https://pcandparts.com'),
    fetchAyoub(),
    fetchWooCompetitor('multitech', 'https://multitech-lb.com'),
    fetchWooCompetitor('mediatech', 'https://mediatechlb.com'),
  ])
  const names = ['mojitech', 'pcandparts', 'ayoubcomputers', 'multitech', 'mediatech']
  const sources: SyncSummary['sources'] = []
  const items: CompetitorItem[] = []
  sourceResults.forEach((r, i) => {
    if (r.status === 'fulfilled') {
      sources.push({ competitor: names[i], items: r.value.length })
      items.push(...r.value)
    } else {
      const error = (r.reason instanceof Error ? r.reason.message : String(r.reason)).slice(0, 160)
      console.error(`[competitor-sync] ${names[i]} failed: ${error}`)
      sources.push({ competitor: names[i], items: 0, error })
    }
  })

  const { data: prodData } = await supabase.from('products').select('id, name, sku, price')
  const products = (prodData as OurProduct[]) ?? []
  const matches = matchItems(items, products)

  // Existing rows, for change tracking + manual-match preservation
  // (paginate past PostgREST's 1000-row cap)
  type ExistingRow = { competitor: string; external_id: string; price: number; matched_product_id: string | null; match_source?: string }
  const existing = new Map<string, ExistingRow>()
  let hasMatchSource = true
  for (let from = 0; ; from += 1000) {
    const res = await supabase
      .from('competitor_prices')
      .select('competitor, external_id, price, matched_product_id, match_source')
      .range(from, from + 999)
    let rows: ExistingRow[]
    if (res.error) {
      // match_source column arrives with migration 008 — fall back gracefully
      hasMatchSource = false
      const res2 = await supabase
        .from('competitor_prices')
        .select('competitor, external_id, price, matched_product_id')
        .range(from, from + 999)
      rows = (res2.data as ExistingRow[]) ?? []
    } else {
      rows = (res.data as unknown as ExistingRow[]) ?? []
    }
    for (const r of rows) existing.set(`${r.competitor}:${r.external_id}`, r)
    if (rows.length < 1000) break
  }

  const nowIso = new Date().toISOString()
  let updatedPrices = 0
  const historyRows: { competitor: string; external_id: string; price: number; recorded_at: string }[] = []
  const rows = items.map((it) => {
    const key = `${it.competitor}:${it.external_id}`
    const prev = existing.get(key)
    const changed = prev !== undefined && Math.abs(Number(prev.price) - it.price) >= 0.01
    if (changed) updatedPrices++
    if (prev === undefined || changed) {
      historyRows.push({ competitor: it.competitor, external_id: it.external_id, price: it.price, recorded_at: nowIso })
    }
    // Staff decisions win: 'manual' keeps its product, 'rejected' stays unlinked.
    const source = prev?.match_source
    const matched_product_id =
      source === 'manual' ? prev!.matched_product_id
      : source === 'rejected' ? null
      : matches.get(key) ?? null
    return {
      competitor: it.competitor,
      external_id: it.external_id,
      name: it.name,
      sku: it.sku,
      url: it.url,
      price: it.price,
      ...(hasMatchSource ? { in_stock: it.in_stock } : {}),
      ...(changed ? { previous_price: Number(prev!.price), price_changed_at: nowIso } : {}),
      matched_product_id,
      fetched_at: nowIso,
    }
  })

  for (let i = 0; i < rows.length; i += 500) {
    const { error } = await supabase
      .from('competitor_prices')
      .upsert(rows.slice(i, i + 500), { onConflict: 'competitor,external_id' })
    if (error) throw new Error(`upsert failed: ${error.message}`)
  }

  // History is best-effort until migration 008 has been run.
  for (let i = 0; i < historyRows.length; i += 500) {
    const { error } = await supabase.from('competitor_price_history').insert(historyRows.slice(i, i + 500))
    if (error) {
      console.error(`[competitor-sync] history insert skipped: ${error.message}`)
      break
    }
  }

  return { sources, total: items.length, matched: matches.size, updatedPrices }
}

// ── Read side (admin page + analytics) ──────────────────────────────────
export type PriceComparison = {
  productId: string
  productName: string
  ourPrice: number
  competitor: string
  theirName: string
  theirPrice: number
  theirInStock: boolean
  url: string | null
  diff: number      // ourPrice - theirPrice (positive = we're more expensive)
  diffPct: number
  fetchedAt: string
}

export type CompetitorListing = {
  competitor: string
  name: string
  price: number
  previous_price: number | null
  url: string | null
  fetched_at: string
}

/** All competitor listings matched to one product (for the product edit page). */
export async function getCompetitorPricesForProduct(supabase: AnyClient, productId: string): Promise<CompetitorListing[]> {
  const { data, error } = await supabase
    .from('competitor_prices')
    .select('competitor, name, price, previous_price, url, fetched_at')
    .eq('matched_product_id', productId)
    .order('price')
  if (error) return []
  return ((data as CompetitorListing[]) ?? []).map((r) => ({ ...r, price: Number(r.price), previous_price: r.previous_price === null ? null : Number(r.previous_price) }))
}

/** Cheapest competitor price per product (for the products table chip). */
export async function getCompetitorPriceMap(supabase: AnyClient): Promise<Record<string, { price: number; competitor: string }>> {
  const { data, error } = await supabase
    .from('competitor_prices')
    .select('competitor, price, matched_product_id')
    .not('matched_product_id', 'is', null)
  if (error) return {}
  const map: Record<string, { price: number; competitor: string }> = {}
  for (const r of ((data as { competitor: string; price: number; matched_product_id: string }[]) ?? [])) {
    const price = Number(r.price)
    if (price <= 0) continue
    const cur = map[r.matched_product_id]
    if (!cur || price < cur.price) map[r.matched_product_id] = { price, competitor: r.competitor }
  }
  return map
}

export type PriceChange = {
  competitor: string; name: string; url: string | null
  price: number; previous_price: number; changed_at: string
  matched: boolean
}

/** Latest observed price changes (for the "what changed" feed). */
export async function getRecentChanges(supabase: AnyClient, limit = 15): Promise<PriceChange[]> {
  const { data, error } = await supabase
    .from('competitor_prices')
    .select('competitor, name, url, price, previous_price, price_changed_at, matched_product_id')
    .not('price_changed_at', 'is', null)
    .order('price_changed_at', { ascending: false })
    .limit(limit)
  if (error) return []
  type Row = { competitor: string; name: string; url: string | null; price: number; previous_price: number; price_changed_at: string; matched_product_id: string | null }
  return ((data as Row[]) ?? []).map((r) => ({
    competitor: r.competitor, name: r.name, url: r.url,
    price: Number(r.price), previous_price: Number(r.previous_price),
    changed_at: r.price_changed_at, matched: r.matched_product_id !== null,
  }))
}

export type AssortmentGap = {
  brand: string
  count: number
  carried: boolean
  minPrice: number
  samples: { name: string; price: number; competitor: string; url: string | null }[]
}

/** Unmatched competitor items grouped by brand — what they sell that we may not. */
export async function getAssortmentGaps(supabase: AnyClient, ourBrands: Set<string>): Promise<AssortmentGap[]> {
  type Row = { competitor: string; name: string; url: string | null; price: number }
  const rows: Row[] = []
  for (let from = 0; from < 4000; from += 1000) {
    const { data, error } = await supabase
      .from('competitor_prices')
      .select('competitor, name, url, price')
      .is('matched_product_id', null)
      .range(from, from + 999)
    if (error) return []
    const batch = (data as Row[]) ?? []
    rows.push(...batch)
    if (batch.length < 1000) break
  }
  const groups = new Map<string, AssortmentGap>()
  for (const r of rows) {
    const brand = (r.name.trim().split(/\s+/)[0] ?? '').toUpperCase().replace(/[^A-Z0-9]/g, '')
    if (brand.length < 2 || /^\d+$/.test(brand)) continue
    const g = groups.get(brand) ?? { brand, count: 0, carried: ourBrands.has(brand), minPrice: Infinity, samples: [] }
    g.count++
    g.minPrice = Math.min(g.minPrice, Number(r.price))
    if (g.samples.length < 3) g.samples.push({ name: r.name, price: Number(r.price), competitor: r.competitor, url: r.url })
    groups.set(brand, g)
  }
  return [...groups.values()]
    .filter((g) => g.count >= 3)
    .sort((a, b) => b.count - a.count)
    .slice(0, 15)
}

export type PricingOpportunity = {
  productId: string
  productName: string
  cost: number | null
  minCompetitorPrice: number
  competitor: string
  suggested: number
  belowCostFloor: boolean
}

/** "Call for price" products with matched competitor prices → suggested price. */
export async function getPricingOpportunities(supabase: AnyClient): Promise<PricingOpportunity[]> {
  const [{ data: prodData }, { data: cpData }] = await Promise.all([
    supabase.from('products').select('id, name, price, cost').eq('price', 0),
    supabase.from('competitor_prices').select('competitor, price, matched_product_id').not('matched_product_id', 'is', null).gt('price', 0),
  ])
  const products = ((prodData as { id: string; name: string; price: number; cost: number | null }[]) ?? [])
  const byProduct = new Map<string, { price: number; competitor: string }>()
  for (const r of ((cpData as { competitor: string; price: number; matched_product_id: string }[]) ?? [])) {
    const cur = byProduct.get(r.matched_product_id)
    if (!cur || Number(r.price) < cur.price) byProduct.set(r.matched_product_id, { price: Number(r.price), competitor: r.competitor })
  }
  const out: PricingOpportunity[] = []
  for (const p of products) {
    const best = byProduct.get(p.id)
    if (!best) continue
    const suggested = Math.max(1, Math.round(best.price * 0.98))
    const cost = p.cost === null ? null : Number(p.cost)
    out.push({
      productId: p.id,
      productName: p.name,
      cost,
      minCompetitorPrice: best.price,
      competitor: best.competitor,
      suggested,
      belowCostFloor: cost !== null && cost > 0 && suggested < cost * 1.05,
    })
  }
  return out.sort((a, b) => b.minCompetitorPrice - a.minCompetitorPrice)
}

export type HistoryPoint = { date: string; competitor: string; price: number }

/** Price history for all listings matched to one product (for the edit-page chart). */
export async function getHistoryForProduct(supabase: AnyClient, productId: string): Promise<HistoryPoint[]> {
  const { data: listings, error } = await supabase
    .from('competitor_prices')
    .select('competitor, external_id')
    .eq('matched_product_id', productId)
  if (error || !listings || listings.length === 0) return []
  const pairs = new Set((listings as { competitor: string; external_id: string }[]).map((l) => `${l.competitor}:${l.external_id}`))
  const { data: hist, error: histErr } = await supabase
    .from('competitor_price_history')
    .select('competitor, external_id, price, recorded_at')
    .in('external_id', (listings as { external_id: string }[]).map((l) => l.external_id))
    .order('recorded_at')
    .limit(500)
  if (histErr) return []
  type Row = { competitor: string; external_id: string; price: number; recorded_at: string }
  return ((hist as Row[]) ?? [])
    .filter((h) => pairs.has(`${h.competitor}:${h.external_id}`))
    .map((h) => ({ date: h.recorded_at, competitor: h.competitor, price: Number(h.price) }))
}

/** Unmatched items (not rejected) — input for AI match suggestions. */
export async function getUnmatchedItems(supabase: AnyClient, cap = 400): Promise<CompetitorItem[]> {
  type Row = { competitor: string; external_id: string; name: string; sku: string | null; url: string | null; price: number; match_source?: string }
  const res = await supabase
    .from('competitor_prices')
    .select('competitor, external_id, name, sku, url, price, match_source')
    .is('matched_product_id', null)
    .neq('match_source', 'rejected')
    .limit(cap)
  let data: Row[]
  if (res.error) {
    const res2 = await supabase
      .from('competitor_prices')
      .select('competitor, external_id, name, sku, url, price')
      .is('matched_product_id', null)
      .limit(cap)
    if (res2.error) return []
    data = (res2.data as Row[]) ?? []
  } else {
    data = (res.data as unknown as Row[]) ?? []
  }
  return (data ?? []).map((r) => ({
    competitor: r.competitor, external_id: r.external_id, name: r.name,
    sku: r.sku, url: r.url, price: Number(r.price), in_stock: true,
  }))
}

export async function getPriceComparisons(supabase: AnyClient): Promise<{
  comparisons: PriceComparison[]
  trackedTotal: number
  lastSync: string | null
}> {
  type CpRow = { competitor: string; name: string; url: string | null; price: number; in_stock?: boolean; matched_product_id: string; fetched_at: string }
  const cpRes = await supabase
    .from('competitor_prices')
    .select('competitor, name, sku, url, price, in_stock, matched_product_id, fetched_at')
    .not('matched_product_id', 'is', null)
  let cp: CpRow[]
  if (cpRes.error) {
    // in_stock arrives with migration 008 — retry without it
    const res2 = await supabase
      .from('competitor_prices')
      .select('competitor, name, sku, url, price, matched_product_id, fetched_at')
      .not('matched_product_id', 'is', null)
    if (res2.error) return { comparisons: [], trackedTotal: 0, lastSync: null }
    cp = (res2.data as CpRow[]) ?? []
  } else {
    cp = (cpRes.data as unknown as CpRow[]) ?? []
  }

  const { count } = await supabase
    .from('competitor_prices')
    .select('id', { count: 'exact', head: true })
  const { data: last } = await supabase
    .from('competitor_prices')
    .select('fetched_at')
    .order('fetched_at', { ascending: false })
    .limit(1)

  const { data: prodData } = await supabase.from('products').select('id, name, price')
  const products = new Map(((prodData as { id: string; name: string; price: number }[]) ?? []).map((p) => [p.id, p]))

  const comparisons: PriceComparison[] = []
  for (const r of cp) {
    const p = products.get(r.matched_product_id)
    if (!p) continue
    const ourPrice = Number(p.price)
    const theirPrice = Number(r.price)
    if (theirPrice <= 0) continue
    comparisons.push({
      productId: p.id,
      productName: p.name,
      ourPrice,
      competitor: r.competitor,
      theirName: r.name,
      theirPrice,
      theirInStock: r.in_stock !== false,
      url: r.url,
      diff: Math.round((ourPrice - theirPrice) * 100) / 100,
      diffPct: ourPrice > 0 ? Math.round(((ourPrice - theirPrice) / theirPrice) * 100) : 0,
      fetchedAt: r.fetched_at,
    })
  }
  comparisons.sort((a, b) => b.diffPct - a.diffPct)
  return {
    comparisons,
    trackedTotal: count ?? 0,
    lastSync: (last as { fetched_at: string }[] | null)?.[0]?.fetched_at ?? null,
  }
}
