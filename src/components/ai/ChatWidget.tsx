'use client'
import { useEffect, useRef, useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { usePathname } from 'next/navigation'
import { Sparkles, X, Send, Loader2, Package } from 'lucide-react'
import { AnimatePresence, motion } from 'framer-motion'

type Rec = { slug: string; name: string; price: number; priceOnRequest?: boolean; images: string[]; reason: string }
type Msg = { role: 'user' | 'assistant'; content: string; products?: Rec[] }

const STARTERS = ['Laptop for video editing under $1500', 'POS system for a café', '4K monitor for design']

export function ChatWidget() {
  const pathname = usePathname()
  const [open, setOpen] = useState(false)
  const [messages, setMessages] = useState<Msg[]>([])
  const [input, setInput] = useState('')
  const [loading, setLoading] = useState(false)
  const scrollRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    scrollRef.current?.scrollTo({ top: scrollRef.current.scrollHeight, behavior: 'smooth' })
  }, [messages, loading, open])

  // Don't show the storefront assistant inside the back office.
  if (pathname?.startsWith('/admin')) return null

  async function send(text: string) {
    const q = text.trim()
    if (!q || loading) return
    const history = [...messages, { role: 'user' as const, content: q }]
    setMessages(history)
    setInput('')
    setLoading(true)
    try {
      const res = await fetch('/api/recommend', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ messages: history.map(({ role, content }) => ({ role, content })) }),
      })
      const data = await res.json()
      setMessages((m) => [...m, { role: 'assistant', content: data.reply, products: data.products ?? [] }])
    } catch {
      setMessages((m) => [...m, { role: 'assistant', content: 'Sorry — something went wrong. Try again.' }])
    } finally {
      setLoading(false)
    }
  }

  return (
    <>
      {/* Launcher */}
      <button
        onClick={() => setOpen((o) => !o)}
        aria-label="Open AI assistant"
        className="fixed bottom-5 right-5 z-[90] w-14 h-14 rounded-2xl bg-gradient-to-br from-blue-600 to-indigo-600 text-white shadow-glow flex items-center justify-center hover:scale-105 active:scale-95 transition-transform"
      >
        <AnimatePresence mode="wait">
          {open ? (
            <motion.span key="x" initial={{ rotate: -90, opacity: 0 }} animate={{ rotate: 0, opacity: 1 }} exit={{ rotate: 90, opacity: 0 }}><X size={22} /></motion.span>
          ) : (
            <motion.span key="s" initial={{ scale: 0.5, opacity: 0 }} animate={{ scale: 1, opacity: 1 }} exit={{ scale: 0.5, opacity: 0 }}><Sparkles size={22} /></motion.span>
          )}
        </AnimatePresence>
        {!open && <span className="absolute -top-0.5 -right-0.5 w-3 h-3 rounded-full bg-emerald-400 ring-2 ring-white animate-pulse" />}
      </button>

      <AnimatePresence>
        {open && (
          <motion.div
            initial={{ opacity: 0, y: 20, scale: 0.96 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 20, scale: 0.96 }}
            transition={{ duration: 0.2, ease: [0.22, 1, 0.36, 1] }}
            className="fixed bottom-24 right-5 z-[90] w-[min(92vw,380px)] h-[min(70vh,560px)] flex flex-col bg-white rounded-3xl shadow-2xl shadow-slate-900/20 ring-1 ring-slate-200 overflow-hidden"
          >
            {/* Header */}
            <div className="flex items-center gap-3 px-4 py-3 bg-gradient-to-r from-blue-600 to-indigo-600 text-white">
              <div className="w-9 h-9 rounded-xl bg-white/15 flex items-center justify-center"><Sparkles size={18} /></div>
              <div>
                <p className="font-semibold text-sm leading-none">Tech Advisor</p>
                <p className="text-[11px] text-blue-100 mt-1">Ask for a recommendation</p>
              </div>
            </div>

            {/* Messages */}
            <div ref={scrollRef} className="flex-1 overflow-y-auto p-3 space-y-3 bg-slate-50/50">
              {messages.length === 0 && (
                <div className="text-center py-6">
                  <p className="text-sm text-slate-500 mb-4">Hi! Tell me what you need and I&apos;ll find the right products.</p>
                  <div className="space-y-2">
                    {STARTERS.map((s) => (
                      <button key={s} onClick={() => send(s)} className="block w-full text-left text-sm text-slate-600 bg-white border border-slate-200 hover:border-blue-300 rounded-xl px-3 py-2 transition-colors">
                        {s}
                      </button>
                    ))}
                  </div>
                </div>
              )}

              {messages.map((m, i) => (
                <div key={i} className={m.role === 'user' ? 'flex justify-end' : ''}>
                  <div className={m.role === 'user'
                    ? 'bg-gradient-to-r from-blue-600 to-indigo-600 text-white rounded-2xl rounded-br-md px-3 py-2 text-sm max-w-[85%]'
                    : 'bg-white border border-slate-200 text-slate-700 rounded-2xl rounded-bl-md px-3 py-2 text-sm shadow-sm'}>
                    {m.content}
                  </div>
                  {m.products && m.products.length > 0 && (
                    <div className="mt-2 space-y-2">
                      {m.products.map((p) => {
                        const onReq = p.priceOnRequest || p.price === 0
                        return (
                          <Link key={p.slug} href={`/products/${p.slug}`} onClick={() => setOpen(false)} className="flex gap-2 items-center bg-white border border-slate-200 hover:border-blue-300 rounded-xl p-2 transition-colors">
                            <div className="w-11 h-11 rounded-lg bg-slate-100 relative overflow-hidden shrink-0 flex items-center justify-center">
                              {p.images[0] ? <Image src={p.images[0]} alt={p.name} fill className="object-cover" sizes="44px" /> : <Package size={15} className="text-slate-300" />}
                            </div>
                            <div className="min-w-0 flex-1">
                              <p className="text-xs font-medium text-slate-900 line-clamp-1">{p.name}</p>
                              <p className="text-[11px] text-slate-400 line-clamp-1">{p.reason}</p>
                            </div>
                            <span className={`text-xs font-semibold shrink-0 ${onReq ? 'text-blue-600' : 'text-slate-900'}`}>{onReq ? 'Call' : `$${p.price.toFixed(0)}`}</span>
                          </Link>
                        )
                      })}
                    </div>
                  )}
                </div>
              ))}

              {loading && <div className="flex items-center gap-2 text-slate-400 text-sm"><Loader2 size={15} className="animate-spin" /> Thinking…</div>}
            </div>

            {/* Composer */}
            <form onSubmit={(e) => { e.preventDefault(); send(input) }} className="p-3 border-t border-slate-100 flex items-center gap-2">
              <input value={input} onChange={(e) => setInput(e.target.value)} placeholder="Ask anything…" className="flex-1 bg-slate-100 rounded-xl px-3 py-2 text-sm text-slate-900 placeholder-slate-400 outline-none focus:bg-white focus:ring-1 focus:ring-blue-300" />
              <button type="submit" disabled={loading || !input.trim()} className="w-9 h-9 rounded-xl bg-gradient-to-r from-blue-600 to-indigo-600 text-white flex items-center justify-center disabled:opacity-40">
                <Send size={15} />
              </button>
            </form>
          </motion.div>
        )}
      </AnimatePresence>
    </>
  )
}
