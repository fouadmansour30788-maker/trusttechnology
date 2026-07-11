import { notFound } from 'next/navigation'
import { getProductById, getCategories, getTags, isSupabaseConfigured } from '@/lib/db'
import { createClient } from '@/lib/supabase/server'
import { getCompetitorPricesForProduct, type CompetitorListing } from '@/lib/competitors'
import { ProductForm } from '@/components/admin/ProductForm'
import { CompetitorPanel } from '@/components/admin/CompetitorPanel'

export const dynamic = 'force-dynamic'

export default async function EditProductPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const [product, categories, tags] = await Promise.all([getProductById(id), getCategories(), getTags()])
  if (!product) notFound()

  let listings: CompetitorListing[] = []
  if (isSupabaseConfigured()) {
    const supabase = await createClient()
    listings = await getCompetitorPricesForProduct(supabase, id)
  }

  return (
    <div className="p-8">
      {listings.length > 0 && (
        <div className="mb-6 max-w-xl">
          <CompetitorPanel listings={listings} ourPrice={Number(product.price)} />
        </div>
      )}
      <ProductForm product={product} categories={categories} tags={tags} />
    </div>
  )
}
