'use server'
import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'

async function staffClient() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('unauthorized')
  return supabase
}

/** Link a competitor listing to one of our products (staff decision — sync preserves it). */
export async function confirmMatch(competitor: string, externalId: string, productId: string) {
  const supabase = await staffClient()
  const { error } = await supabase
    .from('competitor_prices')
    .update({ matched_product_id: productId, match_source: 'manual' })
    .eq('competitor', competitor)
    .eq('external_id', externalId)
  if (error) return { error: error.message }
  revalidatePath('/admin/competitors')
  return { ok: true }
}

/**
 * Confirm a match with a staff-corrected price (e.g. the scraped price is
 * for a different bundle/quantity, or was mis-scraped). The override is
 * stored separately from the raw scraped price and used everywhere the
 * listing feeds into comparisons — future syncs keep refreshing the raw
 * price but never touch the override.
 */
export async function confirmMatchWithPrice(competitor: string, externalId: string, productId: string, price: number) {
  if (!Number.isFinite(price) || price <= 0) return { error: 'Enter a valid price.' }
  const supabase = await staffClient()
  const { error } = await supabase
    .from('competitor_prices')
    .update({ matched_product_id: productId, match_source: 'manual', price_override: price })
    .eq('competitor', competitor)
    .eq('external_id', externalId)
  if (error) return { error: error.message }
  revalidatePath('/admin/competitors')
  return { ok: true }
}

/** Clear a price correction, reverting the listing to its raw scraped price. */
export async function clearPriceOverride(competitor: string, externalId: string) {
  const supabase = await staffClient()
  const { error } = await supabase
    .from('competitor_prices')
    .update({ price_override: null })
    .eq('competitor', competitor)
    .eq('external_id', externalId)
  if (error) return { error: error.message }
  revalidatePath('/admin/competitors')
  revalidatePath('/admin/products')
  return { ok: true }
}

/** Mark a suggestion as wrong — the auto-matcher won't re-apply it. */
export async function rejectMatch(competitor: string, externalId: string) {
  const supabase = await staffClient()
  const { error } = await supabase
    .from('competitor_prices')
    .update({ matched_product_id: null, match_source: 'rejected', price_override: null })
    .eq('competitor', competitor)
    .eq('external_id', externalId)
  if (error) return { error: error.message }
  revalidatePath('/admin/competitors')
  return { ok: true }
}

/** Unlink a matched listing (back to auto so a better match can apply later). */
export async function unlinkMatch(competitor: string, externalId: string) {
  const supabase = await staffClient()
  const { error } = await supabase
    .from('competitor_prices')
    .update({ matched_product_id: null, match_source: 'rejected', price_override: null })
    .eq('competitor', competitor)
    .eq('external_id', externalId)
  if (error) return { error: error.message }
  revalidatePath('/admin/competitors')
  return { ok: true }
}

/** Apply a suggested price to a "Call for price" product. */
export async function applySuggestedPrice(productId: string, price: number) {
  if (!Number.isFinite(price) || price <= 0) return { error: 'invalid price' }
  const supabase = await staffClient()
  const { error } = await supabase
    .from('products')
    .update({ price })
    .eq('id', productId)
  if (error) return { error: error.message }
  revalidatePath('/admin/competitors')
  revalidatePath('/admin/products')
  return { ok: true }
}
