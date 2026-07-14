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
    /** Estimated gross profit from items whose product has a cost set; null when no cost data. */
    grossProfit: number | null
    marginPct: number | null
    costCoverage: number
  }
  monthly: { month: string; revenue: number; orders: number; aov: number; profit: number }[]
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
    grossProfit: null, marginPct: null, costCoverage: 0,
  },
  monthly: [], categoryRevenue: [], statusMix: [], weekday: [], radar: [],
  funnel: [], topProducts: [], topCustomers: [], analysis: [], recommendations: [],
}

type OrderRow = {
  id: string; total: number; order_date: string; status: string
  customer: { name: string } | null
}
type ItemRow = { so_id: string | null; product_id: string | null; quantity: number; unit_price: number }
type ProductRow = {
  id: string; name: string; stock: number; price: number; cost: number | null
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
    const [ordersRes, itemsRes, prodRes, catRes, custRes, poRes, compRes, adminStats] = await Promise.all([
      s.from('sales_orders').select('id, total, order_date, status, customer:customers(name)'),
      s.from('sales_order_items').select('so_id, product_id, quantity, unit_price'),
      s.from('products').select('id, name, stock, price, cost, is_active, primary_category_id'),
      s.from('categories').select('id, name'),
      s.from('customers').select('id', { count: 'exact', head: true }),
      s.from('purchase_orders').select('status, total, expected_date'),
      s.from('competitor_prices').select('price, matched_product_id').not('matched_product_id', 'is', null),
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
        revenue: 0, orders: 0, aov: 0, profit: 0,
      })
    }
    const orderById = new Map(orders.map((o) => [o.id, o]))
    for (const o of orders) {
      const idx = monthIndex.get(monthKey(new Date(o.order_date)))
      if (idx === undefined) continue
      monthly[idx].revenue += Number(o.total)
      monthly[idx].orders += 1
    }

    // Estimated gross profit — items whose product carries a cost, joined to
    // their (non-cancelled) order for the monthly series.
    let grossProfit = 0
    let costedRevenue = 0
    let unitsWithCost = 0
    for (const it of items) {
      const order = it.so_id ? orderById.get(it.so_id) : undefined
      if (it.so_id && !order) continue // cancelled order
      const p = it.product_id ? productById.get(it.product_id) : undefined
      const cost = p?.cost === null || p?.cost === undefined ? null : Number(p.cost)
      if (cost === null || cost <= 0) continue
      const lineProfit = (Number(it.unit_price) - cost) * it.quantity
      grossProfit += lineProfit
      costedRevenue += Number(it.unit_price) * it.quantity
      unitsWithCost += it.quantity
      if (order) {
        const idx = monthIndex.get(monthKey(new Date(order.order_date)))
        if (idx !== undefined) monthly[idx].profit += lineProfit
      }
    }
    const costCoverage = unitsSold > 0 ? Math.round((unitsWithCost / unitsSold) * 100) : 0
    const hasProfitData = unitsWithCost > 0
    for (const m of monthly) {
      m.revenue = Math.round(m.revenue)
      m.profit = Math.round(m.profit)
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

      if (hasProfitData && costedRevenue > 0) {
        const margin = Math.round((grossProfit / costedRevenue) * 100)
        analysis.push({
          tone: margin >= 15 ? 'good' : margin >= 5 ? 'info' : 'warning',
          text: `Estimated gross margin: ${margin}% (${money(Math.round(grossProfit))} profit on ${money(Math.round(costedRevenue))} of costed sales — cost data covers ${costCoverage}% of units sold).`,
        })
        const soldBelowCost = items.some((it) => {
          const p = it.product_id ? productById.get(it.product_id) : undefined
          const c = p?.cost === null || p?.cost === undefined ? null : Number(p.cost)
          return c !== null && c > 0 && Number(it.unit_price) < c
        })
        if (soldBelowCost) analysis.push({ tone: 'critical', text: 'Some items were sold below their recorded cost — check pricing or fix wrong cost values.' })
      } else if (orders.length > 0) {
        recommendations.push({ text: 'Add cost prices to your products to unlock profit & margin analytics.', href: '/admin/products' })
      }
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
    // Competitor pricing (table may not exist yet — compRes.data is null then)
    const compRows = (compRes.data as { price: number; matched_product_id: string }[] | null) ?? []
    if (compRows.length > 0) {
      const overpriced = new Set<string>()
      const underpriced = new Set<string>()
      for (const r of compRows) {
        const p = productById.get(r.matched_product_id)
        if (!p || Number(p.price) <= 0) continue
        if (Number(p.price) > Number(r.price) * 1.03) overpriced.add(r.matched_product_id)
        else if (Number(p.price) < Number(r.price) * 0.97) underpriced.add(r.matched_product_id)
      }
      analysis.push({
        tone: overpriced.size > underpriced.size ? 'warning' : 'good',
        text: `Competitor watch: ${compRows.length} matched listings — you're pricier on ${overpriced.size} product${overpriced.size === 1 ? '' : 's'}, cheaper on ${underpriced.size}.`,
      })
      if (overpriced.size > 0) {
        recommendations.push({ text: `Review pricing on the ${overpriced.size} product${overpriced.size === 1 ? '' : 's'} where Mojitech / PC and Parts / Ayoub are cheaper.`, href: '/admin/competitors' })
      }
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
        grossProfit: hasProfitData ? Math.round(grossProfit) : null,
        marginPct: hasProfitData && costedRevenue > 0 ? Math.round((grossProfit / costedRevenue) * 100) : null,
        costCoverage,
      },
      monthly, categoryRevenue, statusMix, weekday, radar, funnel,
      topProducts, topCustomers, analysis, recommendations,
    }
  } catch {
    return EMPTY
  }
}
