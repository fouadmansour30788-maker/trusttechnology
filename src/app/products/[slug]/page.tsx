import { notFound } from 'next/navigation'
import type { Metadata } from 'next'
import { getProductBySlug } from '@/lib/db'
import { getBestPriceIds } from '@/lib/best-price'
import { ProductDetail } from '@/components/products/ProductDetail'
import { SITE_URL } from '@/lib/site'

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

export default async function ProductPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const [fetched, bestIds] = await Promise.all([getProductBySlug(slug), getBestPriceIds()])
  if (!fetched) notFound()
  const product = bestIds.has(fetched.id) ? { ...fetched, bestPrice: true } : fetched

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
    </>
  )
}
