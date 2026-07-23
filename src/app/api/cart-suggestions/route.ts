import { NextResponse } from 'next/server'
import { getProducts } from '@/lib/db'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/**
 * "You might also need" cart suggestions. No AI call — a simple, fast
 * heuristic: prefer in-stock, priced, featured products from a DIFFERENT
 * category than what's already in the cart (complementary, not more of the
 * same), falling back to any featured items if that's too narrow.
 */
export async function GET(req: Request) {
  const { searchParams } = new URL(req.url)
  const exclude = new Set((searchParams.get('exclude') ?? '').split(',').filter(Boolean))
  const cartCategories = new Set((searchParams.get('categories') ?? '').split(',').filter(Boolean))

  const all = await getProducts()
  const pool = all.filter((p) => p.is_active && p.stock > 0 && p.price > 0 && !exclude.has(p.id))

  const complementary = cartCategories.size > 0
    ? pool.filter((p) => !p.primary_category_id || !cartCategories.has(p.primary_category_id))
    : pool
  const source = complementary.length >= 3 ? complementary : pool

  const sorted = [...source].sort((a, b) => Number(b.is_featured) - Number(a.is_featured))
  return NextResponse.json({ products: sorted.slice(0, 3) })
}
