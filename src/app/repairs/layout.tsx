import type { Metadata } from 'next'
import { canonicalFor } from '@/lib/site'

// repairs/page.tsx is a client component (booking form + status tracker),
// so it can't export metadata itself -- a thin layout is the standard
// Next.js way to give a client-component route its own title/canonical
// instead of silently inheriting the root layout's homepage title.
export const metadata: Metadata = {
  title: 'Repairs & Service – Trust Technology',
  description: 'Book a repair or track your device’s service status at Trust Technology, Tripoli.',
  alternates: { canonical: canonicalFor('/repairs') },
}

export default function RepairsLayout({ children }: { children: React.ReactNode }) {
  return children
}
