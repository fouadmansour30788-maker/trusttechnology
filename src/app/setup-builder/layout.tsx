import type { Metadata } from 'next'
import { canonicalFor } from '@/lib/site'

// setup-builder/page.tsx is a client component (the AI wizard), so it
// can't export metadata itself -- see repairs/layout.tsx for the same pattern.
export const metadata: Metadata = {
  title: 'AI Setup Builder – Trust Technology',
  description: 'Tell us your budget and use case, and get a complete tech setup recommended by Trust Technology.',
  alternates: { canonical: canonicalFor('/setup-builder') },
}

export default function SetupBuilderLayout({ children }: { children: React.ReactNode }) {
  return children
}
