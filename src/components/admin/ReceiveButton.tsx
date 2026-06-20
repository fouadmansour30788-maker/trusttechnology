'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { PackageCheck, Loader2 } from 'lucide-react'
import { receivePurchaseOrder } from '@/app/admin/erp-actions'

export function ReceiveButton({ poId }: { poId: string }) {
  const router = useRouter()
  const [pending, start] = useTransition()
  const [error, setError] = useState<string | null>(null)

  function receive() {
    if (!confirm('Receive this order? Stock will be added for all items.')) return
    setError(null)
    start(async () => {
      const res = await receivePurchaseOrder(poId)
      if (res.error) setError(res.error)
      else router.refresh()
    })
  }

  return (
    <div>
      <button onClick={receive} disabled={pending} className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-2.5 rounded-xl shadow-lg shadow-blue-600/20 disabled:opacity-50">
        {pending ? <Loader2 size={16} className="animate-spin" /> : <PackageCheck size={16} />}
        Receive &amp; add to stock
      </button>
      {error && <p className="text-sm text-red-600 mt-2">{error}</p>}
    </div>
  )
}
