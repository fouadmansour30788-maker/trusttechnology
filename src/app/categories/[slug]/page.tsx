import { notFound } from 'next/navigation'
import Link from 'next/link'
import type { Metadata } from 'next'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import { FilterSidebar } from '@/components/products/FilterSidebar'
import { ProductCard } from '@/components/products/ProductCard'
import { PageHeader } from '@/components/ui/PageHeader'
import { getProducts, getCategories } from '@/lib/db'
import { getBestPriceIds, withBestPrice } from '@/lib/best-price'
import { getReviewStatsMap, withReviewStats } from '@/lib/reviews'
import { SPEC_FACETS, facetOptions, parseSpecParam, matchesSpecFilters } from '@/lib/spec-facets'
import { canonicalFor } from '@/lib/site'
import type { Product, Tag } from '@/lib/types'

type SearchParams = { tags?: string; specs?: string; sort?: string; page?: string }
type Props = {
  params: Promise<{ slug: string }>
  searchParams: Promise<SearchParams>
}

export const dynamic = 'force-dynamic'

// Same fix as /products: a category could match most of the catalog (e.g.
// "laptops" matched ~320 products, 1.5MB in one response) with no
// pagination at all. 48 divides evenly into the 2/3/4-column grid.
const PAGE_SIZE = 48

function pageHref(slug: string, page: number, params: SearchParams): string {
  const sp = new URLSearchParams()
  if (params.tags) sp.set('tags', params.tags)
  if (params.specs) sp.set('specs', params.specs)
  if (params.sort) sp.set('sort', params.sort)
  if (page > 1) sp.set('page', String(page))
  const qs = sp.toString()
  return `/categories/${slug}${qs ? `?${qs}` : ''}`
}

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

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }): Promise<Metadata> {
  const { slug } = await params
  const label = CATEGORY_LABELS[slug] ?? slug.replace(/-/g, ' ')
  const description = `Shop ${label} at Trust Technology — genuine products, honest pricing and expert support in Tripoli, Lebanon.`
  const url = canonicalFor(`/categories/${slug}`)
  return {
    title: label,
    description,
    alternates: { canonical: url },
    openGraph: { title: label, description, url },
  }
}

export default async function CategoryPage({ params, searchParams }: Props) {
  const { slug } = await params
  const sp = await searchParams
  const { tags: tagFilter, specs: specFilter, sort } = sp
  const selectedTags = tagFilter?.split(',').filter(Boolean) ?? []
  const selectedSpecs = parseSpecParam(specFilter)

  const [fetched, categories, bestIds, reviewStats] = await Promise.all([getProducts(), getCategories(), getBestPriceIds(), getReviewStatsMap()])
  const all = withReviewStats(withBestPrice(fetched, bestIds), reviewStats)

  // A bogus/unknown slug should 404, not render an empty "0 products" page
  // at 200 — that's distinct from a *real* category that simply has no
  // products matching the current filters, which stays 200 (correct,
  // expected e-commerce behavior).
  const isKnownCategory = slug === 'apple' || (
    categories.length ? categories.some((c) => c.slug === slug) : (slug in CATEGORY_LABELS || slug in PARENT_TO_CHILDREN)
  )
  if (!isKnownCategory) notFound()

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

  const totalPages = Math.max(1, Math.ceil(products.length / PAGE_SIZE))
  const page = Math.min(Math.max(1, Number(sp.page) || 1), totalPages)
  const pageProducts = products.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE)

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
            <>
              <div className="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-4">
                {pageProducts.map((p) => (
                  <ProductCard key={p.id} product={p} />
                ))}
              </div>

              {totalPages > 1 && (
                <nav aria-label="Pagination" className="flex items-center justify-center gap-2 mt-10">
                  <Link
                    href={pageHref(slug, page - 1, sp)}
                    aria-disabled={page <= 1}
                    tabIndex={page <= 1 ? -1 : undefined}
                    className={`inline-flex items-center justify-center w-11 h-11 rounded-xl border border-slate-200 text-slate-600 hover:border-blue-300 hover:text-blue-600 transition-colors ${page <= 1 ? 'pointer-events-none opacity-40' : ''}`}
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
                          href={pageHref(slug, p, sp)}
                          aria-current={p === page ? 'page' : undefined}
                          className={`inline-flex items-center justify-center w-11 h-11 rounded-xl text-sm font-medium transition-colors ${
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
                    href={pageHref(slug, page + 1, sp)}
                    aria-disabled={page >= totalPages}
                    tabIndex={page >= totalPages ? -1 : undefined}
                    className={`inline-flex items-center justify-center w-11 h-11 rounded-xl border border-slate-200 text-slate-600 hover:border-blue-300 hover:text-blue-600 transition-colors ${page >= totalPages ? 'pointer-events-none opacity-40' : ''}`}
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
