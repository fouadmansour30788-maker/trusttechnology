import { FilterSidebar } from '@/components/products/FilterSidebar'
import { ProductCard } from '@/components/products/ProductCard'
import type { Product, Tag } from '@/lib/types'

type Props = {
  params: Promise<{ slug: string }>
  searchParams: Promise<{ tags?: string; sort?: string; q?: string }>
}

// Mock tags — replace with Supabase query
const ALL_TAGS: Tag[] = [
  { id: '1', name: 'Apple', slug: 'apple', type: 'brand' },
  { id: '2', name: 'Dell', slug: 'dell', type: 'brand' },
  { id: '3', name: 'HP', slug: 'hp', type: 'brand' },
  { id: '4', name: 'Lenovo', slug: 'lenovo', type: 'brand' },
  { id: '5', name: 'Asus', slug: 'asus', type: 'brand' },
  { id: '6', name: 'Samsung', slug: 'samsung', type: 'brand' },
  { id: '7', name: 'Gaming', slug: 'gaming', type: 'use_case' },
  { id: '8', name: 'Business', slug: 'business', type: 'use_case' },
  { id: '9', name: 'Student', slug: 'student', type: 'use_case' },
  { id: '10', name: 'Home Office', slug: 'home-office', type: 'use_case' },
  { id: '11', name: 'Laptop', slug: 'laptop', type: 'type' },
  { id: '12', name: 'Desktop', slug: 'desktop', type: 'type' },
  { id: '13', name: 'Monitor', slug: 'monitor', type: 'type' },
  { id: '14', name: 'Printer', slug: 'printer', type: 'type' },
]

// Mock products — replace with Supabase query filtered by category slug + tags + sort
function getMockProducts(slug: string): Product[] {
  return [
    {
      id: '1', name: 'Dell Latitude 5540', slug: 'dell-latitude-5540',
      description: null, price: 1299, compare_at_price: 1499,
      primary_category_id: null, images: [], stock: 5,
      sku: null, is_active: true, is_featured: false,
      specs: {}, created_at: '', updated_at: '',
      tags: [
        { id: '2', name: 'Dell', slug: 'dell', type: 'brand' },
        { id: '8', name: 'Business', slug: 'business', type: 'use_case' },
      ],
    },
    {
      id: '2', name: 'Lenovo ThinkPad X1 Carbon', slug: 'lenovo-thinkpad-x1',
      description: null, price: 1549, compare_at_price: null,
      primary_category_id: null, images: [], stock: 3,
      sku: null, is_active: true, is_featured: false,
      specs: {}, created_at: '', updated_at: '',
      tags: [
        { id: '4', name: 'Lenovo', slug: 'lenovo', type: 'brand' },
        { id: '8', name: 'Business', slug: 'business', type: 'use_case' },
      ],
    },
    {
      id: '3', name: 'ASUS ROG Strix G16 Gaming', slug: 'asus-rog-strix-g16',
      description: null, price: 1899, compare_at_price: 2099,
      primary_category_id: null, images: [], stock: 2,
      sku: null, is_active: true, is_featured: false,
      specs: {}, created_at: '', updated_at: '',
      tags: [
        { id: '5', name: 'Asus', slug: 'asus', type: 'brand' },
        { id: '7', name: 'Gaming', slug: 'gaming', type: 'use_case' },
      ],
    },
    {
      id: '4', name: 'HP Pavilion 15 Student', slug: 'hp-pavilion-15',
      description: null, price: 699, compare_at_price: 799,
      primary_category_id: null, images: [], stock: 10,
      sku: null, is_active: true, is_featured: false,
      specs: {}, created_at: '', updated_at: '',
      tags: [
        { id: '3', name: 'HP', slug: 'hp', type: 'brand' },
        { id: '9', name: 'Student', slug: 'student', type: 'use_case' },
      ],
    },
    {
      id: '5', name: 'Apple MacBook Air M3', slug: 'macbook-air-m3',
      description: null, price: 1299, compare_at_price: null,
      primary_category_id: null, images: [], stock: 6,
      sku: null, is_active: true, is_featured: false,
      specs: {}, created_at: '', updated_at: '',
      tags: [
        { id: '1', name: 'Apple', slug: 'apple', type: 'brand' },
      ],
    },
  ]
}

const CATEGORY_LABELS: Record<string, string> = {
  computing: 'Computing', laptops: 'Laptops', desktops: 'Desktops',
  peripherals: 'Peripherals & Accessories', displays: 'Displays & Vision',
  printing: 'Printing & Consumables', professional: 'Professional Solutions',
  apple: 'Apple Collection', monitors: 'Monitors', storage: 'Storage',
  networking: 'Networking', 'pos-systems': 'POS Systems',
}

export default async function CategoryPage({ params, searchParams }: Props) {
  const { slug } = await params
  const { tags: tagFilter, sort } = await searchParams

  const selectedTags = tagFilter?.split(',').filter(Boolean) ?? []
  let products = getMockProducts(slug)

  if (selectedTags.length > 0) {
    products = products.filter((p) =>
      p.tags?.some((t) => selectedTags.includes(t.slug))
    )
  }

  if (sort === 'price_asc') products.sort((a, b) => a.price - b.price)
  if (sort === 'price_desc') products.sort((a, b) => b.price - a.price)

  const label = CATEGORY_LABELS[slug] ?? slug

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      {/* Header */}
      <div className="mb-8">
        <p className="text-xs uppercase tracking-widest text-blue-600 font-semibold mb-1">Browse</p>
        <h1 className="text-3xl font-bold text-slate-900">{label}</h1>
        <p className="text-slate-500 mt-1">{products.length} products</p>
      </div>

      <div className="flex gap-8">
        <FilterSidebar tags={ALL_TAGS} />

        <div className="flex-1 min-w-0">
          {products.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-24 text-center">
              <p className="text-2xl text-slate-400 mb-2">No products found</p>
              <p className="text-slate-500 text-sm">Try adjusting your filters</p>
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
