import {
  DollarSign, ShoppingBag, Users, TrendingUp, Boxes, PackageCheck, Layers, Warehouse,
  ArrowUpRight, ArrowDownRight,
} from 'lucide-react'
import { getAnalytics } from '@/lib/analytics'
import {
  Card, RevenueTrend, OrdersByMonth, CategoryDonut, StatusDonut,
  HealthRadar, OrderFunnel, WeekdayBar, RankBar,
} from '@/components/admin/AnalyticsCharts'
import { AutoAnalysis, Recommendations } from '@/components/admin/AutoAnalysis'
import { AiInsights } from '@/components/admin/AiInsights'

export const dynamic = 'force-dynamic'

function DeltaChip({ pct }: { pct: number | null }) {
  if (pct === null) return null
  const up = pct >= 0
  return (
    <span className={`inline-flex items-center gap-0.5 text-xs font-semibold rounded-full px-1.5 py-0.5 ${up ? 'text-emerald-700 bg-emerald-50' : 'text-red-700 bg-red-50'}`}>
      {up ? <ArrowUpRight size={12} /> : <ArrowDownRight size={12} />}
      {Math.abs(pct)}%
    </span>
  )
}

export default async function ReportsPage() {
  const a = await getAnalytics()
  const { kpis } = a
  const money = (n: number) => `$${n.toLocaleString()}`

  const tiles: { label: string; value: string; icon: typeof DollarSign; pct?: number | null; hint?: string }[] = [
    { label: 'Revenue this month', value: money(kpis.revenueThisMonth.value), icon: DollarSign, pct: kpis.revenueThisMonth.pct, hint: 'vs last month' },
    { label: 'Orders this month', value: String(kpis.ordersThisMonth.value), icon: ShoppingBag, pct: kpis.ordersThisMonth.pct, hint: 'vs last month' },
    { label: 'Total revenue', value: money(kpis.revenue), icon: TrendingUp },
    { label: 'Avg order value', value: money(kpis.aov), icon: Layers },
    { label: 'Units sold', value: kpis.unitsSold.toLocaleString(), icon: PackageCheck },
    { label: 'Customers', value: String(kpis.customers), icon: Users },
    { label: 'Inventory value', value: money(kpis.inventoryValue), icon: Warehouse },
    { label: 'Low / out of stock', value: `${kpis.lowStock} / ${kpis.outOfStock}`, icon: Boxes },
    ...(kpis.grossProfit !== null
      ? [
          { label: `Est. gross profit · ${kpis.costCoverage}% cost coverage`, value: money(kpis.grossProfit), icon: TrendingUp },
          { label: 'Gross margin', value: `${kpis.marginPct}%`, icon: DollarSign },
        ]
      : []),
  ]

  return (
    <div className="p-8">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Reports & Analytics</h1>
        <p className="text-slate-500 text-sm mt-0.5">Sales, inventory and customer performance — analysed automatically.</p>
      </div>

      {/* KPI tiles */}
      <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
        {tiles.map(({ label, value, icon: Icon, pct, hint }) => (
          <div key={label} className="bg-white border border-slate-200 rounded-2xl p-5">
            <div className="flex items-start justify-between">
              <div className="w-10 h-10 rounded-xl flex items-center justify-center mb-3 text-blue-600 bg-blue-50">
                <Icon size={18} />
              </div>
              {pct !== undefined && <DeltaChip pct={pct} />}
            </div>
            <p className="text-2xl font-bold text-slate-900">{value}</p>
            <p className="text-sm text-slate-500 mt-0.5">
              {label}
              {hint && pct !== undefined && pct !== null && <span className="text-slate-400"> · {hint}</span>}
            </p>
          </div>
        ))}
      </div>

      {/* AI narrative */}
      <div className="mb-6"><AiInsights /></div>

      {/* Rule-based analysis + actions */}
      <div className="grid lg:grid-cols-2 gap-6 mb-6">
        <AutoAnalysis items={a.analysis} />
        <Recommendations items={a.recommendations} />
      </div>

      {/* Trend row */}
      <div className="grid lg:grid-cols-3 gap-6 mb-6">
        <Card title="Revenue trend" subtitle="Last 12 months" className="lg:col-span-2">
          <RevenueTrend data={a.monthly} />
        </Card>
        <Card title="Orders per month" subtitle="Last 12 months">
          <OrdersByMonth data={a.monthly} />
        </Card>
      </div>

      {/* Mix row */}
      <div className="grid lg:grid-cols-2 gap-6 mb-6">
        <Card title="Revenue by category" subtitle="All-time share of item revenue">
          <CategoryDonut data={a.categoryRevenue} />
        </Card>
        <Card title="Order status mix" subtitle="All orders, including cancelled">
          <StatusDonut data={a.statusMix} />
        </Card>
      </div>

      {/* Health row */}
      <div className="grid lg:grid-cols-3 gap-6 mb-6">
        <Card title="Store health" subtitle="Six operational scores, 0–100">
          <HealthRadar data={a.radar} />
        </Card>
        <Card title="Order funnel" subtitle="Created → confirmed → fulfilled">
          <OrderFunnel data={a.funnel} />
        </Card>
        <Card title="Busiest days" subtitle="Orders by day of week">
          <WeekdayBar data={a.weekday} />
        </Card>
      </div>

      {/* Rankings row */}
      <div className="grid lg:grid-cols-2 gap-6 mb-6">
        <Card title="Top products" subtitle="By item revenue">
          <RankBar data={a.topProducts} valueLabel="Revenue" />
        </Card>
        <Card title="Top customers" subtitle="By order revenue">
          <RankBar data={a.topCustomers} valueLabel="Spent" />
        </Card>
      </div>

      {/* Table view (accessibility relief + exact figures) */}
      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <p className="font-semibold text-slate-900 text-sm mb-4">Monthly detail</p>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="text-left text-xs uppercase tracking-wide text-slate-400 border-b border-slate-100">
                <th className="py-2 pr-4 font-semibold">Month</th>
                <th className="py-2 pr-4 font-semibold text-right">Orders</th>
                <th className="py-2 pr-4 font-semibold text-right">Revenue</th>
                <th className="py-2 pr-4 font-semibold text-right">Est. profit</th>
                <th className="py-2 font-semibold text-right">Avg order</th>
              </tr>
            </thead>
            <tbody>
              {a.monthly.map((m) => (
                <tr key={m.month} className="border-b border-slate-50 last:border-0">
                  <td className="py-2 pr-4 text-slate-700 font-medium">{m.month}</td>
                  <td className="py-2 pr-4 text-right tabular-nums text-slate-600">{m.orders}</td>
                  <td className="py-2 pr-4 text-right tabular-nums text-slate-600">{money(m.revenue)}</td>
                  <td className="py-2 pr-4 text-right tabular-nums text-slate-600">{m.profit !== 0 ? money(m.profit) : '—'}</td>
                  <td className="py-2 text-right tabular-nums text-slate-600">{money(m.aov)}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}
