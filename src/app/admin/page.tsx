import Link from 'next/link'
import {
  Package, CheckCircle, AlertTriangle, Phone, Plus, ArrowRight, Truck, ClipboardList,
  Boxes, DollarSign, ShoppingBag, ArrowUpRight, ArrowDownRight, Lightbulb, BarChart3,
} from 'lucide-react'
import { getAdminStats } from '@/lib/db'
import { getErpStats } from '@/lib/erp'
import { getAnalytics } from '@/lib/analytics'
import { Sparkline } from '@/components/admin/AnalyticsCharts'

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

export default async function AdminDashboard() {
  const [s, erp, a] = await Promise.all([getAdminStats(), getErpStats(), getAnalytics()])
  const money = (n: number) => `$${n.toLocaleString()}`

  const cards = [
    { label: 'Total products', value: s.products, icon: Package },
    { label: 'Active', value: s.active, icon: CheckCircle },
    { label: 'Out of stock', value: s.outOfStock, icon: AlertTriangle },
    { label: 'Call for price', value: s.callForPrice, icon: Phone },
  ]
  const erpCards = [
    { label: 'Suppliers', value: erp.suppliers, icon: Truck, href: '/admin/suppliers' },
    { label: 'Open POs', value: erp.openPOs, icon: ClipboardList, href: '/admin/purchase-orders' },
    { label: 'Low stock', value: erp.lowStock, icon: Boxes, href: '/admin/inventory' },
    { label: 'Stock value', value: `$${erp.stockValue.toLocaleString()}`, icon: DollarSign, href: '/admin/inventory' },
  ]

  return (
    <div className="p-8">
      <div className="flex items-center justify-between mb-8">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">Dashboard</h1>
          <p className="text-slate-500 text-sm mt-0.5">Overview of your store.</p>
        </div>
        <Link href="/admin/products/new" className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white text-sm font-semibold px-4 py-2.5 rounded-xl shadow-lg shadow-blue-600/20">
          <Plus size={16} /> Add product
        </Link>
      </div>

      {/* This month */}
      <p className="text-xs uppercase tracking-widest text-slate-400 font-semibold mb-3">This month</p>
      <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4 mb-8">
        <div className="bg-white border border-slate-200 rounded-2xl p-5">
          <div className="flex items-start justify-between">
            <div className="w-10 h-10 rounded-xl flex items-center justify-center mb-3 text-blue-600 bg-blue-50"><DollarSign size={18} /></div>
            <DeltaChip pct={a.kpis.revenueThisMonth.pct} />
          </div>
          <p className="text-3xl font-bold text-slate-900">{money(a.kpis.revenueThisMonth.value)}</p>
          <p className="text-sm text-slate-500 mt-0.5">Revenue</p>
        </div>
        <div className="bg-white border border-slate-200 rounded-2xl p-5">
          <div className="flex items-start justify-between">
            <div className="w-10 h-10 rounded-xl flex items-center justify-center mb-3 text-blue-600 bg-blue-50"><ShoppingBag size={18} /></div>
            <DeltaChip pct={a.kpis.ordersThisMonth.pct} />
          </div>
          <p className="text-3xl font-bold text-slate-900">{a.kpis.ordersThisMonth.value}</p>
          <p className="text-sm text-slate-500 mt-0.5">Orders</p>
        </div>
        <div className="bg-white border border-slate-200 rounded-2xl p-5">
          <p className="text-sm text-slate-500 mb-2">Revenue · last 12 months</p>
          <Sparkline data={a.monthly} />
          <Link href="/admin/reports" className="mt-2 inline-flex items-center gap-1 text-xs font-medium text-blue-600 hover:text-blue-700">
            <BarChart3 size={13} /> Full analytics
          </Link>
        </div>
      </div>

      {/* Recommended actions */}
      {a.recommendations.length > 0 && (
        <div className="bg-white border border-slate-200 rounded-2xl p-5 mb-8">
          <div className="flex items-center gap-2 mb-3">
            <Lightbulb size={15} className="text-amber-500" />
            <p className="font-semibold text-slate-900 text-sm">Recommended actions</p>
            <Link href="/admin/reports" className="ml-auto text-xs font-medium text-blue-600 hover:text-blue-700">See all</Link>
          </div>
          <ul className="space-y-2">
            {a.recommendations.slice(0, 3).map((r, i) => (
              <li key={i} className="flex items-start gap-2.5 text-sm text-slate-600">
                <span className="w-5 h-5 rounded-full bg-blue-50 text-blue-700 text-xs font-semibold flex items-center justify-center shrink-0">{i + 1}</span>
                <span className="leading-relaxed">
                  {r.text}
                  {r.href && (
                    <Link href={r.href} className="inline-flex items-center gap-0.5 ml-1.5 text-blue-600 hover:text-blue-700 font-medium whitespace-nowrap">
                      Open <ArrowRight size={12} />
                    </Link>
                  )}
                </span>
              </li>
            ))}
          </ul>
        </div>
      )}

      {/* Catalog */}
      <p className="text-xs uppercase tracking-widest text-slate-400 font-semibold mb-3">Catalog</p>
      <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        {cards.map(({ label, value, icon: Icon }) => (
          <div key={label} className="bg-white border border-slate-200 rounded-2xl p-5">
            <div className="w-10 h-10 rounded-xl flex items-center justify-center mb-3 text-blue-600 bg-blue-50">
              <Icon size={18} />
            </div>
            <p className="text-3xl font-bold text-slate-900">{value}</p>
            <p className="text-sm text-slate-500 mt-0.5">{label}</p>
          </div>
        ))}
      </div>

      {/* Operations */}
      <p className="text-xs uppercase tracking-widest text-slate-400 font-semibold mb-3">Operations</p>
      <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        {erpCards.map(({ label, value, icon: Icon, href }) => (
          <Link key={label} href={href} className="bg-white border border-slate-200 rounded-2xl p-5 hover:border-blue-200 hover:shadow-md transition-all">
            <div className="w-10 h-10 rounded-xl flex items-center justify-center mb-3 text-blue-600 bg-blue-50">
              <Icon size={18} />
            </div>
            <p className="text-3xl font-bold text-slate-900">{value}</p>
            <p className="text-sm text-slate-500 mt-0.5">{label}</p>
          </Link>
        ))}
      </div>

      <Link href="/admin/products" className="group inline-flex items-center gap-2 text-sm font-medium text-blue-600 hover:text-blue-700">
        Manage products <ArrowRight size={15} className="group-hover:translate-x-0.5 transition-transform" />
      </Link>
    </div>
  )
}
