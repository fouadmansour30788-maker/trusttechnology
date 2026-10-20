import type { MetadataRoute } from 'next'
import { getProducts } from '@/lib/db'
import { GUIDES } from '@/lib/guides'
import { SITE_URL } from '@/lib/site'

export const dynamic = 'force-dynamic'

/** Parses a DB timestamp into a real Date, or undefined when it's missing/unparseable
 *  (e.g. the static-catalog fallback's hardcoded empty-string updated_at) — omitting
 *  lastModified is more honest than claiming a change time we don't actually know. */
function realDate(iso?: string): Date | undefined {
  if (!iso) return undefined
  const d = new Date(iso)
  return Number.isNaN(d.getTime()) ? undefined : d
}

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  // No lastModified on these — we don't track real content-change dates for
  // static marketing pages, and a fake one is worse than none (see audit T01).
  const routes = [
    '', '/products', '/bundles', '/recommend', '/setup-builder', '/visual-search', '/about', '/deals', '/warranty', '/returns', '/track', '/repairs', '/faq', '/guides',
    ...GUIDES.map((g) => `/guides/${g.slug}`),
    '/categories/computing', '/categories/laptops', '/categories/desktops',
    '/categories/displays', '/categories/monitors', '/categories/printing',
    '/categories/ink-toner', '/categories/professional', '/categories/pos-systems',
    '/categories/apple',
  ].map((p) => ({
    url: `${SITE_URL}${p}`,
    changeFrequency: 'weekly' as const,
    priority: p === '' ? 1 : 0.7,
  }))

  let products: { slug: string; updated_at?: string }[] = []
  try {
    products = await getProducts()
  } catch {
    products = []
  }
  const productRoutes = products.map((p) => ({
    url: `${SITE_URL}/products/${p.slug}`,
    lastModified: realDate(p.updated_at),
    changeFrequency: 'weekly' as const,
    priority: 0.6,
  }))

  return [...routes, ...productRoutes]
}
