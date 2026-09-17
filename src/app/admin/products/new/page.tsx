import { getCategories, getTags } from '@/lib/db'
import { getSuppliers } from '@/lib/erp'
import { ProductForm } from '@/components/admin/ProductForm'

export const dynamic = 'force-dynamic'

export default async function NewProductPage() {
  const [categories, tags, suppliers] = await Promise.all([getCategories(), getTags(), getSuppliers()])
  return (
    <div className="p-8">
      <ProductForm product={null} categories={categories} tags={tags} suppliers={suppliers} />
    </div>
  )
}
