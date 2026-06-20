import Link from 'next/link'
import { Plus } from 'lucide-react'
import { getSalesOrders } from '@/lib/erp'

export const dynamic = 'force-dynamic'

const STATUS: Record<string, string> = {
  draft: 'bg-slate-100 text-slate-600',
  confirmed: 'bg-blue-50 text-blue-700',
  fulfilled: 'bg-blue-900 text-white',
  cancelled: 'bg-red-50 text-red-600',
}

export default async function SalesPage() {
  const orders = await getSalesOrders()
  return (
    <div className="p-8">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">Sales</h1>
          <p className="text-slate-500 text-sm mt-0.5">{orders.length} orders</p>
        </div>
        <Link href="/admin/sales/new" className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white text-sm font-semibold px-4 py-2.5 rounded-xl shadow-lg shadow-blue-600/20">
          <Plus size={16} /> New sale
        </Link>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl overflow-hidden">
        <table className="w-full text-sm">
          <thead><tr className="border-b border-slate-200 bg-slate-50/60 text-left text-slate-500">
            <th className="px-5 py-3 font-medium">Invoice</th>
            <th className="px-5 py-3 font-medium">Customer</th>
            <th className="px-5 py-3 font-medium hidden md:table-cell">Date</th>
            <th className="px-5 py-3 font-medium">Status</th>
            <th className="px-5 py-3 font-medium text-right">Total</th>
          </tr></thead>
          <tbody className="divide-y divide-slate-100">
            {orders.map((o) => (
              <tr key={o.id} className="hover:bg-slate-50/60">
                <td className="px-5 py-3"><Link href={`/admin/sales/${o.id}`} className="font-medium text-blue-600">{o.reference}</Link></td>
                <td className="px-5 py-3 text-slate-700">{o.customer?.name ?? 'Walk-in'}</td>
                <td className="px-5 py-3 text-slate-500 hidden md:table-cell">{o.order_date}</td>
                <td className="px-5 py-3"><span className={`text-xs font-medium px-2 py-1 rounded-full ${STATUS[o.status] ?? STATUS.draft}`}>{o.status}</span></td>
                <td className="px-5 py-3 text-right font-semibold text-slate-900">${Number(o.total).toFixed(2)}</td>
              </tr>
            ))}
            {orders.length === 0 && <tr><td colSpan={5} className="px-5 py-10 text-center text-slate-400">No sales yet</td></tr>}
          </tbody>
        </table>
      </div>
    </div>
  )
}
