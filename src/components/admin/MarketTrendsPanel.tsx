import { TrendingUp, TrendingDown, Minus, Search, Radar } from 'lucide-react'
import type { LocalMarketTrend, SearchTrend } from '@/lib/trending'

const COMPETITOR_LABELS: Record<string, string> = {
  mojitech: 'Mojitech',
  pcandparts: 'PC and Parts',
  ayoubcomputers: 'Ayoub Computers',
  multitech: 'Multitech',
  mediatech: 'Mediatech',
}

function timeAgo(iso: string) {
  const mins = Math.round((Date.now() - new Date(iso).getTime()) / 60000)
  if (mins < 60) return `${mins}m ago`
  if (mins < 60 * 24) return `${Math.round(mins / 60)}h ago`
  return `${Math.round(mins / (60 * 24))}d ago`
}

export function MarketTrendsPanel({
  localTrends,
  searchTrends,
  refreshButton,
}: {
  localTrends: LocalMarketTrend[]
  searchTrends: SearchTrend[]
  refreshButton: React.ReactNode
}) {
  return (
    <div className="grid lg:grid-cols-2 gap-6">
      {/* Local market — products competitors are actively repricing */}
      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <div className="flex items-center gap-2 mb-1">
          <Radar size={15} className="text-blue-600" />
          <p className="font-semibold text-slate-900 text-sm">Trending in Lebanon — local market</p>
        </div>
        <p className="text-xs text-slate-400 mb-4">
          Our products competitors have most recently repriced — frequent repricing tracks real stock/demand movement.
        </p>
        {localTrends.length === 0 ? (
          <p className="text-sm text-slate-400 py-10 text-center">No repricing activity detected yet.</p>
        ) : (
          <ul className="divide-y divide-slate-100">
            {localTrends.map((t, i) => {
              const drop = t.price < t.previousPrice
              return (
                <li key={i} className="py-2.5 flex items-center justify-between gap-3">
                  <div className="min-w-0 flex-1">
                    <p className="text-sm text-slate-800 truncate" title={t.productName}>{t.productName}</p>
                    <p className="text-xs text-slate-400">{COMPETITOR_LABELS[t.competitor] ?? t.competitor} · {timeAgo(t.changedAt)}</p>
                  </div>
                  {drop ? <TrendingDown size={15} className="text-emerald-500 shrink-0" /> : <TrendingUp size={15} className="text-red-500 shrink-0" />}
                </li>
              )
            })}
          </ul>
        )}
      </div>

      {/* Google search interest */}
      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        <div className="flex items-center justify-between mb-1">
          <div className="flex items-center gap-2">
            <Search size={15} className="text-blue-600" />
            <p className="font-semibold text-slate-900 text-sm">Trending searches — Lebanon</p>
          </div>
          {refreshButton}
        </div>
        <p className="text-xs text-slate-400 mb-4">Google Trends search interest (0–100, self-scaled per keyword, geo=LB).</p>
        {searchTrends.length === 0 ? (
          <p className="text-sm text-slate-400 py-10 text-center">No data yet — click refresh above.</p>
        ) : (
          <ul className="divide-y divide-slate-100">
            {searchTrends.map((t) => (
              <li key={t.keyword} className="py-2.5 flex items-center justify-between gap-3">
                <p className="text-sm text-slate-800 capitalize">{t.keyword}</p>
                <div className="flex items-center gap-2">
                  <div className="w-24 h-1.5 bg-slate-100 rounded-full overflow-hidden">
                    <div className="h-full bg-blue-500 rounded-full" style={{ width: `${t.score}%` }} />
                  </div>
                  <span className="text-xs text-slate-500 tabular-nums w-6 text-right">{t.score}</span>
                  {t.direction === 'up' && <TrendingUp size={13} className="text-emerald-500" />}
                  {t.direction === 'down' && <TrendingDown size={13} className="text-red-500" />}
                  {t.direction === 'flat' && <Minus size={13} className="text-slate-300" />}
                </div>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  )
}
