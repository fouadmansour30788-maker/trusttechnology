'use client'
import { useEffect, useMemo, useRef, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { useRouter } from 'next/navigation'
import { Search, CornerDownLeft, Sparkles, Package, Mic } from 'lucide-react'
import { AnimatePresence, motion } from 'framer-motion'
import { CATALOG_PRODUCTS } from '@/data/products'

// Web Speech API (Chrome/Edge/Android). Feature-detected — the mic simply
// doesn't render where unsupported.
type SpeechRecognitionLike = {
  lang: string
  interimResults: boolean
  onresult: ((e: { results: { [i: number]: { [j: number]: { transcript: string } } } }) => void) | null
  onend: (() => void) | null
  onerror: (() => void) | null
  start: () => void
  stop: () => void
}
function getSpeechRecognition(): (new () => SpeechRecognitionLike) | null {
  if (typeof window === 'undefined') return null
  const w = window as unknown as { SpeechRecognition?: new () => SpeechRecognitionLike; webkitSpeechRecognition?: new () => SpeechRecognitionLike }
  return w.SpeechRecognition ?? w.webkitSpeechRecognition ?? null
}

type Hit = (typeof CATALOG_PRODUCTS)[number]

function scoreOf(p: Hit, q: string): number {
  const hay = (p.name + ' ' + (p.tags?.map((t) => t.name).join(' ') ?? '') + ' ' + Object.values(p.specs).join(' ')).toLowerCase()
  let score = 0
  if (p.name.toLowerCase().startsWith(q)) score += 100
  if (p.name.toLowerCase().includes(q)) score += 40
  // every query token must appear somewhere
  for (const tok of q.split(/\s+/).filter(Boolean)) {
    if (!hay.includes(tok)) return -1
    score += 5
  }
  if (p.images.length) score += 3
  return score
}

export function CommandPalette() {
  const [open, setOpen] = useState(false)
  const [q, setQ] = useState('')
  const [active, setActive] = useState(0)
  const [listening, setListening] = useState(false)
  const inputRef = useRef<HTMLInputElement>(null)
  const recRef = useRef<SpeechRecognitionLike | null>(null)
  const router = useRouter()
  const speechSupported = useMemo(() => getSpeechRecognition() !== null, [])

  function toggleVoice() {
    if (listening) {
      recRef.current?.stop()
      return
    }
    const SR = getSpeechRecognition()
    if (!SR) return
    const rec = new SR()
    recRef.current = rec
    rec.lang = 'en-US'
    rec.interimResults = true
    rec.onresult = (e) => {
      const transcript = e.results[0]?.[0]?.transcript ?? ''
      if (transcript) setQ(transcript)
    }
    rec.onend = () => setListening(false)
    rec.onerror = () => setListening(false)
    setListening(true)
    rec.start()
  }

  // Global hotkeys: ⌘K / Ctrl+K / "/"
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      const k = e.key.toLowerCase()
      const typing = ['input', 'textarea'].includes((e.target as HTMLElement)?.tagName?.toLowerCase())
      if ((k === 'k' && (e.metaKey || e.ctrlKey)) || (k === '/' && !typing)) {
        e.preventDefault()
        setOpen((o) => !o)
      }
      if (k === 'escape') setOpen(false)
    }
    window.addEventListener('keydown', onKey)
    // let the navbar search button open it too
    const openHandler = () => setOpen(true)
    window.addEventListener('open-command-palette', openHandler)
    return () => {
      window.removeEventListener('keydown', onKey)
      window.removeEventListener('open-command-palette', openHandler)
    }
  }, [])

  useEffect(() => {
    if (open) setTimeout(() => inputRef.current?.focus(), 30)
    else { setQ(''); setActive(0) }
  }, [open])

  const results = useMemo<Hit[]>(() => {
    const query = q.trim().toLowerCase()
    if (!query) return CATALOG_PRODUCTS.filter((p) => p.images.length).slice(0, 6)
    return CATALOG_PRODUCTS
      .map((p) => [p, scoreOf(p, query)] as const)
      .filter(([, s]) => s >= 0)
      .sort((a, b) => b[1] - a[1])
      .slice(0, 8)
      .map(([p]) => p)
  }, [q])

  useEffect(() => setActive(0), [q])

  function go(p: Hit) {
    setOpen(false)
    router.push(`/products/${p.slug}`)
  }

  function onInputKey(e: React.KeyboardEvent) {
    if (e.key === 'ArrowDown') { e.preventDefault(); setActive((a) => Math.min(a + 1, results.length)) }
    if (e.key === 'ArrowUp') { e.preventDefault(); setActive((a) => Math.max(a - 1, 0)) }
    if (e.key === 'Enter') {
      e.preventDefault()
      if (active >= results.length) { setOpen(false); router.push(`/products?q=${encodeURIComponent(q)}`) }
      else if (results[active]) go(results[active])
    }
  }

  return (
    <AnimatePresence>
      {open && (
        <motion.div
          initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
          className="fixed inset-0 z-[100] flex items-start justify-center pt-[12vh] px-4 bg-slate-900/30 backdrop-blur-sm"
          onClick={() => setOpen(false)}
        >
          <motion.div
            initial={{ opacity: 0, y: -16, scale: 0.98 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: -16, scale: 0.98 }}
            transition={{ duration: 0.18, ease: [0.22, 1, 0.36, 1] }}
            onClick={(e) => e.stopPropagation()}
            className="w-full max-w-xl bg-white rounded-2xl shadow-2xl shadow-slate-900/20 ring-1 ring-slate-200 overflow-hidden"
          >
            <div className="flex items-center gap-3 px-4 border-b border-slate-100">
              <Search size={18} className="text-slate-400 shrink-0" />
              <input
                ref={inputRef}
                value={q}
                onChange={(e) => setQ(e.target.value)}
                onKeyDown={onInputKey}
                placeholder={listening ? 'Listening…' : 'Search 186 products…'}
                className="flex-1 py-4 text-slate-900 placeholder-slate-400 outline-none bg-transparent"
              />
              {speechSupported && (
                <button
                  onClick={toggleVoice}
                  title={listening ? 'Stop listening' : 'Search by voice'}
                  className={`p-2 rounded-lg transition-colors shrink-0 ${listening ? 'bg-red-50 text-red-600 animate-pulse' : 'text-slate-400 hover:text-blue-600 hover:bg-blue-50'}`}
                >
                  <Mic size={16} />
                </button>
              )}
              <kbd className="hidden sm:block text-[10px] font-medium text-slate-400 bg-slate-100 px-1.5 py-1 rounded">ESC</kbd>
            </div>

            <div className="max-h-[55vh] overflow-y-auto p-2">
              {results.map((p, i) => {
                const onRequest = p.priceOnRequest || p.price === 0
                return (
                  <button
                    key={p.slug}
                    onMouseEnter={() => setActive(i)}
                    onClick={() => go(p)}
                    className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-left transition-colors ${
                      active === i ? 'bg-blue-50' : 'hover:bg-slate-50'
                    }`}
                  >
                    <div className="w-11 h-11 rounded-lg bg-slate-100 overflow-hidden relative shrink-0 flex items-center justify-center">
                      {p.images[0] ? (
                        <Image src={p.images[0]} alt={p.name} fill className="object-cover" sizes="44px" />
                      ) : (
                        <Package size={16} className="text-slate-300" />
                      )}
                    </div>
                    <div className="min-w-0 flex-1">
                      <p className="text-sm font-medium text-slate-900 truncate">{p.name}</p>
                      <p className="text-xs text-slate-400 truncate">
                        {p.tags?.find((t) => t.type === 'brand')?.name ?? 'Trust Tech'}
                        {Object.values(p.specs)[0] ? ` · ${Object.values(p.specs)[0]}` : ''}
                      </p>
                    </div>
                    <span className={`text-sm font-semibold shrink-0 ${onRequest ? 'text-blue-600' : 'text-slate-900'}`}>
                      {onRequest ? 'Call' : `$${p.price.toFixed(0)}`}
                    </span>
                    {active === i && <CornerDownLeft size={14} className="text-blue-400 shrink-0" />}
                  </button>
                )
              })}

              {/* AI escape hatch */}
              <Link
                href="/recommend"
                onClick={() => setOpen(false)}
                onMouseEnter={() => setActive(results.length)}
                className={`w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-left transition-colors mt-1 ${
                  active === results.length ? 'bg-blue-50' : 'hover:bg-slate-50'
                }`}
              >
                <div className="w-11 h-11 rounded-lg bg-gradient-to-br from-blue-600 to-blue-800 flex items-center justify-center shrink-0">
                  <Sparkles size={16} className="text-white" />
                </div>
                <div className="flex-1">
                  <p className="text-sm font-medium text-slate-900">
                    {q ? `Ask AI: “${q}”` : 'Not sure? Ask our AI advisor'}
                  </p>
                  <p className="text-xs text-slate-400">Describe your needs and get a real recommendation</p>
                </div>
              </Link>

              {q && results.length === 0 && (
                <p className="text-center text-sm text-slate-400 py-6">No products match — try the AI advisor above.</p>
              )}
            </div>

            <div className="flex items-center gap-4 px-4 py-2.5 border-t border-slate-100 text-[11px] text-slate-400">
              <span><kbd className="font-sans">↑↓</kbd> navigate</span>
              <span><kbd className="font-sans">↵</kbd> open</span>
              <span className="ml-auto"><kbd className="font-sans">⌘K</kbd> / <kbd className="font-sans">/</kbd> toggle</span>
            </div>
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  )
}
