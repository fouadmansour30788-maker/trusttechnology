'use client'
import Link from 'next/link'
import { motion } from 'framer-motion'
import type { ReactNode } from 'react'

type Props = {
  icon: ReactNode
  title: string
  subtitle?: string
  children: ReactNode
}

/** Shared shell for the sign-in/create-account cards — centered on a
 * faint spotlight glow, matching the language used across the rest of
 * the storefront rather than a bare white box. */
export function AuthCard({ icon, title, subtitle, children }: Props) {
  return (
    <div className="min-h-[70vh] flex items-center justify-center px-4 py-16 relative overflow-hidden">
      <div className="pointer-events-none absolute inset-0 bg-grid-light [mask-image:radial-gradient(ellipse_at_center,black,transparent_70%)]" />
      <div className="pointer-events-none absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[420px] h-[420px] rounded-full bg-[radial-gradient(closest-side,#2563eb1a,transparent_70%)] blur-2xl -z-10" />
      <motion.div
        initial={{ opacity: 0, y: 16 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5, ease: [0.22, 1, 0.36, 1] }}
        className="w-full max-w-sm relative"
      >
        <div className="bg-white border border-slate-200 rounded-3xl shadow-glow p-7">
          <span className="inline-flex w-12 h-12 rounded-2xl bg-blue-50 items-center justify-center mb-4 text-blue-600">
            {icon}
          </span>
          <h1 className="font-bold text-slate-900 text-xl tracking-tight">{title}</h1>
          {subtitle && <p className="text-sm text-slate-500 mt-1 mb-5">{subtitle}</p>}
          {children}
        </div>

        <Link href="/" className="block text-center text-sm text-slate-400 hover:text-slate-600 mt-5">
          ← Back to store
        </Link>
      </motion.div>
    </div>
  )
}
