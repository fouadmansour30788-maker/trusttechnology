import 'server-only'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured, getAdminStats } from '@/lib/db'

export type KpiDelta = { value: number; pct: number | null }

export type Analytics = {
  kpis: {
    revenue: number
    orders: number
    aov: number
    unitsSold: number
    customers: number
    fulfillmentRate: number | null
    inventoryValue: number
    lowStock: number
    outOfStock: number
    revenueThisMonth: KpiDelta
    ordersThisMonth: KpiDelta
  }
  monthly: { month: string; revenue: number; orders: number; aov: number }[]
  categoryRevenue: { name: string; revenue: number }[]
  statusMix: { status: string; count: number }[]
  weekday: { day: string; orders: number; revenue: number }[]
  radar: { axis: string; score: number }[]
  funnel: { stage: string; count: number }[]
  topProducts: { name: string; qty: number; revenue: number }[]
  topCustomers: { name: string; orders: number; revenue: number }[]
  analysis: { tone: 'good' | 'warning' | 'critical' | 'info'; text: string }[]
  recommendations: { text: string; href?: string }[]
}

const EMPTY: Analytics = {
  kpis: {
    revenue: 0, orders: 0, aov: 0, unitsSold: 0, customers: 0,
    fulfillmentRate: null, inventoryValue: 0, lowStock: 0, outOfStock: 0,
    revenueThisMonth: { value: 0, pct: null }, ordersThisMonth: { value: 0, pct: null },
  },
  monthly: [], categoryRevenue: [], statusMix: [], weekday: [], radar: [],
  funnel: [], topProducts: [], topCustomers: [], analysis: [], recommendations: [],
}

type OrderRow = {
  total: number; order_date: string; status: string
  customer: { name: string } | null
}
type ItemRow = { product_id: string | null; quantity: number; unit_price: number }
type ProductRow = {
  id: string; name: string; stock: number; price: number
  is_active: boolean; primary_category_id: string | null
}
type CategoryRow = { id: string; name: string }
type PORow = { status: string; total: number; expected_date: string | null }

function pctChange(cur: number, prev: number): number | null {
  if (prev === 0) return cur === 0 ? null : null
  return Math.round(((cur - prev) / prev) * 100)
}

