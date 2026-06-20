import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft } from 'lucide-react'
import { getSalesOrder } from '@/lib/erp'
import { PrintButton } from '@/components/admin/PrintButton'
import { SITE_NAME } from '@/lib/site'

export const dynamic = 'force-dynamic'

export default async function InvoicePage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const so = await getSalesOrder(id)
  if (!so) notFound()
  const items = so.sales_order_items ?? []

  return (
    <div className="p-8 max-w-3xl">
      <div className="flex items-center justify-between mb-5 print:hidden">
        <Link href="/admin/sales" className="inline-flex items-center gap-1 text-sm text-slate-500 hover:text-slate-900"><ArrowLeft size={15} /> All sales</Link>
        <PrintButton />
      </div>

      {/* Invoice */}
      <div className="bg-white border border-slate-200 rounded-2xl p-8 print:border-0 print:shadow-none">
        <div className="flex items-start justify-between mb-8">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-blue-600 to-blue-800 flex items-center justify-center"><span className="text-white font-bold text-sm">T</span></div>
              <span className="font-bold text-slate-900">{SITE_NAME}</span>
            </div>
            <p className="text-xs text-slate-400">Tripoli, Lebanon · +961 71 998 983</p>
          </div>
          <div className="text-right">
            <p className="text-2xl font-bold text-slate-900">INVOICE</p>
            <p className="text-sm text-blue-600 font-medium">{so.reference}</p>
            <p className="text-xs text-slate-400 mt-1">{so.order_date}</p>
          </div>
        </div>

        <div className="mb-6">
          <p className="text-xs uppercase tracking-widest text-slate-400 mb-1">Billed to</p>
          <p className="font-medium text-slate-900">{so.customer?.name ?? 'Walk-in customer'}</p>
          {so.customer?.phone && <p className="text-sm text-slate-500">{so.customer.phone}</p>}
        </div>

        <table className="w-full text-sm mb-6">
          <thead><tr className="border-y border-slate-200 text-left text-slate-500">
            <th className="py-2 font-medium">Item</th>
            <th className="py-2 font-medium text-right">Qty</th>
            <th className="py-2 font-medium text-right">Price</th>
            <th className="py-2 font-medium text-right">Total</th>
          </tr></thead>
          <tbody className="divide-y divide-slate-100">
            {items.map((it) => (
              <tr key={it.id}>
                <td className="py-2.5 text-slate-900">{it.product?.name ?? '—'}</td>
                <td className="py-2.5 text-right text-slate-600">{it.quantity}</td>
                <td className="py-2.5 text-right text-slate-600">${Number(it.unit_price).toFixed(2)}</td>
                <td className="py-2.5 text-right font-medium text-slate-900">${(it.quantity * Number(it.unit_price)).toFixed(2)}</td>
              </tr>
            ))}
          </tbody>
        </table>

        <div className="ml-auto w-56 space-y-1.5 text-sm">
          <div className="flex justify-between text-slate-500"><span>Subtotal</span><span>${Number(so.subtotal).toFixed(2)}</span></div>
          {Number(so.discount) > 0 && <div className="flex justify-between text-slate-500"><span>Discount</span><span>−${Number(so.discount).toFixed(2)}</span></div>}
          <div className="flex justify-between text-lg font-bold text-slate-900 border-t border-slate-200 pt-2"><span>Total</span><span>${Number(so.total).toFixed(2)}</span></div>
        </div>

        <p className="text-center text-xs text-slate-400 mt-10">Thank you for your business · {SITE_NAME}</p>
      </div>
    </div>
  )
}
