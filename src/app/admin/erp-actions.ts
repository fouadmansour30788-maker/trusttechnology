'use server'
import { revalidatePath } from 'next/cache'
import { createClient } from '@/lib/supabase/server'

async function authed() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Not authenticated')
  return { supabase, user }
}

type Res = { ok?: true; id?: string; error?: string }

// ── Suppliers ──────────────────────────────────────────────────────────
export type SupplierInput = {
  id?: string; name: string; contact_name: string | null; email: string | null
  phone: string | null; address: string | null; notes: string | null
}

export async function saveSupplier(input: SupplierInput): Promise<Res> {
  try {
    const { supabase } = await authed()
    const { id, ...fields } = input
    if (id) {
      const { error } = await supabase.from('suppliers').update(fields).eq('id', id)
      if (error) return { error: error.message }
      revalidatePath('/admin/suppliers')
      return { ok: true, id }
    }
    const { data, error } = await supabase.from('suppliers').insert(fields).select('id').single()
    if (error) return { error: error.message }
    revalidatePath('/admin/suppliers')
    return { ok: true, id: data.id as string }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Save failed' }
  }
}

export async function deleteSupplier(id: string): Promise<Res> {
  try {
    const { supabase } = await authed()
    const { error } = await supabase.from('suppliers').delete().eq('id', id)
    if (error) return { error: error.message }
    revalidatePath('/admin/suppliers')
    return { ok: true }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Delete failed' }
  }
}

// ── Purchase orders ────────────────────────────────────────────────────
export type POInputItem = { product_id: string; quantity: number; unit_cost: number }
export type POInput = {
  supplier_id: string | null; expected_date: string | null; notes: string | null
  status: 'draft' | 'ordered'
  items: POInputItem[]
}

export async function createPurchaseOrder(input: POInput): Promise<Res> {
  try {
    const { supabase } = await authed()
    const items = input.items.filter((i) => i.product_id && i.quantity > 0)
    if (items.length === 0) return { error: 'Add at least one line item.' }
    const total = items.reduce((s, i) => s + i.quantity * i.unit_cost, 0)

    const { data: po, error } = await supabase
      .from('purchase_orders')
      .insert({
        supplier_id: input.supplier_id,
        expected_date: input.expected_date,
        notes: input.notes,
        status: input.status,
        total,
      })
      .select('id')
      .single()
    if (error) return { error: error.message }

    const { error: itemsErr } = await supabase
      .from('purchase_order_items')
      .insert(items.map((i) => ({ po_id: po.id, product_id: i.product_id, quantity: i.quantity, unit_cost: i.unit_cost })))
    if (itemsErr) return { error: itemsErr.message }

    revalidatePath('/admin/purchase-orders')
    return { ok: true, id: po.id as string }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Create failed' }
  }
}

/** Receive a PO: post stock-in movements for the outstanding qty and mark received. */
export async function receivePurchaseOrder(poId: string): Promise<Res> {
  try {
    const { supabase, user } = await authed()
    const { data: po } = await supabase
      .from('purchase_orders')
      .select('reference, status, purchase_order_items(id, product_id, quantity, received_qty)')
      .eq('id', poId)
      .single()
    if (!po) return { error: 'Purchase order not found.' }
    if (po.status === 'received') return { error: 'Already received.' }

    const items = (po.purchase_order_items ?? []) as { id: string; product_id: string; quantity: number; received_qty: number }[]
    for (const it of items) {
      const outstanding = it.quantity - (it.received_qty ?? 0)
      if (outstanding <= 0 || !it.product_id) continue
      await supabase.from('stock_movements').insert({
        product_id: it.product_id,
        delta: outstanding,
        reason: 'purchase',
        reference: po.reference,
        note: `Received PO ${po.reference}`,
        created_by: user.id,
      })
      await supabase.from('purchase_order_items').update({ received_qty: it.quantity }).eq('id', it.id)
    }
    await supabase.from('purchase_orders').update({ status: 'received' }).eq('id', poId)

    revalidatePath('/admin/purchase-orders')
    revalidatePath('/admin/inventory')
    revalidatePath('/admin/products')
    return { ok: true }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Receive failed' }
  }
}

// ── Inventory ──────────────────────────────────────────────────────────
export async function adjustStock(product_id: string, delta: number, note: string): Promise<Res> {
  try {
    const { supabase, user } = await authed()
    if (!delta) return { error: 'Quantity change cannot be zero.' }
    const { error } = await supabase.from('stock_movements').insert({
      product_id, delta, reason: 'adjustment', note: note || null, created_by: user.id,
    })
    if (error) return { error: error.message }
    revalidatePath('/admin/inventory')
    revalidatePath('/admin/products')
    return { ok: true }
  } catch (e) {
    return { error: e instanceof Error ? e.message : 'Adjustment failed' }
  }
}
