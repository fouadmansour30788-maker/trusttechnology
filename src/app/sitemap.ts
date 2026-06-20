import type { MetadataRoute } from 'next'
import { getProducts } from '@/lib/db'
import { SITE_URL } from '@/lib/site'

export const dynamic = 'force-dynamic'

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const now = new Date()
  const routes = [
    '', '/products', '/bundles', '/recommend',
    '/categories/computing', '/categories/laptops', '/categories/desktops',
    '/categories/displays', '/categories/monitors', '/categories/printing',
    '/categories/ink-toner', '/categories/professional', '/categories/pos-systems',
    '/categories/apple',
  ].map((p) => ({
    url: `${SITE_URL}${p}`,
    lastModified: now,
    changeFrequency: 'weekly' as const,
    priority: p === '' ? 1 : 0.7,
  }))

  let products: { slug: string }[] = []
  try {
    products = await getProducts()
  } catch {
    products = []
  }
  const productRoutes = products.map((p) => ({
    url: `${SITE_URL}/products/${p.slug}`,
    lastModified: now,
    changeFrequency: 'weekly' as const,
    priority: 0.6,
  }))

  return [...routes, ...productRoutes]
}
