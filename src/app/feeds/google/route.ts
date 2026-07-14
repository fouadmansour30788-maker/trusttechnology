import { getProducts } from '@/lib/db'
import { SITE_URL } from '@/lib/site'

export const runtime = 'nodejs'
export const dynamic = 'force-dynamic'

/**
 * Google Merchant Center product feed (TSV). Register in Merchant Center as a
 * scheduled fetch: https://trusttechnology.vercel.app/feeds/google
 */
function tsv(field: string): string {
  return field.replace(/[\t\r\n]+/g, ' ').trim()
}

export async function GET() {
  const products = (await getProducts()).filter((p) => p.is_active && p.price > 0)

  const header = ['id', 'title', 'description', 'link', 'image_link', 'condition', 'availability', 'price', 'brand']
  const rows = products.map((p) => {
    const brand = p.tags?.find((t) => t.type === 'brand')?.name ?? 'Trust Technology'
    const image = p.images[0] ? (p.images[0].startsWith('http') ? p.images[0] : `${SITE_URL}${p.images[0]}`) : ''
    const specs = Object.entries(p.specs ?? {}).slice(0, 5).map(([k, v]) => `${k}: ${v}`).join(' · ')
    return [
      tsv(p.sku || p.slug),
      tsv(p.name.slice(0, 150)),
      tsv((p.description || specs || p.name).slice(0, 4900)),
      `${SITE_URL}/products/${p.slug}`,
      image,
      'new',
      p.stock > 0 ? 'in_stock' : 'out_of_stock',
      `${Number(p.price).toFixed(2)} USD`,
      tsv(brand),
    ].join('\t')
  })

  return new Response([header.join('\t'), ...rows].join('\n'), {
    headers: {
      'Content-Type': 'text/tab-separated-values; charset=utf-8',
      'Cache-Control': 's-maxage=3600, stale-while-revalidate=7200',
    },
  })
}
