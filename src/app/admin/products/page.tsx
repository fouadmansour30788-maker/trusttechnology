import Link from 'next/link'
import { Plus } from 'lucide-react'
import { getProducts, getCategories, isSupabaseConfigured } from '@/lib/db'
import { createClient } from '@/lib/supabase/server'
import { getCompetitorPriceMap } from '@/lib/competitors'
import { ProductsTable, type MarketPrice } from '@/components/admin/ProductsTable'
import { SheetSyncButton } from '@/components/admin/SheetSyncButton'

export const dynamic = 'force-dynamic'

export default async function AdminProductsPage() {
  const [products, categories] = await Promise.all([getProducts({ adminView: true }), getCategories()])
  let marketPrices: Record<string, MarketPrice> = {}
  if (isSupabaseConfigured()) {
    const supabase = await createClient()
    marketPrices = await getCompetitorPriceMap(supabase)
  }
  return (
    <div className="p-8">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">Products</h1>
          <p className="text-slate-500 text-sm mt-0.5">{products.length} total</p>
        </div>
        <div className="flex items-center gap-3 flex-wrap">
          <SheetSyncButton />
          <Link href="/admin/products/new" className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white text-sm font-semibold px-4 py-2.5 rounded-xl shadow-lg shadow-blue-600/20">
            <Plus size={16} /> Add product
          </Link>
        </div>
      </div>
      <ProductsTable initial={products} categories={categories} marketPrices={marketPrices} />
    </div>
  )
}