export async function getAnalytics(): Promise<Analytics> {
  if (!isSupabaseConfigured()) return EMPTY
  try {
    const s = await createClient()
    const [ordersRes, itemsRes, prodRes, catRes, custRes, poRes, adminStats] = await Promise.all([
      s.from('sales_orders').select('total, order_date, status, customer:customers(name)'),
      s.from('sales_order_items').select('product_id, quantity, unit_price'),
      s.from('products').select('id, name, stock, price, is_active, primary_category_id'),
      s.from('categories').select('id, name'),
      s.from('customers').select('id', { count: 'exact', head: true }),
      s.from('purchase_orders').select('status, total, expected_date'),
      getAdminStats(),
    ])

    const allOrders = (ordersRes.data as unknown as OrderRow[]) ?? []
    const orders = allOrders.filter((o) => o.status !== 'cancelled')
    const items = (itemsRes.data as ItemRow[]) ?? []
    const products = (prodRes.data as ProductRow[]) ?? []
    const categories = (catRes.data as CategoryRow[]) ?? []
    const pos = (poRes.data as PORow[]) ?? []
    const customers = custRes.count ?? 0

    const productById = new Map(products.map((p) => [p.id, p]))
    const categoryById = new Map(categories.map((c) => [c.id, c.name]))

    // ── Totals ──────────────────────────────────────────────────────────
    const revenue = orders.reduce((sum, o) => sum + Number(o.total), 0)
    const unitsSold = items.reduce((sum, it) => sum + it.quantity, 0)
    const fulfilled = orders.filter((o) => o.status === 'fulfilled').length
    const confirmedPlus = orders.filter((o) => o.status === 'confirmed' || o.status === 'fulfilled').length
    const fulfillmentRate = orders.length ? Math.round((fulfilled / orders.length) * 100) : null

    const activeProducts = products.filter((p) => p.is_active)
    const inventoryValue = Math.round(products.reduce((sum, p) => sum + p.stock * Number(p.price), 0))
    const lowStock = activeProducts.filter((p) => p.stock > 0 && p.stock <= 5).length
    const outOfStock = activeProducts.filter((p) => p.stock === 0).length

    // ── Monthly series (last 12 months) ─────────────────────────────────
    const now = new Date()
    const monthKey = (d: Date) => `${d.getFullYear()}-${d.getMonth()}`
    const monthly: Analytics['monthly'] = []
    const monthIndex = new Map<string, number>()
    for (let i = 11; i >= 0; i--) {
      const d = new Date(now.getFullYear(), now.getMonth() - i, 1)
      monthIndex.set(monthKey(d), monthly.length)
      monthly.push({
        month: d.toLocaleString('en', { month: 'short', ...(d.getMonth() === 0 ? { year: '2-digit' } : {}) }),
        revenue: 0, orders: 0, aov: 0,
      })
    }
    for (const o of orders) {
      const idx = monthIndex.get(monthKey(new Date(o.order_date)))
      if (idx === undefined) continue
      monthly[idx].revenue += Number(o.total)
      monthly[idx].orders += 1
    }
    for (const m of monthly) {
      m.revenue = Math.round(m.revenue)
      m.aov = m.orders ? Math.round(m.revenue / m.orders) : 0
    }
    const cur = monthly[monthly.length - 1]
    const prev = monthly[monthly.length - 2] ?? { revenue: 0, orders: 0 }
    const revenueThisMonth = { value: cur.revenue, pct: pctChange(cur.revenue, prev.revenue) }
    const ordersThisMonth = { value: cur.orders, pct: pctChange(cur.orders, prev.orders) }

    // ── Category revenue (top 7 + Other) ────────────────────────────────
    const byCategory = new Map<string, number>()
    for (const it of items) {
      const p = it.product_id ? productById.get(it.product_id) : undefined
      const cat = (p?.primary_category_id && categoryById.get(p.primary_category_id)) || 'Other'
      byCategory.set(cat, (byCategory.get(cat) ?? 0) + it.quantity * Number(it.unit_price))
    }
    const catSorted = [...byCategory.entries()].map(([name, rev]) => ({ name, revenue: Math.round(rev) })).sort((a, b) => b.revenue - a.revenue)
    const categoryRevenue = catSorted.slice(0, 7)
    const rest = catSorted.slice(7).reduce((sum, c) => sum + c.revenue, 0)
    if (rest > 0) categoryRevenue.push({ name: 'Other', revenue: rest })

    // ── Status mix (includes cancelled) ─────────────────────────────────
    const statusCount = new Map<string, number>()
    for (const o of allOrders) statusCount.set(o.status, (statusCount.get(o.status) ?? 0) + 1)
    const statusMix = ['draft', 'confirmed', 'fulfilled', 'cancelled']
      .filter((st) => statusCount.has(st))
      .map((st) => ({ status: st, count: statusCount.get(st)! }))

    // ── Weekday pattern ─────────────────────────────────────────────────
    const dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    const weekday = dayNames.map((day) => ({ day, orders: 0, revenue: 0 }))
    for (const o of orders) {
      const idx = (new Date(o.order_date).getDay() + 6) % 7 // Mon-first
      weekday[idx].orders += 1
      weekday[idx].revenue += Number(o.total)
    }
    for (const w of weekday) w.revenue = Math.round(w.revenue)

    // ── Funnel ──────────────────────────────────────────────────────────
    const funnel = [
      { stage: 'Created', count: orders.length },
      { stage: 'Confirmed', count: confirmedPlus },
      { stage: 'Fulfilled', count: fulfilled },
    ]

    // ── Top products / customers ────────────────────────────────────────
    const prodAgg = new Map<string, { qty: number; revenue: number }>()
    for (const it of items) {
      const name = (it.product_id && productById.get(it.product_id)?.name) || 'Unknown'
      const agg = prodAgg.get(name) ?? { qty: 0, revenue: 0 }
      agg.qty += it.quantity
      agg.revenue += it.quantity * Number(it.unit_price)
      prodAgg.set(name, agg)
    }
    const topProducts = [...prodAgg.entries()]
      .map(([name, v]) => ({ name, qty: v.qty, revenue: Math.round(v.revenue) }))
      .sort((a, b) => b.revenue - a.revenue)
      .slice(0, 8)

    const custAgg = new Map<string, { orders: number; revenue: number }>()
    for (const o of orders) {
      const name = o.customer?.name ?? 'Walk-in'
      const agg = custAgg.get(name) ?? { orders: 0, revenue: 0 }
      agg.orders += 1
      agg.revenue += Number(o.total)
      custAgg.set(name, agg)
    }
    const topCustomers = [...custAgg.entries()]
      .map(([name, v]) => ({ name, orders: v.orders, revenue: Math.round(v.revenue) }))
      .sort((a, b) => b.revenue - a.revenue)
      .slice(0, 8)

    // ── Store-health radar (0–100 per axis) ─────────────────────────────
    const clamp = (n: number) => Math.max(0, Math.min(100, Math.round(n)))
    const momentum = revenueThisMonth.pct === null ? 50 : clamp(50 + revenueThisMonth.pct / 2)
    const soldIds = new Set(items.map((it) => it.product_id).filter(Boolean))
    const deadStockProducts = activeProducts.filter((p) => p.stock > 0 && !soldIds.has(p.id))
    const radar = [
      { axis: 'Sales momentum', score: momentum },
      { axis: 'Fulfillment', score: fulfillmentRate ?? 0 },
      { axis: 'Conversion', score: orders.length ? clamp((confirmedPlus / orders.length) * 100) : 0 },
      { axis: 'Availability', score: activeProducts.length ? clamp((1 - outOfStock / activeProducts.length) * 100) : 0 },
      { axis: 'Stock health', score: activeProducts.length ? clamp((1 - lowStock / activeProducts.length) * 100) : 0 },
      { axis: 'Catalog active', score: products.length ? clamp((activeProducts.length / products.length) * 100) : 0 },
    ]

    // ── Auto analysis ───────────────────────────────────────────────────
    const analysis: Analytics['analysis'] = []
    const recommendations: Analytics['recommendations'] = []
    const money = (n: number) => `$${n.toLocaleString()}`

    if (orders.length === 0) {
      analysis.push({ tone: 'info', text: 'No sales recorded yet — record your first sale to unlock trend analysis.' })
      recommendations.push({ text: 'Record sales as they happen so revenue, funnel and customer analytics build up.', href: '/admin/sales/new' })
    } else {
      if (revenueThisMonth.pct !== null) {
        if (revenueThisMonth.pct >= 5) analysis.push({ tone: 'good', text: `Revenue this month is ${money(cur.revenue)}, up ${revenueThisMonth.pct}% vs last month (${money(prev.revenue)}).` })
        else if (revenueThisMonth.pct <= -5) analysis.push({ tone: 'warning', text: `Revenue this month is ${money(cur.revenue)}, down ${Math.abs(revenueThisMonth.pct)}% vs last month (${money(prev.revenue)}).` })
        else analysis.push({ tone: 'info', text: `Revenue this month (${money(cur.revenue)}) is roughly flat vs last month.` })
      } else if (cur.revenue > 0) {
        analysis.push({ tone: 'good', text: `First revenue this month: ${money(cur.revenue)} from ${cur.orders} order${cur.orders === 1 ? '' : 's'}.` })
      }

      const bestMonth = monthly.reduce((a, b) => (b.revenue > a.revenue ? b : a))
      if (bestMonth.revenue > 0) analysis.push({ tone: 'info', text: `Best month in the last year: ${bestMonth.month} (${money(bestMonth.revenue)} across ${bestMonth.orders} orders).` })

      if (topProducts.length > 0 && revenue > 0) {
        const share = Math.round((topProducts[0].revenue / revenue) * 100)
        if (share >= 40) {
          analysis.push({ tone: 'warning', text: `“${topProducts[0].name}” alone is ${share}% of all revenue — a concentration risk.` })
          recommendations.push({ text: 'Promote 2–3 secondary products (bundles, homepage feature) to diversify revenue.', href: '/bundles' })
        } else {
          analysis.push({ tone: 'good', text: `Top seller “${topProducts[0].name}” is ${share}% of revenue — healthy product mix.` })
        }
      }

      if (fulfillmentRate !== null && fulfillmentRate < 70) {
        const pending = orders.length - fulfilled
        analysis.push({ tone: 'critical', text: `Only ${fulfillmentRate}% of orders are fulfilled — ${pending} still open.` })
        recommendations.push({ text: `Close out the ${pending} unfulfilled order${pending === 1 ? '' : 's'} (confirm, deliver, mark fulfilled).`, href: '/admin/sales' })
      } else if (fulfillmentRate !== null) {
        analysis.push({ tone: 'good', text: `${fulfillmentRate}% of orders fulfilled — pipeline is moving.` })
      }

      const bestDay = weekday.reduce((a, b) => (b.orders > a.orders ? b : a))
      if (bestDay.orders > 1) analysis.push({ tone: 'info', text: `${bestDay.day} is your busiest day (${bestDay.orders} orders, ${money(bestDay.revenue)}).` })
    }

    if (lowStock > 0) {
      const topSellerNames = new Set(topProducts.slice(0, 5).map((t) => t.name))
      const hotLow = activeProducts.filter((p) => p.stock > 0 && p.stock <= 5 && topSellerNames.has(p.name))
      analysis.push({ tone: hotLow.length ? 'critical' : 'warning', text: `${lowStock} product${lowStock === 1 ? ' is' : 's are'} low on stock (≤5 units)${hotLow.length ? `, including top seller “${hotLow[0].name}”` : ''}.` })
      recommendations.push({ text: `Raise a purchase order for the ${lowStock} low-stock item${lowStock === 1 ? '' : 's'} before they sell out.`, href: '/admin/purchase-orders/new' })
    }
    if (outOfStock > 0) {
      analysis.push({ tone: 'warning', text: `${outOfStock} active product${outOfStock === 1 ? ' is' : 's are'} out of stock but still listed on the storefront.` })
      recommendations.push({ text: `Restock or deactivate the ${outOfStock} out-of-stock item${outOfStock === 1 ? '' : 's'} so customers don’t hit dead ends.`, href: '/admin/inventory' })
    }
    if (deadStockProducts.length > 0 && orders.length > 0) {
      const deadValue = Math.round(deadStockProducts.reduce((sum, p) => sum + p.stock * Number(p.price), 0))
      analysis.push({ tone: 'info', text: `${deadStockProducts.length} products (${money(deadValue)} of stock) have never sold.` })
      recommendations.push({ text: 'Move never-sold stock with a clearance section or by adding it to bundles.', href: '/admin/products' })
    }
    const overduePOs = pos.filter((p) => (p.status === 'ordered' || p.status === 'draft') && p.expected_date && new Date(p.expected_date) < now)
    if (overduePOs.length > 0) {
      analysis.push({ tone: 'warning', text: `${overduePOs.length} purchase order${overduePOs.length === 1 ? ' is' : 's are'} past the expected delivery date.` })
      recommendations.push({ text: 'Chase suppliers on overdue purchase orders and update expected dates.', href: '/admin/purchase-orders' })
    }
    if (adminStats.callForPrice > 0) {
      recommendations.push({ text: `${adminStats.callForPrice} products are “Call for price” — pricing even a few enables direct cart checkout for them.`, href: '/admin/products' })
    }

    return {
      kpis: {
        revenue: Math.round(revenue),
        orders: orders.length,
        aov: orders.length ? Math.round(revenue / orders.length) : 0,
        unitsSold, customers, fulfillmentRate, inventoryValue, lowStock, outOfStock,
        revenueThisMonth, ordersThisMonth,
      },
      monthly, categoryRevenue, statusMix, weekday, radar, funnel,
      topProducts, topCustomers, analysis, recommendations,
    }
  } catch {
    return EMPTY
  }
}
