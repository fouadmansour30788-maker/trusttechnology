'use client'
import { useEffect, useState, useCallback } from 'react'
import { Sparkles, RefreshCw, Loader2 } from 'lucide-react'

// Tiny markdown: **bold** + "- " bullets.
function render(md: string) {
  const lines = md.split('\n').filter((l) => l.trim())
  return lines.map((line, i) => {
    const html = line.replace(/^[-*]\s+/, '').replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
    const isBullet = /^[-*]\s+/.test(line)
    return isBullet ? (
      <li key={i} className="ml-1 pl-1 text-sm text-slate-600 leading-relaxed list-disc list-inside" dangerouslySetInnerHTML={{ __html: html }} />
    ) : (
      <p key={i} className="text-sm text-slate-800 leading-relaxed font-medium" dangerouslySetInnerHTML={{ __html: html }} />
    )
  })
}

export function AiInsights() {
  const [text, setText] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)
  const [notConfigured, setNotConfigured] = useState<string | null>(null)

  const load = useCallback(async () => {
    setLoading(true)
    setNotConfigured(null)
    try {
      const res = await fetch('/api/insights', { cache: 'no-store' })
      const data = await res.json()
      if (data.notConfigured) setNotConfigured(data.notConfigured)
      setText(data.insights ?? null)
    } catch {
      setText(null)
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => { load() }, [load])

  return (
    <div className="relative overflow-hidden bg-gradient-to-br from-blue-600 to-blue-900 rounded-2xl p-5 text-white shadow-glow">
      <div className="absolute -top-12 -right-8 w-48 h-48 rounded-full bg-white/10 blur-2xl" />
      <div className="relative">
        <div className="flex items-center gap-2 mb-3">
          <Sparkles size={16} />
          <span className="font-semibold text-sm">AI Insights</span>
          <button onClick={load} disabled={loading} className="ml-auto inline-flex items-center gap-1 text-xs text-blue-100 hover:text-white disabled:opacity-50">
            <RefreshCw size={12} className={loading ? 'animate-spin' : ''} /> Refresh
          </button>
        </div>

        {loading ? (
          <div className="flex items-center gap-2 text-blue-100 text-sm py-4"><Loader2 size={15} className="animate-spin" /> Analysing your data…</div>
        ) : notConfigured === 'gemini' ? (
          <p className="text-blue-100 text-sm">Add a <code className="bg-white/15 px-1 rounded">GEMINI_API_KEY</code> to enable automatic analysis.</p>
        ) : text ? (
          <div className="bg-white/95 text-slate-800 rounded-xl p-4 space-y-2">{render(text)}</div>
        ) : (
          <p className="text-blue-100 text-sm">No insights available yet — record a few sales and refresh.</p>
        )}
      </div>
    </div>
  )
}
