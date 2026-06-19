import type { Product } from './types'

export type UserRole = 'business' | 'student'
export type BusinessIndustry = 'retail' | 'office' | 'tech'
export type BusinessPainPoint = 'speed' | 'portability' | 'pos'
export type StudentMajor = 'engineering' | 'architecture' | 'arts' | 'business' | 'cs'
export type StudentNeed = 'rendering' | 'coding' | 'battery' | 'design'

export type UserProfile = {
  role: UserRole
  // Business path
  industry?: BusinessIndustry
  pain_point?: BusinessPainPoint
  // Student path
  major?: StudentMajor
  needs?: StudentNeed[]
  // Common
  budget: number
  accessories: string[]
}

// Maps profile inputs → required tag slugs
const ROLE_TAGS: Record<UserRole, string[]> = {
  business: ['business'],
  student: ['student'],
}

const MAJOR_TAGS: Record<StudentMajor, string[]> = {
  engineering: ['high-performance', 'business'],
  architecture: ['high-performance', 'dedicated-gpu'],
  arts: ['creative', 'display'],
  business: ['student', 'business'],
  cs: ['high-performance', 'coding'],
}

const NEED_TAGS: Record<StudentNeed, string[]> = {
  rendering: ['high-performance', 'dedicated-gpu'],
  coding: ['high-performance'],
  battery: ['long-battery'],
  design: ['creative', 'display'],
}

const INDUSTRY_TAGS: Record<BusinessIndustry, string[]> = {
  retail: ['pos', 'business'],
  office: ['business'],
  tech: ['high-performance', 'business'],
}

const PAIN_TAGS: Record<BusinessPainPoint, string[]> = {
  speed: ['high-performance'],
  portability: ['ultrabook'],
  pos: ['pos'],
}

export function buildRequiredTags(profile: UserProfile): string[] {
  const tags = new Set<string>()

  ROLE_TAGS[profile.role].forEach((t) => tags.add(t))

  if (profile.role === 'student') {
    if (profile.major) MAJOR_TAGS[profile.major].forEach((t) => tags.add(t))
    profile.needs?.forEach((n) => NEED_TAGS[n].forEach((t) => tags.add(t)))
  } else {
    if (profile.industry) INDUSTRY_TAGS[profile.industry].forEach((t) => tags.add(t))
    if (profile.pain_point) PAIN_TAGS[profile.pain_point].forEach((t) => tags.add(t))
  }

  return Array.from(tags)
}

export function scoreProduct(product: Product, requiredTags: string[]): number {
  const productTagSlugs = (product.tags ?? []).map((t) => t.slug)
  const matches = requiredTags.filter((t) => productTagSlugs.includes(t))
  return matches.length
}

export function filterAndRankProducts(
  products: Product[],
  profile: UserProfile
): Product[] {
  const required = buildRequiredTags(profile)
  const withinBudget = products.filter(
    (p) => p.price <= profile.budget && p.is_active && p.stock > 0
  )
  return withinBudget
    .map((p) => ({ product: p, score: scoreProduct(p, required) }))
    .filter(({ score }) => score > 0)
    .sort((a, b) => b.score - a.score)
    .map(({ product }) => product)
    .slice(0, 4)
}

export function buildWhyExplanation(product: Product, profile: UserProfile): string {
  const tagNames = (product.tags ?? []).map((t) => t.name)

  if (profile.role === 'student') {
    const majorLabel = profile.major
      ? { engineering: 'Engineering', architecture: 'Architecture', arts: 'Arts & Design', business: 'Business', cs: 'Computer Science' }[profile.major]
      : 'your studies'

    const needLabel = profile.needs?.includes('rendering')
      ? ' who needs a dedicated GPU for 3D rendering'
      : profile.needs?.includes('coding')
      ? ' who needs high performance for development'
      : profile.needs?.includes('battery')
      ? ' who needs all-day battery life'
      : profile.needs?.includes('design')
      ? ' working with creative and design tools'
      : ''

    return `Recommended because you're a ${majorLabel} student${needLabel}. Matched on: ${tagNames.slice(0, 3).join(', ')}.`
  }

  const industryLabel = profile.industry
    ? { retail: 'retail', office: 'office work', tech: 'tech' }[profile.industry]
    : 'your business'

  const painLabel = profile.pain_point
    ? { speed: 'speed & performance', portability: 'portability', pos: 'POS integration' }[profile.pain_point]
    : 'your needs'

  return `Matched for ${industryLabel} — optimized for ${painLabel}. Matched on: ${tagNames.slice(0, 3).join(', ')}.`
}

