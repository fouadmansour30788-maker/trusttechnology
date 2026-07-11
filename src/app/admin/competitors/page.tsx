import { ExternalLink, Radar, Link2, TrendingUp, TrendingDown } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { getPriceComparisons, type PriceComparison } from '@/lib/competitors'
import { CompetitorSyncButton } from '@/components/admin/CompetitorSyncButton'

export const dynamic = 'force-dynamic'

const COMPETITOR_LABELS: Record<string, string> = {
  mojitech: 'Mojitech',
  pcandparts: 'PC and Parts',
  ayoubcomputers: 'Ayoub Computers',
}

function money(n: number) {
  return `$${n.toLocaleString(undefined, { maximumFractionDigits: 0 })}`
}

export default async function CompetitorsPage() {
  let comparisons: PriceComparison[] = []
  let trackedTotal = 0
  let lastSync: string | null = null
  if (isSupabaseConfigured()) {
    const supabase = await createClient()
    ;({ comparisons, trackedTotal, lastSync } = await getPriceComparisons(supabase))
  }

  const weHigher = comparisons.filter((c) => c.diffPct > 3)
  const weLower = comparisons.filter((c) => c.diffPct < -3)

  const tiles = [
    { label: 'Competitor items tracked', value: trackedTotal, icon: Radar },
    { label: 'Matched to our catalog', value: comparisons.length, icon: Link2 },
    { label: 'We’re more expensive', value: weHigher.length, icon: TrendingUp },
    { label: 'We’re cheaper', value: weLower.length, icon: TrendingDown },
  ]

  return (
    <div className="p-8">
      <div className="flex items-center justify-between mb-6 gap-4 flex-wrap">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">Competitor prices</h1>
          <p className="text-slate-500 text-sm mt-0.5">
            Mojitech, PC and Parts & Ayoub Computers — matched to your catalog by model number.
            {lastSync && <> Last sync: {new Date(lastSync).toLocaleString('en-GB', { dateStyle: 'medium', timeStyle: 'short' })}.</>}
          </p>
        </div>
        <CompetitorSyncButton />
      </div>

      <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
        {tiles.map(({ label, value, icon: Icon }) => (
          <div key={label} className="bg-white border border-slate-200 rounded-2xl p-5">
            <div className="w-10 h-10 rounded-xl flex items-center justify-center mb-3 text-blue-600 bg-blue-50">
              <Icon size={18} />
            </div>
            <p className="text-3xl font-bold text-slate-900">{value}</p>
            <p className="text-sm text-slate-500 mt-0.5">{label}</p>
          </div>
        ))}
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <p className="font-semibold text-slate-900 text-sm mb-1">Price comparison</p>
        <p className="text-xs text-slate-400 mb-4">Sorted by where we’re most overpriced. Positive gap = we cost more.</p>
        {comparisons.length === 0 ? (
          <p className="text-sm text-slate-400 py-12 text-center">
            No matches yet — run the first sync (button top right). If the table doesn’t exist yet,
            run <code className="bg-slate-100 px-1 rounded">supabase/migrations/007_competitors.sql</code> in the Supabase SQL editor first.
          </p>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="text-left text-xs uppercase tracking-wide text-slate-400 border-b border-slate-100">
                  <th className="py-2 pr-4 font-semibold">Our product</th>
                  <th className="py-2 pr-4 font-semibold text-right">Our price</th>
                  <th className="py-2 pr-4 font-semibold">Competitor</th>
                  <th className="py-2 pr-4 font-semibold text-right">Their price</th>
                  <th className="py-2 pr-4 font-semibold text-right">Gap</th>
                  <th className="py-2 font-semibold"></th>
                </tr>
              </thead>
              <tbody>
                {comparisons.map((c, i) => (
                  <tr key={i} className="border-b border-slate-50 last:border-0 align-top">
                    <td className="py-2.5 pr-4 text-slate-700 font-medium max-w-[280px]">
                      <p className="truncate" title={c.productName}>{c.productName}</p>
                      <p className="text-xs text-slate-400 truncate" title={c.theirName}>≈ {c.theirName}</p>
                    </td>
                    <td className="py-2.5 pr-4 text-right tabular-nums text-slate-900 font-medium">
                      {c.ourPrice > 0 ? money(c.ourPrice) : <span className="text-slate-400">Call</span>}
                    </td>
                    <td className="py-2.5 pr-4 text-slate-600">{COMPETITOR_LABELS[c.competitor] ?? c.competitor}</td>
                    <td className="py-2.5 pr-4 text-right tabular-nums text-slate-600">{money(c.theirPrice)}</td>
                    <td className="py-2.5 pr-4 text-right tabular-nums">
                      {c.ourPrice > 0 ? (
                        <span className={`inline-flex items-center gap-1 text-xs font-semibold rounded-full px-2 py-0.5 ${
                          c.diffPct > 3 ? 'text-red-700 bg-red-50' : c.diffPct < -3 ? 'text-emerald-700 bg-emerald-50' : 'text-slate-600 bg-slate-100'
                        }`}>
                          {c.diff > 0 ? '+' : ''}{money(c.diff)} · {c.diffPct > 0 ? '+' : ''}{c.diffPct}%
                        </span>
                      ) : (
                        <span className="text-xs text-slate-400">reference</span>
                      )}
                    </td>
                    <td className="py-2.5 text-right">
                      {c.url && (
                        <a href={c.url} target="_blank" rel="noopener noreferrer" className="inline-flex text-slate-400 hover:text-blue-600" title="View on competitor site">
                          <ExternalLink size={14} />
                        </a>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  )
}
