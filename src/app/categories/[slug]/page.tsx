import { FilterSidebar } from '@/components/products/FilterSidebar'
import { ProductCard } from '@/components/products/ProductCard'
import { PageHeader } from '@/components/ui/PageHeader'
import { getProducts, getCategories } from '@/lib/db'
import { getBestPriceIds, withBestPrice } from '@/lib/best-price'
import { getReviewStatsMap, withReviewStats } from '@/lib/reviews'
import { SPEC_FACETS, facetOptions, parseSpecParam, matchesSpecFilters } from '@/lib/spec-facets'
import type { Product, Tag } from '@/lib/types'

type Props = {
  params: Promise<{ slug: string }>
  searchParams: Promise<{ tags?: string; specs?: string; sort?: string }>
}

export const dynamic = 'force-dynamic'

const CATEGORY_LABELS: Record<string, string> = {
  computing: 'Computing', laptops: 'Laptops', desktops: 'Desktops', imacs: 'iMacs',
  peripherals: 'Peripherals & Accessories', displays: 'Displays & Vision',
  printing: 'Printing & Consumables', professional: 'Professional Solutions',
  apple: 'Apple Collection', monitors: 'Monitors', 'ink-toner': 'Ink & Toner',
  storage: 'Storage', networking: 'Networking', 'pos-systems': 'POS Systems',
}

// Static-fallback mapping: parent category slug → child category slugs
// (mirrors primary_category_id values used in the static catalog).
const PARENT_TO_CHILDREN: Record<string, string[]> = {
  computing: ['laptops', 'desktops', 'imacs'],
  displays: ['monitors'],
  printing: ['ink-toner'],
  professional: ['pos-systems'],
}

export default async function CategoryPage({ params, searchParams }: Props) {
  const { slug } = await params
  const { tags: tagFilter, specs: specFilter, sort } = await searchParams
  const selectedTags = tagFilter?.split(',').filter(Boolean) ?? []
  const selectedSpecs = parseSpecParam(specFilter)

  const [fetched, categories, bestIds, reviewStats] = await Promise.all([getProducts(), getCategories(), getBestPriceIds(), getReviewStatsMap()])
  const all = withReviewStats(withBestPrice(fetched, bestIds), reviewStats)

  // Resolve which category identifiers count as "in this category".
  let matchIds: Set<string>
  if (categories.length) {
    // Supabase: ids are UUIDs; include the category + its children.
    const cat = categories.find((c) => c.slug === slug)
    const childIds = categories.filter((c) => c.parent_id === cat?.id).map((c) => c.id)
    matchIds = new Set([cat?.id, ...childIds].filter(Boolean) as string[])
  } else {
    // Static: primary_category_id holds the slug.
    matchIds = new Set([slug, ...(PARENT_TO_CHILDREN[slug] ?? [])])
  }

  // Apple is a brand collection, not a category.
  let products: Product[] =
    slug === 'apple'
      ? all.filter((p) => p.tags?.some((t) => t.slug === 'apple'))
      : all.filter((p) => p.primary_category_id && matchIds.has(p.primary_category_id))

  products = products.filter((p) => p.is_active)

  // Brand/type tags available within this category.
  const categoryTags: Tag[] = Array.from(
    new Map(products.flatMap((p) => p.tags ?? []).map((t) => [t.slug, t])).values()
  ).sort((a, b) => a.name.localeCompare(b.name))

  // Facet options reflect the category's products before spec-filtering, so
  // unchecking a box doesn't make its sibling options disappear.
  const specFacetOptions = Object.fromEntries(
    SPEC_FACETS.map(({ key }) => [key, facetOptions(products, key)])
  )

  if (selectedTags.length > 0) {
    products = products.filter((p) => p.tags?.some((t) => selectedTags.includes(t.slug)))
  }
  products = products.filter((p) => matchesSpecFilters(p, selectedSpecs))

  const priced = (p: Product) => (p.priceOnRequest || p.price === 0 ? Infinity : p.price)
  if (sort === 'price_asc') products = [...products].sort((a, b) => priced(a) - priced(b))
  if (sort === 'price_desc')
    products = [...products].sort((a, b) => {
      const av = priced(a) === Infinity ? -1 : a.price
      const bv = priced(b) === Infinity ? -1 : b.price
      return bv - av
    })

  const label = CATEGORY_LABELS[slug] ?? slug

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      <PageHeader eyebrow="Browse" title={label} subtitle={`${products.length} products`} />

      <div className="flex flex-col md:flex-row gap-6 md:gap-8">
        <FilterSidebar tags={categoryTags} specFacetOptions={specFacetOptions} />

        <div className="flex-1 min-w-0">
          {products.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-24 text-center">
              <p className="text-2xl text-slate-400 mb-2">No products found</p>
              <p className="text-slate-500 text-sm">Try adjusting your filters or browse all products.</p>
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
