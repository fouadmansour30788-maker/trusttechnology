import type { Metadata } from 'next'
import { Sora, Inter } from 'next/font/google'
import './globals.css'
import { Navbar } from '@/components/layout/Navbar'
import { Footer } from '@/components/layout/Footer'
import { CartDrawer } from '@/components/cart/CartDrawer'
import { CommandPalette } from '@/components/search/CommandPalette'

const display = Sora({ subsets: ['latin'], weight: ['500', '600', '700', '800'], variable: '--font-display' })
const body = Inter({ subsets: ['latin'], variable: '--font-body' })

export const metadata: Metadata = {
  title: "Trust Technology – Tripoli's Premier Tech Store",
  description: 'Premium laptops, POS systems, printers, displays and accessories. Serving Tripoli and Lebanon.',
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${display.variable} ${body.variable}`}>
      <body className="text-slate-900 min-h-screen flex flex-col antialiased relative z-0">
        <Navbar />
        <main className="flex-1">{children}</main>
        <Footer />
        <CartDrawer />
        <CommandPalette />
      </body>
    </html>
  )
}
