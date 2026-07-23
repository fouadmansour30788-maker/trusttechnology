'use client'
import { useEffect, useState } from 'react'
import { Timer, CheckCircle2 } from 'lucide-react'

type Stats = {
  available: boolean
  sampleSize?: number
  windowDays?: number
  targetHours?: number
  withinTargetPct?: number
  avgHours?: number
}

/** Real turnaround numbers from the repairs table — hidden until there's enough data to be meaningful. */
export function RepairStatsBanner() {
  const [stats, setStats] = useState<Stats | null>(null)

  useEffect(() => {
    let cancelled = false
    fetch('/api/repairs/stats')
      .then((r) => r.json())
      .then((data) => { if (!cancelled) setStats(data) })
      .catch(() => {})
    return () => { cancelled = true }
  }, [])

  if (!stats?.available) return null

  const avgLabel = stats.avgHours! < 24 ? `${Math.round(stats.avgHours!)}h` : `${Math.round(stats.avgHours! / 24)} days`

  return (
    <div className="mb-6 grid grid-cols-2 gap-3">
      <div className="flex items-center gap-3 bg-emerald-50 border border-emerald-100 rounded-2xl px-4 py-3.5">
        <CheckCircle2 size={20} className="text-emerald-600 shrink-0" />
        <div>
          <p className="text-lg font-bold text-emerald-900 leading-none">{stats.withinTargetPct}%</p>
          <p className="text-[11px] text-emerald-700 mt-1">ready within {stats.targetHours}h</p>
        </div>
      </div>
      <div className="flex items-center gap-3 bg-blue-50 border border-blue-100 rounded-2xl px-4 py-3.5">
        <Timer size={20} className="text-blue-600 shrink-0" />
        <div>
          <p className="text-lg font-bold text-blue-900 leading-none">{avgLabel}</p>
          <p className="text-[11px] text-blue-700 mt-1">average turnaround</p>
        </div>
      </div>
      <p className="col-span-2 text-[11px] text-slate-400 text-center -mt-1">
        Based on {stats.sampleSize} repairs completed in the last {stats.windowDays} days.
      </p>
    </div>
  )
}
