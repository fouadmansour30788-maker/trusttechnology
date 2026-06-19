import { notFound } from 'next/navigation'
import { getProductById, getCategories, getTags } from '@/lib/db'
import { ProductForm } from '@/components/admin/ProductForm'

export const dynamic = 'force-dynamic'

export default async function EditProductPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const [product, categories, tags] = await Promise.all([getProductById(id), getCategories(), getTags()])
  if (!product) notFound()
  return (
    <div className="p-8">
      <ProductForm product={product} categories={categories} tags={tags} />
    </div>
  )
}
