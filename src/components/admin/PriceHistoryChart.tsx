'use client'
import { ResponsiveContainer, LineChart, Line, XAxis, YAxis, Tooltip, CartesianGrid, ReferenceLine } from 'recharts'
import type { HistoryPoint } from '@/lib/competitors'

// Fixed identity colors — one per competitor, never reassigned.
const COLORS: Record<string, string> = {
  mojitech: '#2a78d6',
  pcandparts: '#1baf7a',
  ayoubcomputers: '#eda100',
  multitech: '#008300',
  mediatech: '#4a3aa7',
}
const LABELS: Record<string, string> = {
  mojitech: 'Mojitech', pcandparts: 'PC and Parts', ayoubcomputers: 'Ayoub Computers',
  multitech: 'Multitech', mediatech: 'Mediatech',
}

export function PriceHistoryChart({ points, ourPrice }: { points: HistoryPoint[]; ourPrice: number }) {
  if (points.length < 2) return null

  // Merge into one row per day with a column per competitor
  const byDay = new Map<string, Record<string, number | string>>()
  const competitors = new Set<string>()
  for (const p of points) {
    const day = p.date.slice(0, 10)
    competitors.add(p.competitor)
    const row = byDay.get(day) ?? { day: new Date(day).toLocaleDateString('en-GB', { day: 'numeric', month: 'short' }) }
    row[p.competitor] = p.price
    byDay.set(day, row)
  }
  const data = [...byDay.values()]
  const series = [...competitors]

  return (
    <div className="mt-4">
      <p className="text-xs font-semibold text-slate-500 mb-2">Price history</p>
      <ResponsiveContainer width="100%" height={160}>
        <LineChart data={data} margin={{ top: 4, right: 8, bottom: 0, left: -8 }}>
          <CartesianGrid strokeDasharray="3 3" stroke="#f1f5f9" vertical={false} />
          <XAxis dataKey="day" tick={{ fontSize: 10, fill: '#94a3b8' }} axisLine={false} tickLine={false} />
          <YAxis tick={{ fontSize: 10, fill: '#94a3b8' }} axisLine={false} tickLine={false} width={44}
            domain={['auto', 'auto']} tickFormatter={(v) => `$${v}`} />
          <Tooltip
            contentStyle={{ borderRadius: 12, border: '1px solid #e2e8f0', fontSize: 12 }}
            formatter={(v, name) => [`$${Number(v).toLocaleString()}`, LABELS[String(name)] ?? name]}
          />
          {ourPrice > 0 && (
            <ReferenceLine y={ourPrice} stroke="#0f172a" strokeDasharray="4 4"
              label={{ value: `you $${ourPrice}`, position: 'insideTopRight', fontSize: 10, fill: '#475569' }} />
          )}
          {series.map((c) => (
            <Line key={c} dataKey={c} stroke={COLORS[c] ?? '#94a3b8'} strokeWidth={2}
              dot={{ r: 2.5, strokeWidth: 0, fill: COLORS[c] ?? '#94a3b8' }} connectNulls isAnimationActive={false} />
          ))}
        </LineChart>
      </ResponsiveContainer>
      {series.length > 1 && (
        <div className="flex flex-wrap gap-3 mt-1">
          {series.map((c) => (
            <span key={c} className="inline-flex items-center gap-1.5 text-[11px] text-slate-500">
              <span className="w-2 h-2 rounded-full" style={{ background: COLORS[c] ?? '#94a3b8' }} />
              {LABELS[c] ?? c}
            </span>
          ))}
        </div>
      )}
    </div>
  )
}
