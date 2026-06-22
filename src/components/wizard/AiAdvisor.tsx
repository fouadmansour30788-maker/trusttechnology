'use client'
import { useRef, useState, useEffect } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { Send, Sparkles, Package, Loader2, MessageCircle } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'

type Rec = { slug: string; name: string; price: number; priceOnRequest?: boolean; images: string[]; reason: string }
type Msg = { role: 'user' | 'assistant'; content: string; products?: Rec[]; options?: string[] }

const STARTERS = [
  'A laptop for video editing under $1500',
  'A reliable POS system for a small café',
  'A 4K monitor for photo editing',
  'A business laptop with long battery life',
]

export function AiAdvisor() {
  const [messages, setMessages] = useState<Msg[]>([])
  const [input, setInput] = useState('')
  const [loading, setLoading] = useState(false)
  const scrollRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    scrollRef.current?.scrollTo({ top: scrollRef.current.scrollHeight, behavior: 'smooth' })
  }, [messages, loading])

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
      setMessages((m) => [...m, { role: 'assistant', content: data.reply, products: data.products ?? [], options: data.options ?? [] }])
    } catch {
      setMessages((m) => [...m, { role: 'assistant', content: 'Sorry — something went wrong. Please try again.' }])
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="flex flex-col h-[min(72vh,640px)]">
      {/* Conversation */}
      <div ref={scrollRef} className="flex-1 overflow-y-auto px-1 py-2 space-y-4">
        {messages.length === 0 && (
          <div className="h-full flex flex-col items-center justify-center text-center gap-5">
            <div className="w-14 h-14 rounded-2xl bg-gradient-to-br from-blue-600 to-blue-800 flex items-center justify-center shadow-lg shadow-blue-600/25">
              <Sparkles size={26} className="text-white" />
            </div>
            <div>
              <p className="text-slate-900 font-semibold text-lg">Tell me what you need</p>
              <p className="text-slate-500 text-sm mt-1">I&apos;ll recommend real products from our catalog.</p>
            </div>
            <div className="grid sm:grid-cols-2 gap-2 w-full max-w-lg">
              {STARTERS.map((s) => (
                <button
                  key={s}
                  onClick={() => send(s)}
                  className="text-left text-sm text-slate-600 bg-white border border-slate-200 hover:border-blue-300 hover:bg-blue-50/40 rounded-xl px-4 py-3 transition-colors"
                >
                  {s}
                </button>
              ))}
            </div>
          </div>
        )}

        <AnimatePresence initial={false}>
          {messages.map((m, i) => (
            <motion.div
              key={i}
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              className={m.role === 'user' ? 'flex justify-end' : 'flex justify-start'}
            >
              <div className={m.role === 'user' ? 'max-w-[85%]' : 'max-w-[92%] w-full'}>
                <div
                  className={
                    m.role === 'user'
                      ? 'bg-gradient-to-r from-blue-600 to-blue-800 text-white rounded-2xl rounded-br-md px-4 py-2.5 text-sm'
                      : 'bg-white border border-slate-200 text-slate-700 rounded-2xl rounded-bl-md px-4 py-3 text-sm leading-relaxed shadow-sm'
                  }
                >
                  {m.content}
                </div>

                {/* Recommended products */}
                {m.products && m.products.length > 0 && (
                  <div className="mt-3 grid gap-2.5">
                    {m.products.map((p) => {
                      const onRequest = p.priceOnRequest || p.price === 0
                      return (
                        <Link
                          key={p.slug}
                          href={`/products/${p.slug}`}
                          className="group flex gap-3 bg-white border border-slate-200 hover:border-blue-300 rounded-xl p-2.5 transition-colors shadow-sm"
                        >
                          <div className="w-16 h-16 rounded-lg bg-slate-100 overflow-hidden relative shrink-0 flex items-center justify-center">
                            {p.images[0] ? (
                              <Image src={p.images[0]} alt={p.name} fill className="object-cover" sizes="64px" />
                            ) : (
                              <Package size={18} className="text-slate-300" />
                            )}
                          </div>
                          <div className="min-w-0 flex-1">
                            <p className="text-sm font-medium text-slate-900 group-hover:text-blue-600 transition-colors line-clamp-1">{p.name}</p>
                            <p className="text-xs text-slate-500 line-clamp-2 mt-0.5">{p.reason}</p>
                          </div>
                          <span className={`text-sm font-semibold shrink-0 self-center ${onRequest ? 'text-blue-600' : 'text-slate-900'}`}>
                            {onRequest ? 'Call' : `$${p.price.toFixed(0)}`}
                          </span>
                        </Link>
                      )
                    })}
                  </div>
                )}

                {/* Quick-reply options */}
                {m.role === 'assistant' && m.options && m.options.length > 0 && i === messages.length - 1 && (
                  <div className="mt-3 flex flex-wrap gap-2">
                    {m.options.map((opt) => (
                      <button
                        key={opt}
                        onClick={() => send(opt)}
                        disabled={loading}
                        className="text-sm font-medium text-blue-700 bg-blue-50 hover:bg-blue-100 border border-blue-100 rounded-full px-4 py-2 transition-colors disabled:opacity-50"
                      >
                        {opt}
                      </button>
                    ))}
                  </div>
                )}
              </div>
            </motion.div>
          ))}
        </AnimatePresence>

        {loading && (
          <div className="flex items-center gap-2 text-slate-400 text-sm">
            <Loader2 size={16} className="animate-spin" /> Finding the best matches…
          </div>
        )}
      </div>

      {/* Composer */}
      <form
        onSubmit={(e) => { e.preventDefault(); send(input) }}
        className="mt-3 flex items-center gap-2 bg-white border border-slate-200 rounded-2xl px-3 py-2 shadow-sm focus-within:border-blue-400 transition-colors"
      >
        <input
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder="Describe what you need…"
          className="flex-1 bg-transparent outline-none text-sm text-slate-900 placeholder-slate-400 py-1.5"
        />
        <button
          type="submit"
          disabled={loading || !input.trim()}
          className="w-9 h-9 rounded-xl bg-gradient-to-r from-blue-600 to-blue-800 disabled:opacity-40 flex items-center justify-center text-white transition-opacity"
        >
          <Send size={16} />
        </button>
      </form>
      <p className="mt-2 text-center text-xs text-slate-400 inline-flex items-center justify-center gap-1">
        <MessageCircle size={11} /> Prefer a human? <a href={`https://wa.me/96171998983?text=${encodeURIComponent('Hi Trust Technology! I have a question.')}`} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:underline">Chat on WhatsApp</a>
      </p>
    </div>
  )
}
