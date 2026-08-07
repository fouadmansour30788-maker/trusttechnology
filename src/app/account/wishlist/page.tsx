import { Heart } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'
import { ProductCard } from '@/components/products/ProductCard'
import type { Product } from '@/lib/types'

export const dynamic = 'force-dynamic'

export default async function AccountWishlistPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data } = await supabase
    .from('wishlist_items')
    .select('created_at, product:products(*, product_tags(tag:tags(*)))')
    .eq('auth_user_id', user!.id)
    .order('created_at', { ascending: false })

  type ProductRow = Product & { product_tags?: { tag: NonNullable<Product['tags']>[number] }[] }
  type Row = { product: ProductRow | null }
  const products: Product[] = ((data as unknown as Row[]) ?? [])
    .filter((r): r is { product: ProductRow } => !!r.product)
    .map((r) => ({ ...r.product, tags: (r.product.product_tags ?? []).map((pt) => pt.tag) }))

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">Your wishlist</h1>
      {products.length === 0 ? (
        <div className="bg-white border border-slate-200 rounded-2xl p-10 text-center">
          <Heart size={32} className="text-slate-300 mx-auto mb-3" />
          <p className="text-slate-500 text-sm">Nothing saved yet — tap the heart on any product to add it here.</p>
        </div>
      ) : (
        <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
          {products.map((p) => <ProductCard key={p.id} product={p} />)}
        </div>
      )}
    </div>
  )
}
