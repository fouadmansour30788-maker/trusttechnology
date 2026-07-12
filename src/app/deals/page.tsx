import Link from 'next/link'
import { Flame, ArrowRight } from 'lucide-react'
import { getProducts } from '@/lib/db'
import { getBestPriceIds, withBestPrice } from '@/lib/best-price'
import { ProductCard } from '@/components/products/ProductCard'

export const dynamic = 'force-dynamic'

export const metadata = {
  title: 'Deals & Clearance – Trust Technology',
  description: 'Discounted laptops, desktops, monitors and accessories at Trust Technology, Tripoli — limited-time deals and clearance prices.',
}

export default async function DealsPage() {
  const [fetched, bestIds] = await Promise.all([getProducts(), getBestPriceIds()])
  const all = withBestPrice(fetched, bestIds)

  const deals = all
    .filter((p) => p.is_active && p.price > 0 && p.compare_at_price && Number(p.compare_at_price) > Number(p.price))
    .sort((a, b) => {
      const da = (Number(a.compare_at_price) - a.price) / Number(a.compare_at_price)
      const db = (Number(b.compare_at_price) - b.price) / Number(b.compare_at_price)
      return db - da
    })

  // Best-price items are deals in their own right — show them when no markdowns exist.
  const bestPriced = all.filter((p) => p.is_active && p.bestPrice && !deals.includes(p))

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 py-8">
      <div className="mb-8">
        <p className="text-xs uppercase tracking-widest text-red-600 font-semibold mb-1 flex items-center gap-1">
          <Flame size={13} /> Save now
        </p>
        <h1 className="text-3xl font-bold text-slate-900">Deals & Clearance</h1>
        <p className="text-slate-500 mt-1">
          {deals.length > 0 ? `${deals.length} discounted product${deals.length === 1 ? '' : 's'}` : 'Marked-down and best-priced products'}
        </p>
      </div>

      {deals.length === 0 && bestPriced.length === 0 ? (
        <div className="flex flex-col items-center justify-center py-24 text-center gap-4">
          <Flame size={40} className="text-slate-300" />
          <p className="text-2xl text-slate-400">No active deals right now</p>
          <p className="text-slate-500 text-sm max-w-md">
            Check back soon — or browse the full catalog for today’s prices.
          </p>
          <Link href="/products" className="inline-flex items-center gap-2 text-blue-600 hover:text-blue-700 font-medium text-sm">
            Browse all products <ArrowRight size={14} />
          </Link>
        </div>
      ) : (
        <>
          {deals.length > 0 && (
            <div className="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-4 mb-12">
              {deals.map((p) => <ProductCard key={p.id} product={p} />)}
            </div>
          )}
          {bestPriced.length > 0 && (
            <>
              <h2 className="text-xl font-bold text-slate-900 mb-4">🇱🇧 Best price in Lebanon</h2>
              <p className="text-slate-500 text-sm -mt-3 mb-5">Verified cheaper than other Lebanese stores — checked daily.</p>
              <div className="grid grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-4">
                {bestPriced.map((p) => <ProductCard key={p.id} product={p} />)}
              </div>
            </>
          )}
        </>
      )}
    </div>
  )
}
