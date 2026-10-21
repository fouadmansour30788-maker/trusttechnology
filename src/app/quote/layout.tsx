import type { Metadata } from 'next'
import { canonicalFor } from '@/lib/site'

// quote/page.tsx is a client component (the request form), so it can't
// export metadata itself -- see repairs/layout.tsx for the same pattern.
export const metadata: Metadata = {
  title: 'Business & Bulk Order Quotes – Trust Technology',
  description: 'Request a quote for business, corporate or bulk technology orders from Trust Technology, Tripoli.',
  alternates: { canonical: canonicalFor('/quote') },
}

export default function QuoteLayout({ children }: { children: React.ReactNode }) {
  return children
}
