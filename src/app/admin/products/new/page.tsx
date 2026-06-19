import { getCategories, getTags } from '@/lib/db'
import { ProductForm } from '@/components/admin/ProductForm'

export const dynamic = 'force-dynamic'

export default async function NewProductPage() {
  const [categories, tags] = await Promise.all([getCategories(), getTags()])
  return (
    <div className="p-8">
      <ProductForm product={null} categories={categories} tags={tags} />
    </div>
  )
}
