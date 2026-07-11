import { ExternalLink, Radar, ArrowDownRight, ArrowUpRight } from 'lucide-react'
import Link from 'next/link'
import type { CompetitorListing } from '@/lib/competitors'

const LABELS: Record<string, string> = {
  mojitech: 'Mojitech',
  pcandparts: 'PC and Parts',
  ayoubcomputers: 'Ayoub Computers',
}

function money(n: number) {
  return `$${n.toLocaleString(undefined, { maximumFractionDigits: 0 })}`
}

/** Competitor listings matched to this product — shown beside the edit form. */
export function CompetitorPanel({ listings, ourPrice }: { listings: CompetitorListing[]; ourPrice: number }) {
  if (listings.length === 0) return null
  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5">
      <div className="flex items-center gap-2 mb-1">
        <Radar size={15} className="text-blue-600" />
        <p className="font-semibold text-slate-900 text-sm">Competitor prices</p>
        <Link href="/admin/competitors" className="ml-auto text-xs font-medium text-blue-600 hover:text-blue-700">All comparisons</Link>
      </div>
      <p className="text-xs text-slate-400 mb-4">
        {ourPrice > 0 ? 'Gap is vs your current price.' : 'This product is “Call for price” — use these as pricing reference.'}
      </p>
      <ul className="space-y-3">
        {listings.map((l, i) => {
          const gapPct = ourPrice > 0 ? Math.round(((ourPrice - l.price) / l.price) * 100) : null
          return (
            <li key={i} className="flex items-start gap-3">
              <div className="min-w-0 flex-1">
                <p className="text-sm font-medium text-slate-800">{LABELS[l.competitor] ?? l.competitor}</p>
                <p className="text-xs text-slate-400 truncate" title={l.name}>{l.name}</p>
              </div>
              <div className="text-right shrink-0">
                <p className="text-sm font-semibold text-slate-900 tabular-nums">{money(l.price)}</p>
                {gapPct !== null && Math.abs(gapPct) > 1 && (
                  <p className={`text-[11px] font-medium inline-flex items-center gap-0.5 ${gapPct > 0 ? 'text-red-600' : 'text-emerald-600'}`}>
                    {gapPct > 0 ? <ArrowUpRight size={11} /> : <ArrowDownRight size={11} />}
                    you {gapPct > 0 ? '+' : ''}{gapPct}%
                  </p>
                )}
              </div>
              {l.url && (
                <a href={l.url} target="_blank" rel="noopener noreferrer" className="text-slate-300 hover:text-blue-600 mt-0.5" title="View listing">
                  <ExternalLink size={13} />
                </a>
              )}
            </li>
          )
        })}
      </ul>
    </div>
  )
}
