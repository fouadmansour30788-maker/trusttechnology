import { FilterSidebar } from '@/components/products/FilterSidebar'
import { ProductCard } from '@/components/products/ProductCard'
import { getProducts } from '@/lib/db'
import type { Product, Tag } from '@/lib/types'

type Props = {
  searchParams: Promise<{ tags?: string; sort?: string; q?: string }>
}

export const dynamic = 'force-dynamic'

export const metadata = {
  title: 'All Products – Trust Technology',
  description: 'Browse the full Trust Technology catalog — laptops, desktops, peripherals and more.',
}

export default async function ProductsPage({ searchParams }: Props) {
  const { tags: tagFilter, sort, q } = await searchParams

  // Live from Supabase when configured; static catalog otherwise.
  const allProducts = await getProducts()
  const ALL_TAGS: Tag[] = Array.from(
    new Map(allProducts.flatMap((p) => p.tags ?? []).map((t) => [t.slug, t])).values()
  ).sort((a, b) => a.name.localeCompare(b.name))

  const selectedTags = tagFilter?.split(',').filter(Boolean) ?? []
  const query = q?.trim().toLowerCase() ?? ''

  let products = allProducts.filter((p) => p.is_active)

  if (query) {
    products = products.filter(
      (p) =>
        p.name.toLowerCase().includes(query) ||
        (p.description?.toLowerCase().includes(query) ?? false) ||
        (p.tags?.some((t) => t.name.toLowerCase().includes(query)) ?? false)
    )
  }

  if (selectedTags.length > 0) {
    products = products.filter((p) =>
      p.tags?.some((t) => selectedTags.includes(t.slug))
    )
  }

  // "Call for price" items (price 0) always sort to the end.
  const priced = (p: Product) => (p.priceOnRequest || p.price === 0 ? Infinity : p.price)
  if (sort === 'price_asc') products = [...products].sort((a, b) => priced(a) - priced(b))
  if (sort === 'price_desc')
    products = [...products].sort((a, b) => {
      const av = priced(a) === Infinity ? -1 : a.price
      const bv = priced(b) === Infinity ? -1 : b.price
      return bv - av
    })

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      {/* Header */}
      <div className="mb-8">
        <p className="text-xs uppercase tracking-widest text-blue-600 font-semibold mb-1">Browse</p>
        <h1 className="text-3xl font-bold text-slate-900">
          {query ? `Search: “${q}”` : 'All Products'}
        </h1>
        <p className="text-slate-500 mt-1">{products.length} products</p>
      </div>

      <div className="flex gap-8">
        <FilterSidebar tags={ALL_TAGS} />

        <div className="flex-1 min-w-0">
          {products.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-24 text-center">
              <p className="text-2xl text-slate-400 mb-2">No products found</p>
              <p className="text-slate-500 text-sm">
                {query ? 'Try a different search term or clear your filters.' : 'Try adjusting your filters.'}
              </p>
            </div>
          ) : (
            <div className="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-4">
              {products.map((p) => (
                <ProductCard key={p.id} product={p} />
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
