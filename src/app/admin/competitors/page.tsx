import { ExternalLink, Radar, Link2, TrendingUp, TrendingDown, History, PackageSearch } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import {
  getPriceComparisons, getRecentChanges, getAssortmentGaps, getPricingOpportunities,
  type PriceComparison, type PriceChange, type AssortmentGap, type PricingOpportunity,
} from '@/lib/competitors'
import { CompetitorSyncButton } from '@/components/admin/CompetitorSyncButton'
import { CompetitorDigest } from '@/components/admin/CompetitorDigest'
import { MatchReview } from '@/components/admin/MatchReview'
import { OpportunitiesTable } from '@/components/admin/OpportunitiesTable'

export const dynamic = 'force-dynamic'

const COMPETITOR_LABELS: Record<string, string> = {
  mojitech: 'Mojitech',
  pcandparts: 'PC and Parts',
  ayoubcomputers: 'Ayoub Computers',
  multitech: 'Multitech',
  mediatech: 'Mediatech',
}

function money(n: number) {
  return `$${n.toLocaleString(undefined, { maximumFractionDigits: 0 })}`
}

function timeAgo(iso: string) {
  const mins = Math.round((Date.now() - new Date(iso).getTime()) / 60000)
  if (mins < 60) return `${mins}m ago`
  if (mins < 60 * 24) return `${Math.round(mins / 60)}h ago`
  return `${Math.round(mins / (60 * 24))}d ago`
}

