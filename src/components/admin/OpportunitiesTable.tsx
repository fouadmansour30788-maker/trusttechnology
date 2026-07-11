'use client'
import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { Tag, Check, AlertTriangle } from 'lucide-react'
import { applySuggestedPrice } from '@/app/admin/competitors/actions'
import type { PricingOpportunity } from '@/lib/competitors'

const LABELS: Record<string, string> = {
  mojitech: 'Mojitech', pcandparts: 'PC and Parts', ayoubcomputers: 'Ayoub Computers',
  multitech: 'Multitech', mediatech: 'Mediatech',
}

export function OpportunitiesTable({ opportunities }: { opportunities: PricingOpportunity[] }) {
  const router = useRouter()
  const [applied, setApplied] = useState<Record<string, boolean>>({})
  const [, startTransition] = useTransition()

  function apply(o: PricingOpportunity) {
    setApplied((prev) => ({ ...prev, [o.productId]: true }))
    startTransition(async () => {
      await applySuggestedPrice(o.productId, o.suggested)
      router.refresh()
    })
  }

  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5 h-full">
      <div className="flex items-center gap-2 mb-1">
        <Tag size={15} className="text-blue-600" />
        <p className="font-semibold text-slate-900 text-sm">Pricing opportunities</p>
      </div>
      <p className="text-xs text-slate-400 mb-4">“Call for price” products with a known market price. Suggested = cheapest competitor −2%.</p>
      {opportunities.length === 0 ? (
        <p className="text-sm text-slate-400 py-6 text-center">None yet — more confirmed matches will surface these.</p>
      ) : (
        <ul className="divide-y divide-slate-100">
          {opportunities.slice(0, 10).map((o) => (
            <li key={o.productId} className="py-2.5 flex items-center gap-3">
              <div className="min-w-0 flex-1">
                <p className="text-sm text-slate-800 truncate" title={o.productName}>{o.productName}</p>
                <p className="text-xs text-slate-400">
                  {LABELS[o.competitor] ?? o.competitor} sells at ${o.minCompetitorPrice.toLocaleString()}
                  {o.cost !== null && o.cost > 0 && ` · our cost $${o.cost.toLocaleString()}`}
                </p>
              </div>
              <div className="text-right shrink-0">
                <p className="text-sm font-semibold text-slate-900 tabular-nums">${o.suggested.toLocaleString()}</p>
                {o.belowCostFloor && (
                  <p className="text-[11px] text-amber-600 inline-flex items-center gap-0.5"><AlertTriangle size={10} /> near cost</p>
                )}
              </div>
              {applied[o.productId] ? (
                <span className="inline-flex items-center gap-1 text-xs font-semibold text-emerald-700 px-3 py-1.5"><Check size={12} /> Applied</span>
              ) : (
                <button onClick={() => apply(o)} className="shrink-0 inline-flex items-center gap-1 text-xs font-semibold text-blue-700 bg-blue-50 hover:bg-blue-100 rounded-lg px-3 py-1.5">
                  Apply
                </button>
              )}
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
