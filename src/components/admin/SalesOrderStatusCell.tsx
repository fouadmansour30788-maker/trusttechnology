'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { MessageCircle, Loader2 } from 'lucide-react'
import { updateSalesOrderStatus } from '@/app/admin/sales/actions'

export const ORDER_STATUSES = [
  { id: 'draft', label: 'Requested' },
  { id: 'confirmed', label: 'Confirmed' },
  { id: 'out_for_delivery', label: 'On Delivery' },
  { id: 'fulfilled', label: 'Delivered' },
  { id: 'cancelled', label: 'Cancelled' },
]

export const ORDER_STATUS_CLS: Record<string, string> = {
  draft: 'bg-slate-100 text-slate-600',
  confirmed: 'bg-blue-50 text-blue-700',
  out_for_delivery: 'bg-amber-50 text-amber-700',
  fulfilled: 'bg-emerald-50 text-emerald-700',
  cancelled: 'bg-red-50 text-red-600',
}

function waMessage(status: string, name: string, reference: string): string {
  switch (status) {
    case 'confirmed':
      return `Hi ${name}! Your order ${reference} is confirmed — we're preparing it now.`
    case 'out_for_delivery':
      return `Hi ${name}! Your order ${reference} is out for delivery 🚚`
    case 'fulfilled':
      return `Hi ${name}! Your order ${reference} has been delivered. Thanks for shopping with us!`
    case 'cancelled':
      return `Hi ${name}, your order ${reference} has been cancelled. Let us know if you have questions.`
    default:
      return `Hi ${name}! Update on your order ${reference}:`
  }
}

export function SalesOrderStatusCell({
  id, reference, status: initialStatus, customerName, customerPhone,
}: {
  id: string
  reference: string
  status: string
  customerName: string
  customerPhone: string | null
}) {
  const router = useRouter()
  const [status, setStatus] = useState(initialStatus)
  const [pending, startTransition] = useTransition()
  const [justSaved, setJustSaved] = useState(false)

  function onChange(next: string) {
    const prev = status
    setStatus(next)
    startTransition(async () => {
      const result = await updateSalesOrderStatus(id, next)
      if (result.error) {
        setStatus(prev) // revert on failure
        return
      }
      setJustSaved(true)
      setTimeout(() => setJustSaved(false), 2000)
      router.refresh()
    })
  }

  return (
    <div className="flex items-center gap-1.5">
      <select
        value={status}
        onChange={(e) => onChange(e.target.value)}
        disabled={pending}
        className={`text-xs font-medium rounded-full pl-2.5 pr-6 py-1 border-0 outline-none cursor-pointer disabled:opacity-60 ${ORDER_STATUS_CLS[status] ?? ORDER_STATUS_CLS.draft}`}
      >
        {ORDER_STATUSES.map((s) => <option key={s.id} value={s.id}>{s.label}</option>)}
      </select>
      {pending && <Loader2 size={12} className="animate-spin text-slate-300" />}
      {!pending && justSaved && <span className="text-[10px] text-emerald-600">Saved</span>}
      {customerPhone && (
        <a
          href={`https://wa.me/${customerPhone.replace(/\D/g, '')}?text=${encodeURIComponent(waMessage(status, customerName, reference))}`}
          target="_blank" rel="noopener noreferrer"
          title="Notify customer on WhatsApp"
          className="text-slate-300 hover:text-emerald-600 transition-colors"
        >
          <MessageCircle size={14} />
        </a>
      )}
    </div>
  )
}
