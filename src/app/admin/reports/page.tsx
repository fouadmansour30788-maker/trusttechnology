import { DollarSign, ShoppingBag, Users, TrendingUp } from 'lucide-react'
import { getSalesReport } from '@/lib/erp'
import { ReportsCharts } from '@/components/admin/ReportsCharts'

export const dynamic = 'force-dynamic'

export default async function ReportsPage() {
  const report = await getSalesReport()
  const { totals } = report
  const cards = [
    { label: 'Revenue', value: `$${totals.revenue.toLocaleString()}`, icon: DollarSign, color: 'text-blue-700 bg-blue-50' },
    { label: 'Orders', value: totals.orders, icon: ShoppingBag, color: 'text-blue-600 bg-blue-50' },
    { label: 'Avg order', value: `$${totals.avg.toLocaleString()}`, icon: TrendingUp, color: 'text-blue-800 bg-blue-50' },
    { label: 'Customers', value: totals.customers, icon: Users, color: 'text-blue-900 bg-blue-50' },
  ]
  return (
    <div className="p-8">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Reports</h1>
        <p className="text-slate-500 text-sm mt-0.5">Sales performance at a glance.</p>
      </div>

      <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
        {cards.map(({ label, value, icon: Icon, color }) => (
          <div key={label} className="bg-white border border-slate-200 rounded-2xl p-5">
            <div className={`w-10 h-10 rounded-xl flex items-center justify-center mb-3 ${color}`}><Icon size={18} /></div>
            <p className="text-3xl font-bold text-slate-900">{value}</p>
            <p className="text-sm text-slate-500 mt-0.5">{label}</p>
          </div>
        ))}
      </div>

      <ReportsCharts report={report} />
    </div>
  )
}
