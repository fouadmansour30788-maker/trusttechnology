import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import { getProductBySlug, getProducts } from '@/lib/db'
import { getBestPriceIds, withBestPrice } from '@/lib/best-price'
import { ProductDetail } from '@/components/products/ProductDetail'
import { ProductCard } from '@/components/products/ProductCard'
import { SITE_URL } from '@/lib/site'
import type { Product } from '@/lib/types'

export const dynamic = 'force-dynamic'

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }): Promise<Metadata> {
  const { slug } = await params
  const p = await getProductBySlug(slug)
  if (!p) return { title: 'Product' }
  const desc = p.description || `${p.name} — available at Trust Technology, Tripoli.`
  return {
    title: p.name,
    description: desc,
    openGraph: { title: p.name, description: desc, images: p.images?.length ? [p.images[0]] : [], url: `${SITE_URL}/products/${p.slug}` },
    alternates: { canonical: `${SITE_URL}/products/${p.slug}` },
  }
}

function relatedProducts(product: Product, all: Product[]): Product[] {
  const brand = product.tags?.find((t) => t.type === 'brand')?.slug
  const scored = all
    .filter((p) => p.id !== product.id && p.is_active)
    .map((p) => {
      let score = 0
      if (product.primary_category_id && p.primary_category_id === product.primary_category_id) score += 2
      if (brand && p.tags?.some((t) => t.slug === brand)) score += 1
      if (p.images?.[0]) score += 0.5
      return { p, score }
    })
    .filter((x) => x.score >= 2)
    .sort((a, b) => b.score - a.score)
  return scored.slice(0, 4).map((x) => x.p)
}

export default async function ProductPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const [fetched, all, bestIds] = await Promise.all([getProductBySlug(slug), getProducts(), getBestPriceIds()])
  if (!fetched) notFound()
  const product = bestIds.has(fetched.id) ? { ...fetched, bestPrice: true } : fetched
  const related = withBestPrice(relatedProducts(product, all), bestIds)

  const onRequest = product.priceOnRequest || product.price === 0
  const ld = {
    '@context': 'https://schema.org',
    '@type': 'Product',
    name: product.name,
    sku: product.sku ?? undefined,
    image: product.images?.map((i) => (i.startsWith('http') ? i : `${SITE_URL}${i}`)),
    description: product.description ?? product.name,
    brand: { '@type': 'Brand', name: product.tags?.find((t) => t.type === 'brand')?.name ?? 'Trust Technology' },
    offers: {
      '@type': 'Offer',
      priceCurrency: 'USD',
      price: onRequest ? undefined : product.price,
      availability: product.stock > 0 ? 'https://schema.org/InStock' : 'https://schema.org/OutOfStock',
      url: `${SITE_URL}/products/${product.slug}`,
    },
  }

  return (
    <>
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(ld) }} />
      <ProductDetail product={product} />
      {related.length > 0 && (
        <section className="max-w-7xl mx-auto px-4 sm:px-6 pb-16">
          <h2 className="text-xl font-bold text-slate-900 mb-4">You may also like</h2>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {related.map((p) => <ProductCard key={p.id} product={p} />)}
          </div>
        </section>
      )}
    </>
  )
}
