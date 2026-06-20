import Link from 'next/link'
import { Plus } from 'lucide-react'
import { getProducts } from '@/lib/db'
import { ProductsTable } from '@/components/admin/ProductsTable'

export const dynamic = 'force-dynamic'

export default async function AdminProductsPage() {
  const products = await getProducts({ adminView: true })
  return (
    <div className="p-8">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">Products</h1>
          <p className="text-slate-500 text-sm mt-0.5">{products.length} total</p>
        </div>
        <Link href="/admin/products/new" className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white text-sm font-semibold px-4 py-2.5 rounded-xl shadow-lg shadow-blue-600/20">
          <Plus size={16} /> Add product
        </Link>
      </div>
      <ProductsTable initial={products} />
    </div>
  )
}
