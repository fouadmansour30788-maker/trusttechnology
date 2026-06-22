import 'server-only'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'

export type Supplier = {
  id: string; name: string; contact_name: string | null; email: string | null
  phone: string | null; address: string | null; notes: string | null; is_active: boolean
}
export type POItem = {
  id?: string; product_id: string | null; quantity: number; unit_cost: number; received_qty?: number
  product?: { name: string; sku: string | null }
}
export type PurchaseOrder = {
  id: string; reference: string; supplier_id: string | null; status: string
  order_date: string; expected_date: string | null; notes: string | null; total: number
  supplier?: { name: string } | null
  purchase_order_items?: POItem[]
}
export type StockMovement = {
  id: string; product_id: string; delta: number; reason: string
  reference: string | null; note: string | null; created_at: string
  product?: { name: string; sku: string | null }
}
export type ProductLite = { id: string; name: string; sku: string | null; stock: number; price: number }

const empty = <T,>(v: T): T => v

export async function getSuppliers(): Promise<Supplier[]> {
  if (!isSupabaseConfigured()) return []
  const s = await createClient()
  const { data } = await s.from('suppliers').select('*').order('name')
  return (data as Supplier[]) ?? empty([])
}

export async function getSupplier(id: string): Promise<Supplier | null> {
  if (!isSupabaseConfigured()) return null
  const s = await createClient()
  const { data } = await s.from('suppliers').select('*').eq('id', id).maybeSingle()
  return (data as Supplier) ?? null
}

export async function getProductsLite(): Promise<ProductLite[]> {
  if (!isSupabaseConfigured()) return []
  const s = await createClient()
  const { data } = await s.from('products').select('id, name, sku, stock, price').order('name')
  return (data as ProductLite[]) ?? []
}

export async function getPurchaseOrders(): Promise<PurchaseOrder[]> {
  if (!isSupabaseConfigured()) return []
  const s = await createClient()
  const { data } = await s
    .from('purchase_orders')
    .select('*, supplier:suppliers(name)')
    .order('created_at', { ascending: false })
  return (data as PurchaseOrder[]) ?? []
}

export async function getPurchaseOrder(id: string): Promise<PurchaseOrder | null> {
  if (!isSupabaseConfigured()) return null
  const s = await createClient()
  const { data } = await s
    .from('purchase_orders')
    .select('*, supplier:suppliers(name), purchase_order_items(*, product:products(name, sku))')
    .eq('id', id)
    .maybeSingle()
  return (data as PurchaseOrder) ?? null
}

export async function getStockMovements(limit = 100): Promise<StockMovement[]> {
  if (!isSupabaseConfigured()) return []
  const s = await createClient()
  const { data } = await s
    .from('stock_movements')
    .select('*, product:products(name, sku)')
    .order('created_at', { ascending: false })
    .limit(limit)
  return (data as StockMovement[]) ?? []
}

export async function getLowStock(threshold = 5): Promise<ProductLite[]> {
  if (!isSupabaseConfigured()) return []
  const s = await createClient()
  const { data } = await s
    .from('products')
    .select('id, name, sku, stock, price')
    .lte('stock', threshold)
    .order('stock')
  return (data as ProductLite[]) ?? []
}

export async function getErpStats() {
  if (!isSupabaseConfigured()) {
    return { suppliers: 0, openPOs: 0, lowStock: 0, stockValue: 0 }
  }
  const s = await createClient()
  const [sup, po, prods] = await Promise.all([
    s.from('suppliers').select('id', { count: 'exact', head: true }),
    s.from('purchase_orders').select('id', { count: 'exact', head: true }).in('status', ['draft', 'ordered']),
    s.from('products').select('stock, price'),
  ])
  const rows = (prods.data as { stock: number; price: number }[]) ?? []
  return {
    suppliers: sup.count ?? 0,
    openPOs: po.count ?? 0,
    lowStock: rows.filter((r) => r.stock <= 5).length,
    stockValue: Math.round(rows.reduce((sum, r) => sum + r.stock * Number(r.price), 0)),
  }
}

// ── Customers ────────────────────────────────────────────────────────────
export type Customer = {
  id: string; name: string; email: string | null; phone: string | null
  address: string | null; notes: string | null
}
export type SOItem = {
  id?: string; product_id: string | null; quantity: number; unit_price: number
  product?: { name: string; sku: string | null }
}
export type SalesOrder = {
  id: string; reference: string; customer_id: string | null; status: string
  order_date: string; subtotal: number; discount: number; total: number; notes: string | null
  customer?: { name: string; phone: string | null } | null
  sales_order_items?: SOItem[]
}

