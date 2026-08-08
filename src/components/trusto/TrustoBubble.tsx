'use client'
import Link from 'next/link'
import { X } from 'lucide-react'
import { AnimatePresence, motion } from 'framer-motion'
import { TrustoAvatar, type TrustoMood } from './TrustoAvatar'

export function TrustoBubble({
  show, mood = 'idle', message, cta, onDismiss,
}: {
  show: boolean
  mood?: TrustoMood
  message: string
  cta?: { label: string; href?: string; onClick?: () => void }
  onDismiss: () => void
}) {
  return (
    <AnimatePresence>
      {show && (
        <motion.div
          initial={{ opacity: 0, y: 12, scale: 0.95 }}
          animate={{ opacity: 1, y: 0, scale: 1 }}
          exit={{ opacity: 0, y: 12, scale: 0.95 }}
          transition={{ duration: 0.2, ease: [0.22, 1, 0.36, 1] }}
          className="fixed bottom-24 right-5 z-[85] w-[min(88vw,300px)] bg-white rounded-2xl shadow-2xl shadow-slate-900/20 ring-1 ring-slate-200 p-4"
        >
          <button
            onClick={onDismiss}
            aria-label="Dismiss"
            className="absolute top-2 right-2 text-slate-300 hover:text-slate-500 p-1"
          >
            <X size={14} />
          </button>
          <div className="flex items-start gap-3 pr-3">
            <TrustoAvatar mood={mood} size={36} className="shrink-0" />
            <div className="min-w-0">
              <p className="text-sm text-slate-700 leading-snug">{message}</p>
              {cta && cta.href && (
                <Link
                  href={cta.href}
                  onClick={onDismiss}
                  className="inline-block mt-2 text-xs font-semibold text-blue-600 hover:text-blue-700"
                >
                  {cta.label} →
                </Link>
              )}
              {cta && cta.onClick && (
                <button
                  onClick={() => { cta.onClick!(); onDismiss() }}
                  className="inline-block mt-2 text-xs font-semibold text-blue-600 hover:text-blue-700"
                >
                  {cta.label} →
                </button>
              )}
            </div>
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  )
}
