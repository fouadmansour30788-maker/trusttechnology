import type { Metadata } from 'next'
import { Sora, Inter } from 'next/font/google'
import { Analytics } from '@vercel/analytics/next'
import { SpeedInsights } from '@vercel/speed-insights/next'
import './globals.css'
import { Navbar } from '@/components/layout/Navbar'
import { Footer } from '@/components/layout/Footer'
import { CartDrawer } from '@/components/cart/CartDrawer'
import { CommandPalette } from '@/components/search/CommandPalette'
import { ChatWidget } from '@/components/ai/ChatWidget'
import { SITE_URL, SITE_NAME, SITE_DESCRIPTION } from '@/lib/site'

const display = Sora({ subsets: ['latin'], weight: ['500', '600', '700', '800'], variable: '--font-display' })
const body = Inter({ subsets: ['latin'], variable: '--font-body' })

export const metadata: Metadata = {
  metadataBase: new URL(SITE_URL),
  title: { default: `${SITE_NAME} – Tripoli's Premier Tech Store`, template: `%s · ${SITE_NAME}` },
  description: SITE_DESCRIPTION,
  keywords: ['tech store Tripoli', 'laptops Lebanon', 'POS systems Lebanon', 'printers', 'monitors', 'MacBook', 'computers Lebanon', 'Trust Technology'],
  openGraph: {
    type: 'website', siteName: SITE_NAME, title: `${SITE_NAME} – Tripoli's Premier Tech Store`,
    description: SITE_DESCRIPTION, url: SITE_URL, locale: 'en_US',
  },
  twitter: { card: 'summary_large_image', title: SITE_NAME, description: SITE_DESCRIPTION },
  alternates: { canonical: SITE_URL },
}

const localBusinessLd = {
  '@context': 'https://schema.org',
  '@type': 'ElectronicsStore',
  name: SITE_NAME,
  description: SITE_DESCRIPTION,
  url: SITE_URL,
  telephone: '+961 71 998 983',
  address: { '@type': 'PostalAddress', addressLocality: 'Tripoli', addressCountry: 'LB' },
  areaServed: 'Lebanon',
  priceRange: '$$',
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${display.variable} ${body.variable}`}>
      <head>
        <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(localBusinessLd) }} />
      </head>
      <body className="text-slate-900 min-h-screen flex flex-col antialiased relative z-0">
        <Navbar />
        <main className="flex-1">{children}</main>
        <Footer />
        <CartDrawer />
        <CommandPalette />
        <ChatWidget />
        <Analytics />
        <SpeedInsights />
      </body>
    </html>
  )
}
