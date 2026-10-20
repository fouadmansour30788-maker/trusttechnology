import type { ReactNode } from 'react'

type Props = {
  eyebrow?: ReactNode
  /** Pass a rendered element, e.g. `<ShieldCheck size={22} />` — not the
   * bare component — since a bare component reference (a function) can't
   * cross the server→client prop boundary from an async server page. */
  icon?: ReactNode
  title: ReactNode
  subtitle?: ReactNode
  center?: boolean
  className?: string
}

/** Shared listing/content-page header — bold title on a faint spotlight
 * glow, replacing the plain "eyebrow + text-3xl h1" pattern that was
 * repeated (with small variations) across a dozen pages.
 *
 * Plain element, no motion wrapper: this renders the page's H1, used on
 * every category/listing/content page in the site, so it must never sit
 * at opacity:0 in the server-rendered HTML waiting on JS hydration (see
 * the Oct 2026 audit's T05 finding — this was the single highest-impact
 * instance of that issue since it affects the H1 on dozens of pages). */
export function PageHeader({ eyebrow, icon, title, subtitle, center = false, className = '' }: Props) {
  return (
    <div className={`relative mb-8 ${center ? 'text-center' : ''} ${className}`}>
      <div className={`pointer-events-none absolute -top-10 w-64 h-64 rounded-full bg-[radial-gradient(closest-side,#2563eb18,transparent_70%)] blur-2xl -z-10 ${center ? 'left-1/2 -translate-x-1/2' : '-left-8'}`} />
      {icon && (
        <span className={`inline-flex w-12 h-12 rounded-2xl bg-blue-50 items-center justify-center mb-3 text-blue-600 ${center ? 'mx-auto' : ''}`}>
          {icon}
        </span>
      )}
      {eyebrow && (
        <p className="text-xs uppercase tracking-widest text-blue-600 font-semibold mb-1.5">{eyebrow}</p>
      )}
      <h1 className="text-4xl font-bold text-slate-900 tracking-tight">{title}</h1>
      {subtitle && <p className="text-slate-500 mt-2">{subtitle}</p>}
    </div>
  )
}
