import Link from 'next/link'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import { FilterSidebar } from '@/components/products/FilterSidebar'
import { ProductCard } from '@/components/products/ProductCard'
import { PageHeader } from '@/components/ui/PageHeader'
import { getProducts } from '@/lib/db'
import { getBestPriceIds, withBestPrice } from '@/lib/best-price'
import { getReviewStatsMap, withReviewStats } from '@/lib/reviews'
import { SPEC_FACETS, facetOptions, parseSpecParam, matchesSpecFilters } from '@/lib/spec-facets'
import { canonicalFor } from '@/lib/site'
import type { Product, Tag } from '@/lib/types'

type SearchParams = { tags?: string; specs?: string; sort?: string; q?: string; page?: string }
type Props = { searchParams: Promise<SearchParams> }

// Whole catalog used to ship in one response (318 products, 2.68MB of HTML
// — the Oct 2026 audit's biggest unflagged cost). 48 divides evenly into
// the 2/3/4-column grid at every breakpoint.
const PAGE_SIZE = 48

/** Rebuilds /products?... with a new page number, keeping every other filter. */
function pageHref(page: number, params: SearchParams): string {
  const sp = new URLSearchParams()
  if (params.tags) sp.set('tags', params.tags)
  if (params.specs) sp.set('specs', params.specs)
  if (params.sort) sp.set('sort', params.sort)
  if (params.q) sp.set('q', params.q)
  if (page > 1) sp.set('page', String(page))
  const qs = sp.toString()
  return `/products${qs ? `?${qs}` : ''}`
}

export const dynamic = 'force-dynamic'

// Static (not generateMetadata) so every filter/sort/search query-param
// combination canonicalizes back to the clean /products URL, rather than
// each becoming its own indexable "page" — see the printing-category
// over-indexing concern in the Oct 2026 technical audit.
export const metadata = {
  title: 'All Products – Trust Technology',
  description: 'Browse the full Trust Technology catalog — laptops, desktops, peripherals and more.',
  alternates: { canonical: canonicalFor('/products') },
}

export default async function ProductsPage({ searchParams }: Props) {
  const params = await searchParams
  const { tags: tagFilter, specs: specFilter, sort, q } = params

  // Live from Supabase when configured; static catalog otherwise.
  const [fetched, bestIds, reviewStats] = await Promise.all([getProducts(), getBestPriceIds(), getReviewStatsMap()])
  const allProducts = withReviewStats(withBestPrice(fetched, bestIds), reviewStats)
  const ALL_TAGS: Tag[] = Array.from(
    new Map(allProducts.flatMap((p) => p.tags ?? []).map((t) => [t.slug, t])).values()
  ).sort((a, b) => a.name.localeCompare(b.name))

  const selectedTags = tagFilter?.split(',').filter(Boolean) ?? []
  const selectedSpecs = parseSpecParam(specFilter)
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

  // Facet option counts reflect the list before spec-filtering (so unchecking
  // a box doesn't make its sibling options disappear), matching how brand tags work.
  const specFacetOptions = Object.fromEntries(
    SPEC_FACETS.map(({ key }) => [key, facetOptions(products, key)])
  )

  if (selectedTags.length > 0) {
    products = products.filter((p) =>
      p.tags?.some((t) => selectedTags.includes(t.slug))
    )
  }
  products = products.filter((p) => matchesSpecFilters(p, selectedSpecs))

  // "Call for price" items (price 0) always sort to the end.
  const priced = (p: Product) => (p.priceOnRequest || p.price === 0 ? Infinity : p.price)
  if (sort === 'price_asc') products = [...products].sort((a, b) => priced(a) - priced(b))
  if (sort === 'price_desc')
    products = [...products].sort((a, b) => {
      const av = priced(a) === Infinity ? -1 : a.price
      const bv = priced(b) === Infinity ? -1 : b.price
      return bv - av
    })

  const totalPages = Math.max(1, Math.ceil(products.length / PAGE_SIZE))
  const page = Math.min(Math.max(1, Number(params.page) || 1), totalPages)
  const pageProducts = products.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE)

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      <PageHeader
        eyebrow="Browse"
        title={query ? `Search: “${q}”` : 'All Products'}
        subtitle={`${products.length} products`}
      />

      <div className="flex flex-col md:flex-row gap-6 md:gap-8">
        <FilterSidebar tags={ALL_TAGS} specFacetOptions={specFacetOptions} />

        <div className="flex-1 min-w-0">
          {products.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-24 text-center">
              <p className="text-2xl text-slate-400 mb-2">No products found</p>
              <p className="text-slate-500 text-sm">
                {query ? 'Try a different search term or clear your filters.' : 'Try adjusting your filters.'}
              </p>
            </div>
          ) : (
            <>
              <div className="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-4">
                {pageProducts.map((p) => (
                  <ProductCard key={p.id} product={p} />
                ))}
              </div>

              {totalPages > 1 && (
                <nav aria-label="Pagination" className="flex items-center justify-center gap-2 mt-10">
                  <Link
                    href={pageHref(page - 1, params)}
                    aria-disabled={page <= 1}
                    tabIndex={page <= 1 ? -1 : undefined}
                    className={`inline-flex items-center justify-center w-10 h-10 rounded-xl border border-slate-200 text-slate-600 hover:border-blue-300 hover:text-blue-600 transition-colors ${page <= 1 ? 'pointer-events-none opacity-40' : ''}`}
                  >
                    <ChevronLeft size={18} />
                    <span className="sr-only">Previous page</span>
                  </Link>

                  {Array.from({ length: totalPages }, (_, i) => i + 1)
                    .filter((p) => p === 1 || p === totalPages || Math.abs(p - page) <= 1)
                    .map((p, i, arr) => (
                      <span key={p} className="flex items-center gap-2">
                        {i > 0 && arr[i - 1] !== p - 1 && <span className="text-slate-400 px-1">…</span>}
                        <Link
                          href={pageHref(p, params)}
                          aria-current={p === page ? 'page' : undefined}
                          className={`inline-flex items-center justify-center w-10 h-10 rounded-xl text-sm font-medium transition-colors ${
                            p === page
                              ? 'bg-blue-600 text-white shadow-sm shadow-blue-600/30'
                              : 'border border-slate-200 text-slate-600 hover:border-blue-300 hover:text-blue-600'
                          }`}
                        >
                          {p}
                        </Link>
                      </span>
                    ))}

                  <Link
                    href={pageHref(page + 1, params)}
                    aria-disabled={page >= totalPages}
                    tabIndex={page >= totalPages ? -1 : undefined}
                    className={`inline-flex items-center justify-center w-10 h-10 rounded-xl border border-slate-200 text-slate-600 hover:border-blue-300 hover:text-blue-600 transition-colors ${page >= totalPages ? 'pointer-events-none opacity-40' : ''}`}
                  >
                    <ChevronRight size={18} />
                    <span className="sr-only">Next page</span>
                  </Link>
                </nav>
              )}
            </>
          )}
        </div>
      </div>
    </div>
  )
}
