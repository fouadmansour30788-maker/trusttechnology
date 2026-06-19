import 'server-only'
import { createClient } from '@/lib/supabase/server'
import { CATALOG_PRODUCTS } from '@/data/products'
import type { Product, Tag, Category } from '@/lib/types'

/** True when real Supabase credentials are present (not the placeholder). */
export function isSupabaseConfigured(): boolean {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  return Boolean(url && key && !url.includes('your-project') && url.startsWith('http'))
}

type Row = Record<string, unknown> & {
  product_tags?: { tag: Tag }[]
  priceOnRequest?: boolean
}

function normalize(row: Row): Product {
  const tags = (row.product_tags ?? []).map((pt) => pt.tag).filter(Boolean)
  return {
    ...(row as unknown as Product),
    tags,
    priceOnRequest: (row.price as number) === 0,
  }
}

/** Catalog products. `adminView` includes inactive items. */
export async function getProducts(opts: { adminView?: boolean } = {}): Promise<Product[]> {
  if (!isSupabaseConfigured()) return CATALOG_PRODUCTS
  try {
    const supabase = await createClient()
    let q = supabase
      .from('products')
      .select('*, product_tags(tag:tags(*))')
      .order('created_at', { ascending: false })
    if (!opts.adminView) q = q.eq('is_active', true)
    const { data, error } = await q
    if (error || !data) return CATALOG_PRODUCTS
    return (data as Row[]).map(normalize)
  } catch {
    return CATALOG_PRODUCTS
  }
}

export async function getProductBySlug(slug: string): Promise<Product | null> {
  if (!isSupabaseConfigured()) return CATALOG_PRODUCTS.find((p) => p.slug === slug) ?? null
  try {
    const supabase = await createClient()
    const { data } = await supabase
      .from('products')
      .select('*, product_tags(tag:tags(*))')
      .eq('slug', slug)
      .maybeSingle()
    return data ? normalize(data as Row) : null
  } catch {
    return CATALOG_PRODUCTS.find((p) => p.slug === slug) ?? null
  }
}

export async function getProductById(id: string): Promise<Product | null> {
  if (!isSupabaseConfigured()) return CATALOG_PRODUCTS.find((p) => p.id === id) ?? null
  const supabase = await createClient()
  const { data } = await supabase
    .from('products')
    .select('*, product_tags(tag:tags(*))')
    .eq('id', id)
    .maybeSingle()
  return data ? normalize(data as Row) : null
}

export async function getCategories(): Promise<Category[]> {
  if (!isSupabaseConfigured()) return []
  try {
    const supabase = await createClient()
    const { data } = await supabase.from('categories').select('*').order('sort_order')
    return (data as Category[]) ?? []
  } catch {
    return []
  }
}

export async function getTags(): Promise<Tag[]> {
  if (!isSupabaseConfigured()) return []
  try {
    const supabase = await createClient()
    const { data } = await supabase.from('tags').select('*').order('type').order('name')
    return (data as Tag[]) ?? []
  } catch {
    return []
  }
}

/** Dashboard counts for the admin home. */
export async function getAdminStats() {
  const fallback = {
    products: CATALOG_PRODUCTS.length,
    active: CATALOG_PRODUCTS.filter((p) => p.is_active).length,
    outOfStock: CATALOG_PRODUCTS.filter((p) => p.stock === 0).length,
    callForPrice: CATALOG_PRODUCTS.filter((p) => p.priceOnRequest || p.price === 0).length,
  }
  if (!isSupabaseConfigured()) return fallback
  try {
    const supabase = await createClient()
    const all = await supabase.from('products').select('id, is_active, stock, price')
    const rows = all.data ?? []
    return {
      products: rows.length,
      active: rows.filter((r) => r.is_active).length,
      outOfStock: rows.filter((r) => r.stock === 0).length,
      callForPrice: rows.filter((r) => r.price === 0).length,
    }
  } catch {
    return fallback
  }
}
