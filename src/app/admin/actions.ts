'use server'
import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import { notifyStockPriceAlerts } from '@/lib/stock-alerts'

export type ProductInput = {
  id?: string
  name: string
  slug: string
  description: string | null
  price: number
  compare_at_price: number | null
  primary_category_id: string | null
  stock: number
  sku: string | null
  is_active: boolean
  is_featured: boolean
  specs: Record<string, string>
  images: string[]
  cost: number
  vat_rate: number
  colors: string[]
  tagIds: string[]
}

async function authed() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Not authenticated')
  return supabase
}

function revalidateAll() {
  revalidatePath('/admin/products')
  revalidatePath('/admin')
  revalidatePath('/products')
  revalidatePath('/')
}

export async function saveProduct(input: ProductInput): Promise<{ ok?: true; id?: string; error?: string }> {
  try {
    const supabase = await authed()
    const { tagIds, id, ...fields } = input
    let productId = id

    if (id) {
      const { data: prev } = await supabase.from('products').select('stock, price').eq('id', id).maybeSingle()
      const { error } = await supabase.from('products').update(fields).eq('id', id)
      if (error) return { error: error.message }
      if (prev) {
        // Awaited (not fire-and-forget): this runs in a serverless function,
        // which can be frozen the moment the action returns — an un-awaited
        // call here would silently never complete most of the time.
        await notifyStockPriceAlerts(
          supabase, id, input.name, input.slug,
          Number((prev as { stock: number }).stock), input.stock,
          Number((prev as { price: number }).price), input.price
        )
      }
    } else {
      const { data, error } = await supabase.from('products').insert(fields).select('id').single()
      if (error) return { error: error.message }
      productId = data.id as string
    }

    // Replace tag links
    await supabase.from('product_tags').delete().eq('product_id', productId!)
    if (tagIds.length) {
      await supabase.from('product_tags').insert(tagIds.map((tag_id) => ({ product_id: productId, tag_id })))
    }

    revalidateAll()
    return { ok: true, id: productId }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Save failed' }
  }
}

export async function deleteProduct(id: string): Promise<{ ok?: true; error?: string }> {
  try {
    const supabase = await authed()
    const { error } = await supabase.from('products').delete().eq('id', id)
    if (error) return { error: error.message }
    revalidateAll()
    return { ok: true }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Delete failed' }
  }
}

export async function setProductActive(id: string, is_active: boolean): Promise<{ ok?: true; error?: string }> {
  try {
    const supabase = await authed()
    const { error } = await supabase.from('products').update({ is_active }).eq('id', id)
    if (error) return { error: error.message }
    revalidateAll()
    return { ok: true }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Update failed' }
  }
}

export async function signOut() {
  const supabase = await createClient()
  await supabase.auth.signOut()
  redirect('/admin/login')
}
