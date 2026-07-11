import Link from 'next/link'
import { CheckCircle2, AlertTriangle, AlertOctagon, Info, Lightbulb, ArrowRight } from 'lucide-react'
import type { Analytics } from '@/lib/analytics'

const TONE = {
  good: { icon: CheckCircle2, cls: 'text-emerald-600' },
  warning: { icon: AlertTriangle, cls: 'text-amber-600' },
  critical: { icon: AlertOctagon, cls: 'text-red-600' },
  info: { icon: Info, cls: 'text-blue-600' },
} as const

export function AutoAnalysis({ items }: { items: Analytics['analysis'] }) {
  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5 h-full">
      <p className="font-semibold text-slate-900 text-sm mb-4">Auto analysis</p>
      {items.length === 0 ? (
        <p className="text-sm text-slate-400">Nothing to analyse yet — data will appear as you record sales.</p>
      ) : (
        <ul className="space-y-3">
          {items.map((it, i) => {
            const { icon: Icon, cls } = TONE[it.tone]
            return (
              <li key={i} className="flex items-start gap-2.5">
                <Icon size={16} className={`${cls} mt-0.5 shrink-0`} />
                <span className="text-sm text-slate-600 leading-relaxed">{it.text}</span>
              </li>
            )
          })}
        </ul>
      )}
    </div>
  )
}

export function Recommendations({ items }: { items: Analytics['recommendations'] }) {
  return (
    <div className="bg-white border border-slate-200 rounded-2xl p-5 h-full">
      <div className="flex items-center gap-2 mb-4">
        <Lightbulb size={15} className="text-amber-500" />
        <p className="font-semibold text-slate-900 text-sm">Recommended actions</p>
      </div>
      {items.length === 0 ? (
        <p className="text-sm text-slate-400">No actions needed right now — everything looks healthy.</p>
      ) : (
        <ol className="space-y-3">
          {items.map((it, i) => (
            <li key={i} className="flex items-start gap-3">
              <span className="w-5 h-5 rounded-full bg-blue-50 text-blue-700 text-xs font-semibold flex items-center justify-center shrink-0 mt-0.5">
                {i + 1}
              </span>
              <span className="text-sm text-slate-600 leading-relaxed flex-1">
                {it.text}
                {it.href && (
                  <Link href={it.href} className="inline-flex items-center gap-0.5 ml-1.5 text-blue-600 hover:text-blue-700 font-medium whitespace-nowrap">
                    Open <ArrowRight size={12} />
                  </Link>
                )}
              </span>
            </li>
          ))}
        </ol>
      )}
    </div>
  )
}
