import Link from 'next/link'
import { Plus } from 'lucide-react'
import { getPurchaseOrders } from '@/lib/erp'

export const dynamic = 'force-dynamic'

const STATUS: Record<string, string> = {
  draft: 'bg-slate-100 text-slate-600',
  ordered: 'bg-blue-50 text-blue-700',
  received: 'bg-blue-50 text-blue-700',
  cancelled: 'bg-red-50 text-red-600',
}

export default async function PurchaseOrdersPage() {
  const pos = await getPurchaseOrders()
  return (
    <div className="p-8">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">Purchase Orders</h1>
          <p className="text-slate-500 text-sm mt-0.5">{pos.length} orders</p>
        </div>
        <Link href="/admin/purchase-orders/new" className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white text-sm font-semibold px-4 py-2.5 rounded-xl shadow-lg shadow-blue-600/20">
          <Plus size={16} /> New PO
        </Link>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl overflow-hidden">
        <table className="w-full text-sm">
          <thead><tr className="border-b border-slate-200 bg-slate-50/60 text-left text-slate-500">
            <th className="px-5 py-3 font-medium">Reference</th>
            <th className="px-5 py-3 font-medium">Supplier</th>
            <th className="px-5 py-3 font-medium hidden md:table-cell">Date</th>
            <th className="px-5 py-3 font-medium">Status</th>
            <th className="px-5 py-3 font-medium text-right">Total</th>
          </tr></thead>
          <tbody className="divide-y divide-slate-100">
            {pos.map((po) => (
              <tr key={po.id} className="hover:bg-slate-50/60 cursor-pointer">
                <td className="px-5 py-3"><Link href={`/admin/purchase-orders/${po.id}`} className="font-medium text-blue-600">{po.reference}</Link></td>
                <td className="px-5 py-3 text-slate-700">{po.supplier?.name ?? '—'}</td>
                <td className="px-5 py-3 text-slate-500 hidden md:table-cell">{po.order_date}</td>
                <td className="px-5 py-3"><span className={`text-xs font-medium px-2 py-1 rounded-full ${STATUS[po.status] ?? STATUS.draft}`}>{po.status}</span></td>
                <td className="px-5 py-3 text-right font-semibold text-slate-900">${Number(po.total).toFixed(2)}</td>
              </tr>
            ))}
            {pos.length === 0 && <tr><td colSpan={5} className="px-5 py-10 text-center text-slate-400">No purchase orders yet</td></tr>}
          </tbody>
        </table>
      </div>
    </div>
  )
}
