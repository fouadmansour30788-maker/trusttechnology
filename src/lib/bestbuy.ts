import 'server-only'

/**
 * Best Buy Products API — free, self-serve key (developer.bestbuy.com), no
 * approval wait. US-only catalog/pricing, so this is a "what's popular in
 * the US tech market" signal, not a Lebanon one — shown separately from the
 * Google Trends (LB) and local-competitor panels, never blended with them.
 * No native "trending" field exists; customerReviewCount (sorted desc) is
 * the closest available popularity proxy.
 */

const CURATED_KEYWORDS = ['laptop', 'gaming laptop', 'desktop computer', 'monitor', 'graphics card', 'printer']

export type BestBuyItem = {
  sku: string
  keyword: string
  name: string
  price: number | null
  imageUrl: string | null
  productUrl: string | null
  reviewCount: number | null
  reviewAverage: number | null
}

type BestBuyResponse = {
  products?: {
    sku: number
    name: string
    salePrice?: number
    image?: string
    url?: string
    customerReviewCount?: number
    customerReviewAverage?: number
  }[]
}

export async function fetchBestBuyTrending(deadline = Date.now() + 20_000): Promise<BestBuyItem[]> {
  const apiKey = process.env.BESTBUY_API_KEY
  if (!apiKey) return []
  const out: BestBuyItem[] = []
  for (const keyword of CURATED_KEYWORDS) {
    if (Date.now() > deadline) break
    try {
      const url =
        `https://api.bestbuy.com/v1/products(search=${encodeURIComponent(keyword)}&onlineAvailability=true)` +
        `?apiKey=${apiKey}&format=json&sort=customerReviewCount.desc&pageSize=3` +
        `&show=sku,name,salePrice,image,url,customerReviewCount,customerReviewAverage`
      const res = await fetch(url, { signal: AbortSignal.timeout(10_000), cache: 'no-store' })
      if (!res.ok) {
        console.error(`[bestbuy] "${keyword}" HTTP ${res.status}`)
        continue
      }
      const data = (await res.json()) as BestBuyResponse
      for (const p of data.products ?? []) {
        out.push({
          sku: String(p.sku),
          keyword,
          name: p.name,
          price: p.salePrice ?? null,
          imageUrl: p.image ?? null,
          productUrl: p.url ?? null,
          reviewCount: p.customerReviewCount ?? null,
          reviewAverage: p.customerReviewAverage ?? null,
        })
      }
    } catch (e) {
      console.error(`[bestbuy] "${keyword}" failed: ${e instanceof Error ? e.message : e}`)
    }
  }
  return out
}
