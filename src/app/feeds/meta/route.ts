import { getProducts } from '@/lib/db'
import { SITE_URL } from '@/lib/site'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/**
 * Meta (Facebook/Instagram) Commerce catalog feed — CSV per
 * https://www.facebook.com/business/help/120325381656392
 * Add this URL as a scheduled data feed in Commerce Manager:
 *   https://trusttechnology.vercel.app/feeds/meta
 * Only priced, active products are listed (Meta requires a price).
 */

function csv(field: string | number): string {
  const s = String(field).replace(/\r?\n/g, ' ').trim()
  return `"${s.replace(/"/g, '""')}"`
}

export async function GET() {
  const products = (await getProducts()).filter((p) => p.is_active && p.price > 0)

  const header = ['id', 'title', 'description', 'availability', 'condition', 'price', 'link', 'image_link', 'brand']
  const rows = products.map((p) => {
    const brand = p.tags?.find((t) => t.type === 'brand')?.name ?? 'Trust Technology'
    const image = p.images[0] ? (p.images[0].startsWith('http') ? p.images[0] : `${SITE_URL}${p.images[0]}`) : ''
    const specs = Object.entries(p.specs ?? {}).slice(0, 5).map(([k, v]) => `${k}: ${v}`).join(' · ')
    const description = (p.description || specs || p.name).slice(0, 4900)
    return [
      csv(p.sku || p.slug),
      csv(p.name.slice(0, 150)),
      csv(description),
      csv(p.stock > 0 ? 'in stock' : 'out of stock'),
      csv('new'),
      csv(`${Number(p.price).toFixed(2)} USD`),
      csv(`${SITE_URL}/products/${p.slug}`),
      csv(image),
      csv(brand),
    ].join(',')
  })

  return new Response([header.join(','), ...rows].join('\n'), {
    headers: {
      'Content-Type': 'text/csv; charset=utf-8',
      'Cache-Control': 's-maxage=3600, stale-while-revalidate=7200',
    },
  })
}
