import { notFound } from 'next/navigation'
import Link from 'next/link'
import type { Metadata } from 'next'
import { ArrowRight, ChevronRight } from 'lucide-react'
import { GUIDES } from '@/lib/guides'
import { SITE_URL } from '@/lib/site'

export function generateStaticParams() {
  return GUIDES.map((g) => ({ slug: g.slug }))
}

export async function generateMetadata({ params }: { params: Promise<{ slug: string }> }): Promise<Metadata> {
  const { slug } = await params
  const g = GUIDES.find((x) => x.slug === slug)
  if (!g) return { title: 'Guide' }
  return {
    title: `${g.title} – Trust Technology`,
    description: g.description,
    alternates: { canonical: `${SITE_URL}/guides/${g.slug}` },
    openGraph: { title: g.title, description: g.description, url: `${SITE_URL}/guides/${g.slug}` },
  }
}

export default async function GuidePage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params
  const g = GUIDES.find((x) => x.slug === slug)
  if (!g) notFound()

  const ld = {
    '@context': 'https://schema.org',
    '@type': 'Article',
    headline: g.title,
    description: g.description,
    author: { '@type': 'Organization', name: 'Trust Technology' },
    publisher: { '@type': 'Organization', name: 'Trust Technology' },
    mainEntityOfPage: `${SITE_URL}/guides/${g.slug}`,
  }

  return (
    <article className="max-w-3xl mx-auto px-4 sm:px-6 py-12">
      <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(ld) }} />
      <nav className="flex items-center gap-1 text-xs text-slate-400 mb-8">
        <Link href="/" className="hover:text-blue-600">Home</Link>
        <ChevronRight size={12} />
        <Link href="/guides" className="hover:text-blue-600">Guides</Link>
      </nav>

      <p className="text-4xl mb-4">{g.emoji}</p>
      <h1 className="text-3xl sm:text-4xl font-bold text-slate-900 leading-tight">{g.title}</h1>
      <p className="text-slate-500 mt-3 text-lg leading-relaxed">{g.description}</p>
      <p className="text-xs text-slate-400 mt-2">Updated {g.updated} · by the Trust Technology team, Tripoli</p>

      <div className="mt-10 space-y-10">
        {g.sections.map((s) => (
          <section key={s.heading}>
            <h2 className="text-xl font-bold text-slate-900 mb-3">{s.heading}</h2>
            {s.paragraphs.map((p, i) => (
              <p key={i} className="text-slate-600 leading-relaxed mb-3">{p}</p>
            ))}
          </section>
        ))}
      </div>

      <div className="mt-12 bg-gradient-to-br from-blue-600 to-blue-800 rounded-2xl p-6 text-center">
        <p className="text-white font-semibold mb-4">Ready to choose?</p>
        <Link href={g.cta.href}
          className="inline-flex items-center gap-2 bg-white text-blue-700 font-semibold px-6 py-3 rounded-xl hover:bg-blue-50 transition-colors">
          {g.cta.label} <ArrowRight size={15} />
        </Link>
      </div>
    </article>
  )
}
