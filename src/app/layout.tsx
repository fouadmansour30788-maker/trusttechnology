import type { Metadata } from 'next'
import './globals.css'
import { Navbar } from '@/components/layout/Navbar'
import { Footer } from '@/components/layout/Footer'
import { CartDrawer } from '@/components/cart/CartDrawer'
import { CommandPalette } from '@/components/search/CommandPalette'

export const metadata: Metadata = {
  title: "Trust Technology – Tripoli's Premier Tech Store",
  description: 'Premium laptops, POS systems, printers, displays and accessories. Serving Tripoli and Lebanon.',
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body className="text-slate-900 min-h-screen flex flex-col antialiased">
        <Navbar />
        <main className="flex-1">{children}</main>
        <Footer />
        <CartDrawer />
        <CommandPalette />
      </body>
    </html>
  )
}
