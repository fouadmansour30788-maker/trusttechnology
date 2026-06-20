import Link from 'next/link'
import { Sparkles, MessageCircle } from 'lucide-react'
import { HeroSection } from '@/components/home/HeroSection'
import { BentoGrid } from '@/components/home/BentoGrid'
import { BrandMarquee } from '@/components/home/BrandMarquee'
import { WhyChooseUs } from '@/components/home/WhyChooseUs'
import { Testimonials } from '@/components/home/Testimonials'
import { ProductCard } from '@/components/products/ProductCard'
import { getProducts } from '@/lib/db'
import type { Product } from '@/lib/types'

// Preferred showcase (all carry photos); falls back to is_featured / first with images.
const FEATURED_SLUGS = [
  'dell-optiplex-aio-7420-24-non-touch',
  'philips-evnia-34m2c5500-crystalclear-images-with-ultrawide-q',
  'lenovo-legion-5-83nx0000us-storm-grey',
  'hp-victus-15-fa2082wm-mica-silver',
  'philips-346b1c',
  'apple-mhff4hn-a',
  'hp-hp-290-g9-ct6y4at',
  'philips-24m2n3200fq',
]

function pickFeatured(all: Product[]): Product[] {
  const bySlug = FEATURED_SLUGS.map((s) => all.find((p) => p.slug === s)).filter(Boolean) as Product[]
  if (bySlug.length >= 4) return bySlug.slice(0, 8)
  const flagged = all.filter((p) => p.is_featured && p.images.length)
  const withImg = all.filter((p) => p.images.length)
  return [...new Set([...bySlug, ...flagged, ...withImg])].slice(0, 8)
}

export const dynamic = 'force-dynamic'

export default async function HomePage() {
  const FEATURED_PRODUCTS = pickFeatured(await getProducts())
  return (
    <>
      <HeroSection />
      <BrandMarquee />
      <BentoGrid />
      <WhyChooseUs />

      {/* Featured Products */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 py-16">
        <div className="flex items-center justify-between mb-8">
          <div>
            <p className="text-xs uppercase tracking-widest text-blue-600 font-semibold mb-1">Hand-picked</p>
            <h2 className="text-3xl font-bold text-slate-900">Featured Products</h2>
          </div>
          <Link href="/products" className="text-sm font-medium text-blue-600 hover:text-blue-700 transition-colors">
            View all →
          </Link>
        </div>
        <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
          {FEATURED_PRODUCTS.map((p) => (
            <ProductCard key={p.id} product={p} />
          ))}
        </div>
      </section>

      <Testimonials />

      {/* Final CTA band */}
      <section className="max-w-7xl mx-auto px-4 sm:px-6 pb-20">
        <div className="relative overflow-hidden rounded-3xl bg-gradient-to-br from-blue-600 to-blue-900 p-10 md:p-14 shadow-2xl shadow-blue-600/20">
          <div className="absolute inset-0 bg-[linear-gradient(to_right,#ffffff14_1px,transparent_1px),linear-gradient(to_bottom,#ffffff14_1px,transparent_1px)] bg-[size:2.5rem_2.5rem] [mask-image:radial-gradient(ellipse_at_top_right,black,transparent_70%)]" />
          <div className="absolute -top-16 -right-10 w-72 h-72 rounded-full bg-white/10 blur-3xl" />
          <div className="relative flex flex-col md:flex-row items-start md:items-center justify-between gap-6">
            <div className="max-w-xl">
              <div className="inline-flex items-center gap-2 bg-white/15 text-white text-xs font-semibold uppercase tracking-widest px-3 py-1 rounded-full mb-4">
                <Sparkles size={12} /> Here to help
              </div>
              <h2 className="text-3xl md:text-4xl font-bold text-white leading-tight">Need help choosing the right tech?</h2>
              <p className="text-blue-100 mt-3 text-lg">
                Use our smart recommendation wizard, or chat with our team on WhatsApp — we reply within minutes.
              </p>
            </div>
            <div className="flex flex-col sm:flex-row gap-3 shrink-0">
              <Link
                href="/recommend"
                className="inline-flex items-center justify-center gap-2 bg-white text-blue-700 font-bold px-6 py-3.5 rounded-2xl hover:bg-blue-50 transition-colors"
              >
                <Sparkles size={18} /> Find My Setup
              </Link>
              <a
                href={`https://wa.me/96171998983?text=${encodeURIComponent('Hi Trust Technology! I need help choosing the right tech.')}`}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center justify-center gap-2 bg-white/10 hover:bg-white/20 text-white font-semibold px-6 py-3.5 rounded-2xl border border-white/20 transition-colors"
              >
                <MessageCircle size={18} /> WhatsApp
              </a>
            </div>
          </div>
        </div>
      </section>
    </>
  )
}
