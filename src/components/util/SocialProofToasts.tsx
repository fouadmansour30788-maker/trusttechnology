'use client'
import { useEffect, useRef, useState } from 'react'
import { usePathname } from 'next/navigation'
import { ShoppingBag, X } from 'lucide-react'

type Ev = { product: string; region: string; ago: string }

const MAX_SHOWS = 3
const FIRST_DELAY = 12_000
const GAP = 30_000
const VISIBLE_FOR = 6_000

/** Rotating "someone just ordered…" toasts from real (anonymized) recent orders. */
export function SocialProofToasts() {
  const pathname = usePathname()
  const [current, setCurrent] = useState<Ev | null>(null)
  const [dismissed, setDismissed] = useState(false)
  const events = useRef<Ev[]>([])
  const shown = useRef(0)

  useEffect(() => {
    if (dismissed) return
    const timers: ReturnType<typeof setTimeout>[] = []
    let cancelled = false

    async function start() {
      try {
        const res = await fetch('/api/social-proof')
        const data = await res.json()
        events.current = (data.events ?? []) as Ev[]
      } catch {
        return
      }
      if (cancelled || events.current.length === 0) return

      function scheduleNext(delay: number) {
        timers.push(setTimeout(() => {
          if (cancelled || shown.current >= MAX_SHOWS || events.current.length === 0) return
          const ev = events.current[shown.current % events.current.length]
          shown.current += 1
          setCurrent(ev)
          timers.push(setTimeout(() => setCurrent(null), VISIBLE_FOR))
          if (shown.current < MAX_SHOWS) scheduleNext(GAP)
        }, delay))
      }
      scheduleNext(FIRST_DELAY)
    }
    start()
    return () => { cancelled = true; timers.forEach(clearTimeout) }
  }, [dismissed])

  // Never on admin / checkout flows — don't distract a buyer mid-purchase.
  if (dismissed || !current || pathname.startsWith('/admin') || pathname.startsWith('/checkout') || pathname === '/compare') return null

  return (
    <div className="fixed bottom-4 left-4 z-40 max-w-[300px] bg-white border border-slate-200 rounded-2xl shadow-2xl shadow-slate-900/15 p-3.5 flex items-start gap-3 animate-[slideup_.4s_ease]">
      <span className="w-9 h-9 rounded-xl bg-blue-50 flex items-center justify-center shrink-0">
        <ShoppingBag size={16} className="text-blue-600" />
      </span>
      <div className="min-w-0 flex-1">
        <p className="text-xs text-slate-800 leading-relaxed">
          Someone in <span className="font-semibold">{current.region}</span> ordered{' '}
          <span className="font-semibold line-clamp-2">{current.product}</span>
        </p>
        <p className="text-[10px] text-slate-400 mt-0.5">{current.ago} · verified order</p>
      </div>
      <button onClick={() => { setDismissed(true); setCurrent(null) }} className="text-slate-300 hover:text-slate-500 shrink-0">
        <X size={13} />
      </button>
      <style jsx>{`
        @keyframes slideup { from { transform: translateY(12px); opacity: 0 } to { transform: translateY(0); opacity: 1 } }
      `}</style>
    </div>
  )
}
