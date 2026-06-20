import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft } from 'lucide-react'
import { getPurchaseOrder } from '@/lib/erp'
import { ReceiveButton } from '@/components/admin/ReceiveButton'

export const dynamic = 'force-dynamic'

const STATUS: Record<string, string> = {
  draft: 'bg-slate-100 text-slate-600',
  ordered: 'bg-blue-50 text-blue-700',
  received: 'bg-emerald-50 text-emerald-700',
  cancelled: 'bg-red-50 text-red-600',
}

export default async function PurchaseOrderPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const po = await getPurchaseOrder(id)
  if (!po) notFound()
  const items = po.purchase_order_items ?? []

  return (
    <div className="p-8 max-w-3xl">
      <Link href="/admin/purchase-orders" className="inline-flex items-center gap-1 text-sm text-slate-500 hover:text-slate-900 mb-4"><ArrowLeft size={15} /> All purchase orders</Link>

      <div className="flex items-start justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">{po.reference}</h1>
          <p className="text-slate-500 text-sm mt-1">
            {po.supplier?.name ?? 'No supplier'} · ordered {po.order_date}
            {po.expected_date ? ` · expected ${po.expected_date}` : ''}
          </p>
        </div>
        <span className={`text-xs font-medium px-2.5 py-1 rounded-full ${STATUS[po.status] ?? STATUS.draft}`}>{po.status}</span>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl overflow-hidden mb-6">
        <table className="w-full text-sm">
          <thead><tr className="border-b border-slate-200 bg-slate-50/60 text-left text-slate-500">
            <th className="px-5 py-3 font-medium">Product</th>
            <th className="px-5 py-3 font-medium text-right">Qty</th>
            <th className="px-5 py-3 font-medium text-right">Unit cost</th>
            <th className="px-5 py-3 font-medium text-right">Received</th>
            <th className="px-5 py-3 font-medium text-right">Line total</th>
          </tr></thead>
          <tbody className="divide-y divide-slate-100">
            {items.map((it) => (
              <tr key={it.id}>
                <td className="px-5 py-3 text-slate-900">{it.product?.name ?? '—'}</td>
                <td className="px-5 py-3 text-right text-slate-600">{it.quantity}</td>
                <td className="px-5 py-3 text-right text-slate-600">${Number(it.unit_cost).toFixed(2)}</td>
                <td className="px-5 py-3 text-right text-slate-600">{it.received_qty ?? 0}</td>
                <td className="px-5 py-3 text-right font-medium text-slate-900">${(it.quantity * Number(it.unit_cost)).toFixed(2)}</td>
              </tr>
            ))}
          </tbody>
          <tfoot><tr className="border-t border-slate-200">
            <td colSpan={4} className="px-5 py-3 text-right text-slate-500">Total</td>
            <td className="px-5 py-3 text-right text-lg font-bold text-slate-900">${Number(po.total).toFixed(2)}</td>
          </tr></tfoot>
        </table>
      </div>

      {po.notes && <p className="text-sm text-slate-500 mb-6">Notes: {po.notes}</p>}

      {po.status !== 'received' && po.status !== 'cancelled' ? (
        <ReceiveButton poId={po.id} />
      ) : po.status === 'received' ? (
        <p className="text-sm text-emerald-600 font-medium">✓ Received — stock has been updated.</p>
      ) : null}
    </div>
  )
}
