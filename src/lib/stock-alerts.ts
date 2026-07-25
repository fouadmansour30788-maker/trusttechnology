import 'server-only'
import type { SupabaseClient } from '@supabase/supabase-js'
import { SITE_URL } from '@/lib/site'

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type AnyClient = SupabaseClient<any, any, any>

/**
 * Emails pending stock_alerts subscribers when a product comes back in stock
 * or gets (re)priced / drops in price. Called from admin/actions.ts after a
 * product save, with the pre-update stock/price so we can detect the
 * transition. Best-effort: never throws, never blocks the save — if
 * RESEND_API_KEY isn't configured, or a send fails, it silently no-ops
 * (a failed send leaves notified_at null so the next save retries it).
 */
export async function notifyStockPriceAlerts(
  supabase: AnyClient,
  productId: string,
  productName: string,
  productSlug: string,
  prevStock: number,
  newStock: number,
  prevPrice: number,
  newPrice: number
): Promise<void> {
  const restocked = prevStock <= 0 && newStock > 0
  const nowPriced = prevPrice <= 0 && newPrice > 0
  const priceDropped = prevPrice > 0 && newPrice > 0 && newPrice < prevPrice
  if (!restocked && !nowPriced && !priceDropped) return

  const kinds = [restocked && 'restock', (nowPriced || priceDropped) && 'price_drop'].filter(Boolean) as string[]
  if (kinds.length === 0) return

  const resendKey = process.env.RESEND_API_KEY
  if (!resendKey) return

  try {
    const { data } = await supabase
      .from('stock_alerts')
      .select('id, email, kind')
      .eq('product_id', productId)
      .in('kind', kinds)
      .is('notified_at', null)

    const alerts = (data as { id: string; email: string; kind: string }[]) ?? []
    if (alerts.length === 0) return

    const link = `${SITE_URL}/products/${productSlug}`
    for (const a of alerts) {
      const subject =
        a.kind === 'restock' ? `Back in stock: ${productName}`
        : nowPriced ? `Now priced: ${productName}`
        : `Price drop: ${productName}`
      const text =
        a.kind === 'restock' ? `${productName} is back in stock at Trust Technology.\n\n${link}`
        : nowPriced ? `${productName} now has a price: $${newPrice.toLocaleString()}.\n\n${link}`
        : `${productName} dropped in price: $${prevPrice.toLocaleString()} → $${newPrice.toLocaleString()}.\n\n${link}`

      try {
        await fetch('https://api.resend.com/emails', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${resendKey}` },
          body: JSON.stringify({ from: 'Trust Technology <onboarding@resend.dev>', to: [a.email], subject, text }),
        })
        await supabase.from('stock_alerts').update({ notified_at: new Date().toISOString() }).eq('id', a.id)
      } catch {
        // leave notified_at null — retried on the next relevant save
      }
    }
  } catch {
    // best-effort — never let alerting break a product save
  }
}
