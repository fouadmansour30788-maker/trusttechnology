import Link from 'next/link'
import { BookOpen, ArrowRight } from 'lucide-react'
import { GUIDES } from '@/lib/guides'
import { PageHeader } from '@/components/ui/PageHeader'

export const metadata = {
  title: 'Buying Guides – Trust Technology',
  description: 'Honest, Lebanon-specific tech buying guides — laptops for university, gaming machines, POS systems and more.',
}

export default function GuidesPage() {
  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 py-14">
      <PageHeader
        icon={<BookOpen size={22} />}
        title="Buying guides"
        subtitle="Honest advice written for buyers in Lebanon — no jargon, real budgets in USD."
      />

      <div className="grid sm:grid-cols-2 gap-4">
        {GUIDES.map((g) => (
          <Link key={g.slug} href={`/guides/${g.slug}`}
            className="group bg-white border border-slate-200 rounded-2xl p-6 hover:border-blue-200 hover:shadow-lg hover:shadow-blue-900/5 transition-all">
            <span className="text-3xl">{g.emoji}</span>
            <h2 className="font-bold text-slate-900 mt-3 leading-snug group-hover:text-blue-700 transition-colors">{g.title}</h2>
            <p className="text-sm text-slate-500 mt-2 leading-relaxed">{g.description}</p>
            <p className="inline-flex items-center gap-1 text-sm font-medium text-blue-600 mt-4">
              Read guide <ArrowRight size={14} className="group-hover:translate-x-0.5 transition-transform" />
            </p>
          </Link>
        ))}
      </div>
    </div>
  )
}
