'use client'
import { useState } from 'react'
import { Sparkles, Loader2, CheckCircle2, MinusCircle, AlertTriangle } from 'lucide-react'

type Result = { verdict: 'great' | 'ok' | 'not-ideal'; summary: string; points: string[] }

const VERDICT = {
  great: { icon: CheckCircle2, cls: 'text-emerald-600', bg: 'bg-emerald-50 border-emerald-100', label: 'Great fit' },
  ok: { icon: MinusCircle, cls: 'text-amber-600', bg: 'bg-amber-50 border-amber-100', label: 'Works, with caveats' },
  'not-ideal': { icon: AlertTriangle, cls: 'text-red-600', bg: 'bg-red-50 border-red-100', label: 'Not the best fit' },
} as const

const SUGGESTIONS = ['University & office work', 'Gaming', 'Graphic design', 'Programming', 'Kids & homework']

/** "Will it work for me?" — AI verdict for this product against the shopper's use case. */
export function FitCheck({ slug }: { slug: string }) {
  const [useCase, setUseCase] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [result, setResult] = useState<Result | null>(null)

  async function check(text: string) {
    if (text.trim().length < 3 || loading) return
    setLoading(true)
    setError(null)
    setResult(null)
    try {
      const res = await fetch('/api/fit-check', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ slug, useCase: text }),
      })
      const data = await res.json()
      if (data.ok) setResult(data)
      else setError(typeof data.error === 'string' && data.error.length > 10 ? data.error : 'Could not check right now — try again.')
    } catch {
      setError('Could not check right now — try again.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="border border-slate-200 rounded-2xl p-5 bg-gradient-to-br from-blue-50/60 to-white">
      <div className="flex items-center gap-2 mb-1">
        <Sparkles size={15} className="text-blue-600" />
        <p className="font-semibold text-slate-900 text-sm">Will it work for me?</p>
      </div>
      <p className="text-xs text-slate-400 mb-3">Tell us what you’ll use it for — our AI checks it against this exact model.</p>

      <form onSubmit={(e) => { e.preventDefault(); check(useCase) }} className="flex gap-2">
        <input
          value={useCase}
          onChange={(e) => setUseCase(e.target.value)}
          placeholder="e.g. AutoCAD and 3D rendering"
          maxLength={200}
          className="flex-1 bg-white border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-900 outline-none focus:border-blue-400"
        />
        <button type="submit" disabled={loading || useCase.trim().length < 3}
          className="inline-flex items-center gap-1.5 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-4 py-2.5 rounded-xl transition-colors disabled:opacity-50">
          {loading ? <Loader2 size={14} className="animate-spin" /> : <Sparkles size={14} />} Check
        </button>
      </form>

      {!result && !loading && (
        <div className="flex flex-wrap gap-1.5 mt-3">
          {SUGGESTIONS.map((s) => (
            <button key={s} onClick={() => { setUseCase(s); check(s) }}
              className="text-xs text-slate-500 bg-white border border-slate-200 hover:border-blue-300 hover:text-blue-700 rounded-full px-3 py-1 transition-colors">
              {s}
            </button>
          ))}
        </div>
      )}

      {error && <p className="text-sm text-red-600 mt-3">{error}</p>}

      {result && (() => {
        const v = VERDICT[result.verdict]
        const Icon = v.icon
        return (
          <div className={`mt-4 border rounded-xl p-4 ${v.bg}`}>
            <p className={`flex items-center gap-1.5 text-sm font-bold ${v.cls}`}>
              <Icon size={16} /> {v.label}
            </p>
            <p className="text-sm text-slate-700 mt-1.5 leading-relaxed">{result.summary}</p>
            {result.points.length > 0 && (
              <ul className="mt-2 space-y-1">
                {result.points.map((p, i) => (
                  <li key={i} className="text-xs text-slate-600 leading-relaxed pl-3 relative before:content-['•'] before:absolute before:left-0 before:text-slate-400">{p}</li>
                ))}
              </ul>
            )}
          </div>
        )
      })()}
    </div>
  )
}