// --- Mock product catalog (replace with Supabase query) ---
export const CATALOG: Product[] = [
  {
    id: 'p1', name: 'ASUS ProArt Studiobook 16 OLED', slug: 'asus-proart-studiobook-16',
    description: 'RTX 4060, Intel i9, 32GB RAM — built for creators and architects.',
    price: 2199, compare_at_price: 2499, primary_category_id: null,
    images: [], stock: 3, sku: 'ASUS-PROART-16',
    is_active: true, is_featured: true,
    specs: { GPU: 'NVIDIA RTX 4060', CPU: 'Intel Core i9-13980HX', RAM: '32GB DDR5', Display: '16" 3.2K OLED 120Hz' },
    created_at: '', updated_at: '',
    tags: [
      { id: 'x1', name: 'Asus', slug: 'asus', type: 'brand' },
      { id: 'x2', name: 'High Performance', slug: 'high-performance', type: 'use_case' },
      { id: 'x3', name: 'Dedicated GPU', slug: 'dedicated-gpu', type: 'use_case' },
      { id: 'x4', name: 'Creative', slug: 'creative', type: 'use_case' },
    ],
  },
  {
    id: 'p2', name: 'Dell Latitude 5540 Business', slug: 'dell-latitude-5540',
    description: 'Intel i7-1365U, 16GB RAM, 512GB SSD — reliable business workhorse.',
    price: 1299, compare_at_price: 1499, primary_category_id: null,
    images: [], stock: 8, sku: 'DELL-5540-I7',
    is_active: true, is_featured: true,
    specs: { CPU: 'Intel i7-1365U', RAM: '16GB', Storage: '512GB SSD', Battery: '12h' },
    created_at: '', updated_at: '',
    tags: [
      { id: 'x5', name: 'Dell', slug: 'dell', type: 'brand' },
      { id: 'x6', name: 'Business', slug: 'business', type: 'use_case' },
      { id: 'x7', name: 'High Performance', slug: 'high-performance', type: 'use_case' },
    ],
  },
  {
    id: 'p3', name: 'Apple MacBook Air M3 15"', slug: 'macbook-air-m3-15',
    description: 'Apple M3 chip, 18-hour battery, 16GB RAM — perfect ultrabook.',
    price: 1749, compare_at_price: null, primary_category_id: null,
    images: [], stock: 4, sku: 'APPLE-MBA-M3',
    is_active: true, is_featured: true,
    specs: { Chip: 'Apple M3', RAM: '16GB', Battery: '18h', Display: '15.3" Liquid Retina' },
    created_at: '', updated_at: '',
    tags: [
      { id: 'x8', name: 'Apple', slug: 'apple', type: 'brand' },
      { id: 'x9', name: 'Ultrabook', slug: 'ultrabook', type: 'use_case' },
      { id: 'x10', name: 'Long Battery', slug: 'long-battery', type: 'use_case' },
      { id: 'x11', name: 'Student', slug: 'student', type: 'use_case' },
      { id: 'x12', name: 'Business', slug: 'business', type: 'use_case' },
    ],
  },
  {
    id: 'p4', name: 'ASUS ROG Strix G16 Gaming', slug: 'asus-rog-strix-g16',
    description: 'RTX 4070, AMD Ryzen 9, 16GB RAM — engineering & gaming powerhouse.',
    price: 1899, compare_at_price: 2099, primary_category_id: null,
    images: [], stock: 2, sku: 'ASUS-ROG-G16',
    is_active: true, is_featured: false,
    specs: { GPU: 'NVIDIA RTX 4070', CPU: 'AMD Ryzen 9 7945HX', RAM: '16GB DDR5', Storage: '1TB SSD' },
    created_at: '', updated_at: '',
    tags: [
      { id: 'x13', name: 'Asus', slug: 'asus', type: 'brand' },
      { id: 'x14', name: 'Gaming', slug: 'gaming', type: 'use_case' },
      { id: 'x15', name: 'High Performance', slug: 'high-performance', type: 'use_case' },
      { id: 'x16', name: 'Dedicated GPU', slug: 'dedicated-gpu', type: 'use_case' },
      { id: 'x17', name: 'Student', slug: 'student', type: 'use_case' },
    ],
  },
  {
    id: 'p5', name: 'Lenovo ThinkPad X1 Carbon Gen 11', slug: 'thinkpad-x1-carbon-g11',
    description: 'Ultra-light 1.12kg, Intel i7, vPro — the executive travel laptop.',
    price: 1649, compare_at_price: 1899, primary_category_id: null,
    images: [], stock: 5, sku: 'LEN-X1C-G11',
    is_active: true, is_featured: false,
    specs: { CPU: 'Intel i7-1365U vPro', RAM: '16GB', Weight: '1.12kg', Battery: '15h' },
    created_at: '', updated_at: '',
    tags: [
      { id: 'x18', name: 'Lenovo', slug: 'lenovo', type: 'brand' },
      { id: 'x19', name: 'Business', slug: 'business', type: 'use_case' },
      { id: 'x20', name: 'Ultrabook', slug: 'ultrabook', type: 'use_case' },
      { id: 'x21', name: 'Long Battery', slug: 'long-battery', type: 'use_case' },
    ],
  },
  {
    id: 'p6', name: 'HP EliteBook 840 G10', slug: 'hp-elitebook-840-g10',
    description: 'Intel i7, 16GB, military-grade durability — field & office ready.',
    price: 1399, compare_at_price: 1599, primary_category_id: null,
    images: [], stock: 6, sku: 'HP-EB-840-G10',
    is_active: true, is_featured: false,
    specs: { CPU: 'Intel i7-1355U', RAM: '16GB', Build: 'MIL-STD-810H', Battery: '12h' },
    created_at: '', updated_at: '',
    tags: [
      { id: 'x22', name: 'HP', slug: 'hp', type: 'brand' },
      { id: 'x23', name: 'Business', slug: 'business', type: 'use_case' },
      { id: 'x24', name: 'High Performance', slug: 'high-performance', type: 'use_case' },
    ],
  },
  {
    id: 'p7', name: 'MacBook Pro M3 Pro 14"', slug: 'macbook-pro-m3-pro-14',
    description: 'M3 Pro chip, 18GB unified RAM — pro-level creative performance.',
    price: 2399, compare_at_price: null, primary_category_id: null,
    images: [], stock: 3, sku: 'APPLE-MBP-M3PRO',
    is_active: true, is_featured: true,
    specs: { Chip: 'Apple M3 Pro', RAM: '18GB Unified', Display: '14.2" Liquid Retina XDR', Battery: '18h' },
    created_at: '', updated_at: '',
    tags: [
      { id: 'x25', name: 'Apple', slug: 'apple', type: 'brand' },
      { id: 'x26', name: 'High Performance', slug: 'high-performance', type: 'use_case' },
      { id: 'x27', name: 'Creative', slug: 'creative', type: 'use_case' },
      { id: 'x28', name: 'Dedicated GPU', slug: 'dedicated-gpu', type: 'use_case' },
      { id: 'x29', name: 'Student', slug: 'student', type: 'use_case' },
    ],
  },
  {
    id: 'p8', name: 'HP Pavilion 15 Student Edition', slug: 'hp-pavilion-15-student',
    description: 'Intel i5, 8GB RAM, 512GB SSD — best value for everyday students.',
    price: 649, compare_at_price: 799, primary_category_id: null,
    images: [], stock: 12, sku: 'HP-PAV-15-STU',
    is_active: true, is_featured: false,
    specs: { CPU: 'Intel Core i5-1335U', RAM: '8GB', Storage: '512GB SSD', Battery: '10h' },
    created_at: '', updated_at: '',
    tags: [
      { id: 'x30', name: 'HP', slug: 'hp', type: 'brand' },
      { id: 'x31', name: 'Student', slug: 'student', type: 'use_case' },
      { id: 'x32', name: 'Long Battery', slug: 'long-battery', type: 'use_case' },
    ],
  },
]

