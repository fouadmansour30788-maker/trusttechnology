import Link from 'next/link'
import { TrendingUp, TrendingDown, Minus, Search, Radar } from 'lucide-react'
import type { LocalMarketTrend, SearchTrend, KeywordMatch } from '@/lib/trending'

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

export function MarketTrendsPanel({
  localTrends,
  searchTrends,
  keywordMatches,
  refreshButton,
}: {
  localTrends: LocalMarketTrend[]
  searchTrends: SearchTrend[]
  keywordMatches: Record<string, KeywordMatch[]>
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
            {localTrends.map((t, i) => (
              <li key={i} className="py-2.5 flex items-center justify-between gap-3">
                <div className="min-w-0 flex-1">
                  <Link href={`/admin/products/${t.productId}`} className="text-sm text-slate-800 hover:text-blue-600 truncate block" title={t.productName}>
                    {t.productName}
                  </Link>
                  <p className="text-xs text-slate-400">{COMPETITOR_LABELS[t.competitor] ?? t.competitor} · {timeAgo(t.changedAt)}</p>
                </div>
                {t.ourPrice > 0 ? (
                  <span className={`shrink-0 inline-flex items-center gap-1 text-xs font-semibold rounded-full px-2 py-0.5 ${
                    t.diffPct > 3 ? 'text-red-700 bg-red-50' : t.diffPct < -3 ? 'text-emerald-700 bg-emerald-50' : 'text-slate-600 bg-slate-100'
                  }`} title={`Us ${money(t.ourPrice)} vs ${COMPETITOR_LABELS[t.competitor] ?? t.competitor} ${money(t.price)}`}>
                    {money(t.ourPrice)} vs {money(t.price)}
                  </span>
                ) : (
                  t.price < t.previousPrice
                    ? <TrendingDown size={15} className="text-emerald-500 shrink-0" />
                    : <TrendingUp size={15} className="text-red-500 shrink-0" />
                )}
              </li>
            ))}
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
        <p className="text-xs text-slate-400 mb-4">Google Trends search interest (0–100, self-scaled per keyword, geo=LB) with the matching products in our catalog.</p>
        {searchTrends.length === 0 ? (
          <p className="text-sm text-slate-400 py-10 text-center">No data yet — click refresh above.</p>
        ) : (
          <ul className="divide-y divide-slate-100">
            {searchTrends.map((t) => {
              const matches = keywordMatches[t.keyword] ?? []
              return (
                <li key={t.keyword} className="py-2.5">
                  <div className="flex items-center justify-between gap-3">
                    <p className="text-sm text-slate-800 capitalize">{t.keyword}</p>
                    <div className="flex items-center gap-2 shrink-0">
                      <div className="w-20 h-1.5 bg-slate-100 rounded-full overflow-hidden">
                        <div className="h-full bg-blue-500 rounded-full" style={{ width: `${t.score}%` }} />
                      </div>
                      <span className="text-xs text-slate-500 tabular-nums w-6 text-right">{t.score}</span>
                      {t.direction === 'up' && <TrendingUp size={13} className="text-emerald-500" />}
                      {t.direction === 'down' && <TrendingDown size={13} className="text-red-500" />}
                      {t.direction === 'flat' && <Minus size={13} className="text-slate-300" />}
                    </div>
                  </div>
                  {matches.length > 0 ? (
                    <div className="mt-2 flex flex-wrap gap-1.5">
                      {matches.map((m) => (
                        <Link
                          key={m.id}
                          href={`/admin/products/${m.id}`}
                          title={m.name}
                          className="inline-flex items-center gap-1 max-w-[180px] text-[11px] bg-slate-50 hover:bg-blue-50 text-slate-600 hover:text-blue-700 rounded-full px-2 py-1 border border-slate-100 transition-colors"
                        >
                          <span className="truncate">{m.name}</span>
                          <span className="text-slate-300 shrink-0">·</span>
                          <span className="font-medium shrink-0">{m.priceOnRequest ? 'Call' : money(m.price)}</span>
                        </Link>
                      ))}
                    </div>
                  ) : (
                    <p className="mt-1.5 text-[11px] text-amber-600">No matching products in our catalog — possible gap.</p>
                  )}
                </li>
              )
            })}
          </ul>
        )}
      </div>
    </div>
  )
}