export async function getCustomers(): Promise<Customer[]> {
  if (!isSupabaseConfigured()) return []
  const s = await createClient()
  const { data } = await s.from('customers').select('*').order('name')
  return (data as Customer[]) ?? []
}
export async function getCustomer(id: string): Promise<Customer | null> {
  if (!isSupabaseConfigured()) return null
  const s = await createClient()
  const { data } = await s.from('customers').select('*').eq('id', id).maybeSingle()
  return (data as Customer) ?? null
}

export async function getSalesOrders(): Promise<SalesOrder[]> {
  if (!isSupabaseConfigured()) return []
  const s = await createClient()
  const { data } = await s
    .from('sales_orders')
    .select('*, customer:customers(name, phone)')
    .order('created_at', { ascending: false })
  return (data as SalesOrder[]) ?? []
}
export async function getSalesOrder(id: string): Promise<SalesOrder | null> {
  if (!isSupabaseConfigured()) return null
  const s = await createClient()
  const { data } = await s
    .from('sales_orders')
    .select('*, customer:customers(name, phone), sales_order_items(*, product:products(name, sku))')
    .eq('id', id)
    .maybeSingle()
  return (data as SalesOrder) ?? null
}

export type SalesReport = {
  totals: { orders: number; revenue: number; avg: number; customers: number }
  revenueByMonth: { month: string; revenue: number }[]
  topProducts: { name: string; qty: number; revenue: number }[]
  funnel: { stage: string; count: number; fill: string }[]
}

export async function getSalesReport(): Promise<SalesReport> {
  const empty: SalesReport = { totals: { orders: 0, revenue: 0, avg: 0, customers: 0 }, revenueByMonth: [], topProducts: [], funnel: [] }
  if (!isSupabaseConfigured()) return empty
  try {
    const s = await createClient()
    const [ordersRes, itemsRes, custRes] = await Promise.all([
      s.from('sales_orders').select('total, order_date, status').neq('status', 'cancelled'),
      s.from('sales_order_items').select('quantity, unit_price, product:products(name)'),
      s.from('customers').select('id', { count: 'exact', head: true }),
    ])
    const orders = (ordersRes.data as { total: number; order_date: string; status: string }[]) ?? []
    const revenue = orders.reduce((sum, o) => sum + Number(o.total), 0)

    // Order funnel: created → confirmed → fulfilled
    const funnel = [
      { stage: 'Created', count: orders.length, fill: '#1e3a8a' },
      { stage: 'Confirmed', count: orders.filter((o) => o.status === 'confirmed' || o.status === 'fulfilled').length, fill: '#2563eb' },
      { stage: 'Fulfilled', count: orders.filter((o) => o.status === 'fulfilled').length, fill: '#60a5fa' },
    ]

    // revenue by month (last 6 months)
    const byMonth = new Map<string, number>()
    const now = new Date()
    for (let i = 5; i >= 0; i--) {
      const d = new Date(now.getFullYear(), now.getMonth() - i, 1)
      byMonth.set(d.toLocaleString('en', { month: 'short' }), 0)
    }
    for (const o of orders) {
      const key = new Date(o.order_date).toLocaleString('en', { month: 'short' })
      if (byMonth.has(key)) byMonth.set(key, (byMonth.get(key) ?? 0) + Number(o.total))
    }

    // top products
    const items = (itemsRes.data as unknown as { quantity: number; unit_price: number; product: { name: string } | null }[]) ?? []
    const prodMap = new Map<string, { qty: number; revenue: number }>()
    for (const it of items) {
      const name = it.product?.name ?? 'Unknown'
      const cur = prodMap.get(name) ?? { qty: 0, revenue: 0 }
      cur.qty += it.quantity
      cur.revenue += it.quantity * Number(it.unit_price)
      prodMap.set(name, cur)
    }
    const topProducts = [...prodMap.entries()]
      .map(([name, v]) => ({ name, ...v }))
      .sort((a, b) => b.revenue - a.revenue)
      .slice(0, 6)

    return {
      totals: { orders: orders.length, revenue: Math.round(revenue), avg: orders.length ? Math.round(revenue / orders.length) : 0, customers: custRes.count ?? 0 },
      revenueByMonth: [...byMonth.entries()].map(([month, revenue]) => ({ month, revenue: Math.round(revenue) })),
      topProducts,
      funnel,
    }
  } catch {
    return empty
  }
}