// Accessory suggestions based on profile
export type AccessorySuggestion = { id: string; name: string; price: number; emoji: string }

export function suggestAccessories(profile: UserProfile): AccessorySuggestion[] {
  const all: AccessorySuggestion[] = [
    { id: 'bag', name: 'Laptop Bag', price: 49, emoji: '🎒' },
    { id: 'mouse', name: 'Wireless Mouse', price: 35, emoji: '🖱️' },
    { id: 'keyboard', name: 'Mechanical Keyboard', price: 89, emoji: '⌨️' },
    { id: 'monitor', name: 'External Monitor', price: 229, emoji: '🖥️' },
    { id: 'hub', name: 'USB-C Hub', price: 45, emoji: '🔌' },
    { id: 'headset', name: 'Noise-Cancelling Headset', price: 79, emoji: '🎧' },
  ]

  if (profile.role === 'student' && profile.major === 'architecture') {
    return all.filter((a) => ['mouse', 'monitor', 'hub'].includes(a.id))
  }
  if (profile.role === 'student') {
    return all.filter((a) => ['bag', 'mouse', 'hub'].includes(a.id))
  }
  if (profile.pain_point === 'pos') {
    return []
  }
  return all.filter((a) => ['bag', 'mouse', 'keyboard'].includes(a.id))
}
