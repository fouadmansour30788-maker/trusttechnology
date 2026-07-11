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
  ])
  const names = ['mojitech', 'pcandparts', 'ayoubcomputers']
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

  // Existing prices, for change tracking (paginate past PostgREST's 1000-row cap)
  const existing = new Map<string, number>()
  for (let from = 0; ; from += 1000) {
    const { data } = await supabase
      .from('competitor_prices')
      .select('competitor, external_id, price')
      .range(from, from + 999)
    const rows = (data as { competitor: string; external_id: string; price: number }[]) ?? []
    for (const r of rows) existing.set(`${r.competitor}:${r.external_id}`, Number(r.price))
    if (rows.length < 1000) break
  }

  const nowIso = new Date().toISOString()
  let updatedPrices = 0
  const rows = items.map((it) => {
    const key = `${it.competitor}:${it.external_id}`
    const prev = existing.get(key)
    const changed = prev !== undefined && Math.abs(prev - it.price) >= 0.01
    if (changed) updatedPrices++
    return {
      competitor: it.competitor,
      external_id: it.external_id,
      name: it.name,
      sku: it.sku,
      url: it.url,
      price: it.price,
      ...(changed ? { previous_price: prev, price_changed_at: nowIso } : {}),
      matched_product_id: matches.get(key) ?? null,
      fetched_at: nowIso,
    }
  })

  for (let i = 0; i < rows.length; i += 500) {
    const { error } = await supabase
      .from('competitor_prices')
      .upsert(rows.slice(i, i + 500), { onConflict: 'competitor,external_id' })
    if (error) throw new Error(`upsert failed: ${error.message}`)
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
  url: string | null
  diff: number      // ourPrice - theirPrice (positive = we're more expensive)
  diffPct: number
  fetchedAt: string
}

export async function getPriceComparisons(supabase: AnyClient): Promise<{
  comparisons: PriceComparison[]
  trackedTotal: number
  lastSync: string | null
}> {
  const { data: cp, error } = await supabase
    .from('competitor_prices')
    .select('competitor, name, sku, url, price, matched_product_id, fetched_at')
    .not('matched_product_id', 'is', null)
  if (error) return { comparisons: [], trackedTotal: 0, lastSync: null }

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

  type Row = { competitor: string; name: string; url: string | null; price: number; matched_product_id: string; fetched_at: string }
  const comparisons: PriceComparison[] = []
  for (const r of ((cp as Row[]) ?? [])) {
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
