import { notFound } from 'next/navigation'
import { getProductBySlug } from '@/lib/db'
import { ProductDetail } from '@/components/products/ProductDetail'

export const dynamic = 'force-dynamic'

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const p = await getProductBySlug(slug)
  return { title: p ? `${p.name} – Trust Technology` : 'Product – Trust Technology' }
}

export default async function ProductPage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const product = await getProductBySlug(slug)
  if (!product) notFound()
  return <ProductDetail product={product} />
}
