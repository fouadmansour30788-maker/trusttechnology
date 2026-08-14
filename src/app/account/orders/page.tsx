import { Package } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

const STATUS_LABELS: Record<string, { label: string; className: string }> = {
  draft: { label: 'Received — awaiting confirmation', className: 'text-amber-700 bg-amber-50' },
  confirmed: { label: 'Confirmed — preparing your order', className: 'text-blue-700 bg-blue-50' },
  out_for_delivery: { label: 'Out for delivery', className: 'text-amber-700 bg-amber-50' },
  fulfilled: { label: 'Delivered', className: 'text-emerald-700 bg-emerald-50' },
  cancelled: { label: 'Cancelled', className: 'text-slate-500 bg-slate-100' },
}

type OrderRow = {
  id: string; reference: string; status: string; order_date: string; total: number
  sales_order_items: { quantity: number; unit_price: number; product: { name: string } | null }[]
}

export default async function AccountOrdersPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  const { data: customer } = await supabase.from('customers').select('id').eq('auth_user_id', user!.id).maybeSingle()
  const custId = (customer as { id?: string } | null)?.id

  let orders: OrderRow[] = []
  if (custId) {
    const { data } = await supabase
      .from('sales_orders')
      .select('id, reference, status, order_date, total, sales_order_items(quantity, unit_price, product:products(name))')
      .eq('customer_id', custId)
      .order('order_date', { ascending: false })
    orders = (data as unknown as OrderRow[]) ?? []
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">Your orders</h1>
      {orders.length === 0 ? (
        <div className="bg-white border border-slate-200 rounded-2xl p-10 text-center">
          <Package size={32} className="text-slate-300 mx-auto mb-3" />
          <p className="text-slate-500 text-sm">No orders yet.</p>
        </div>
      ) : (
        <div className="space-y-4">
          {orders.map((o) => {
            const status = STATUS_LABELS[o.status] ?? { label: o.status, className: 'text-slate-500 bg-slate-100' }
            return (
              <div key={o.id} className="bg-white border border-slate-200 rounded-2xl p-5">
                <div className="flex items-center justify-between flex-wrap gap-2 mb-3">
                  <div>
                    <p className="font-semibold text-slate-900">{o.reference}</p>
                    <p className="text-xs text-slate-400">{new Date(o.order_date).toLocaleDateString('en-GB', { dateStyle: 'medium' })}</p>
                  </div>
                  <span className={`text-xs font-semibold rounded-full px-2.5 py-1 ${status.className}`}>{status.label}</span>
                </div>
                <ul className="text-sm text-slate-600 space-y-1 mb-3">
                  {o.sales_order_items.map((it, i) => (
                    <li key={i} className="flex justify-between">
                      <span>{it.quantity}× {it.product?.name ?? 'Item'}</span>
                      <span className="tabular-nums text-slate-400">${(it.quantity * Number(it.unit_price)).toFixed(2)}</span>
                    </li>
                  ))}
                </ul>
                <div className="flex justify-between text-sm font-semibold text-slate-900 pt-3 border-t border-slate-100">
                  <span>Total</span>
                  <span className="tabular-nums">${Number(o.total).toFixed(2)}</span>
                </div>
              </div>
            )
          })}
        </div>
      )}
    </div>
  )
}