export default async function CompetitorsPage() {
  let comparisons: PriceComparison[] = []
  let trackedTotal = 0
  let lastSync: string | null = null
  let changes: PriceChange[] = []
  let gaps: AssortmentGap[] = []
  let opportunities: PricingOpportunity[] = []

  if (isSupabaseConfigured()) {
    const supabase = await createClient()
    const { data: brandTags } = await supabase.from('tags').select('name').eq('type', 'brand')
    const ourBrands = new Set(
      ((brandTags as { name: string }[]) ?? []).map((t) => t.name.toUpperCase().replace(/[^A-Z0-9]/g, ''))
    )
    ;[{ comparisons, trackedTotal, lastSync }, changes, gaps, opportunities] = await Promise.all([
      getPriceComparisons(supabase),
      getRecentChanges(supabase, 12),
      getAssortmentGaps(supabase, ourBrands),
      getPricingOpportunities(supabase),
    ])
  }

  const weHigher = comparisons.filter((c) => c.diffPct > 3 && c.ourPrice > 0)
  const weLower = comparisons.filter((c) => c.diffPct < -3 && c.ourPrice > 0)
  const notCarried = gaps.filter((g) => !g.carried)

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
            Mojitech, PC and Parts, Ayoub Computers, Multitech & Mediatech.
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

      <div className="mb-6"><CompetitorDigest /></div>

      <div className="grid lg:grid-cols-2 gap-6 mb-6">
        {/* Recent price changes */}
        <div className="bg-white border border-slate-200 rounded-2xl p-5">
          <div className="flex items-center gap-2 mb-1">
            <History size={15} className="text-blue-600" />
            <p className="font-semibold text-slate-900 text-sm">Recent price changes</p>
          </div>
          <p className="text-xs text-slate-400 mb-4">Detected by the daily sync.</p>
          {changes.length === 0 ? (
            <p className="text-sm text-slate-400 py-6 text-center">No changes observed yet — they’ll appear after a few syncs.</p>
          ) : (
            <ul className="divide-y divide-slate-100">
              {changes.map((c, i) => {
                const drop = c.price < c.previous_price
                return (
                  <li key={i} className="py-2.5 flex items-center gap-3">
                    <div className="min-w-0 flex-1">
                      <p className="text-sm text-slate-800 truncate" title={c.name}>
                        {c.name}
                        {c.url && <a href={c.url} target="_blank" rel="noopener noreferrer" className="inline-flex ml-1 text-slate-300 hover:text-blue-600 align-middle"><ExternalLink size={12} /></a>}
                      </p>
                      <p className="text-xs text-slate-400">
                        {COMPETITOR_LABELS[c.competitor] ?? c.competitor} · {timeAgo(c.changed_at)}
                        {c.matched && <span className="text-blue-600 font-medium"> · matched</span>}
                      </p>
                    </div>
                    <p className="text-sm tabular-nums shrink-0">
                      <span className="text-slate-400 line-through mr-1.5">{money(c.previous_price)}</span>
                      <span className={`font-semibold ${drop ? 'text-emerald-600' : 'text-red-600'}`}>{money(c.price)}</span>
                    </p>
                  </li>
                )
              })}
            </ul>
          )}
        </div>

        <OpportunitiesTable opportunities={opportunities} />
      </div>

      <div className="mb-6"><MatchReview /></div>

      {/* Assortment gaps */}
      {notCarried.length > 0 && (
        <div className="bg-white border border-slate-200 rounded-2xl p-5 mb-6">
          <div className="flex items-center gap-2 mb-1">
            <PackageSearch size={15} className="text-blue-600" />
            <p className="font-semibold text-slate-900 text-sm">Assortment gaps</p>
          </div>
          <p className="text-xs text-slate-400 mb-4">Brands competitors list that don’t appear in your catalog — buying ideas.</p>
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-3">
            {notCarried.slice(0, 9).map((g) => (
              <div key={g.brand} className="border border-slate-100 rounded-xl p-3">
                <div className="flex items-baseline justify-between">
                  <p className="text-sm font-semibold text-slate-800">{g.brand}</p>
                  <p className="text-xs text-slate-400">{g.count} items · from {money(g.minPrice)}</p>
                </div>
                <ul className="mt-1.5 space-y-0.5">
                  {g.samples.map((s2, i) => (
                    <li key={i} className="text-xs text-slate-500 truncate" title={s2.name}>
                      {s2.url ? <a href={s2.url} target="_blank" rel="noopener noreferrer" className="hover:text-blue-600">{s2.name}</a> : s2.name}
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Comparison table */}
      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <p className="font-semibold text-slate-900 text-sm mb-1">Price comparison</p>
        <p className="text-xs text-slate-400 mb-4">
          Sorted by where we’re most overpriced. Positive gap = we cost more. Our prices include VAT —
          competitors whose listings exclude it (Ayoub always; PC and Parts/Mojitech/Mediatech where unlabeled)
          are marked <span className="font-semibold text-blue-700 bg-blue-50 rounded-full px-1.5 py-0.5">+VAT</span> and
          have 11% added so the comparison is fair.
        </p>
        {comparisons.length === 0 ? (
          <p className="text-sm text-slate-400 py-12 text-center">
            No matches yet — run the first sync (button top right). If the table doesn’t exist yet,
            run <code className="bg-slate-100 px-1 rounded">supabase/migrations/007_competitors.sql</code> and{' '}
            <code className="bg-slate-100 px-1 rounded">008_competitor_monitoring.sql</code> in the Supabase SQL editor first.
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
                    <td className="py-2.5 pr-4 text-right tabular-nums text-slate-600">
                      {money(c.theirPrice)}
                      {c.theirVatExcluded && (
                        <span
                          className="ml-1.5 text-[10px] font-semibold text-blue-700 bg-blue-50 rounded-full px-1.5 py-0.5 align-middle"
                          title={`Listed at ${money(c.theirPriceRaw)} excluding VAT — we added 11% so it's comparable to our VAT-inclusive price`}
                        >
                          +VAT
                        </span>
                      )}
                      {!c.theirInStock && (
                        <span className="ml-1.5 text-[10px] font-semibold text-amber-700 bg-amber-50 rounded-full px-1.5 py-0.5 align-middle" title="Out of stock at competitor — opportunity">OOS</span>
                      )}
                    </td>
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
