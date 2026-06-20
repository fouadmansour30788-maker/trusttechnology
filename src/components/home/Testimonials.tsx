'use client'
import { motion } from 'framer-motion'
import { Quote } from 'lucide-react'

type Review = { title: string; body: string; name: string; role: string; gradient: string }

const REVIEWS: Review[] = [
  {
    title: 'Fast and Truly Hassle-Free',
    body: 'They repaired my laptop screen in under two hours, and the process was smooth and stress-free. Communication and honest pricing stood out.',
    name: 'Michael R.', role: 'Small business owner', gradient: 'from-blue-400 to-blue-700',
  },
  {
    title: 'Better Than Expected',
    body: 'My laptop had been slow for months, but they diagnosed it quickly and got it running like new the same day. Truly impressive service.',
    name: 'Samantha T.', role: 'Graphic designer', gradient: 'from-blue-400 to-blue-500',
  },
  {
    title: 'Highly Recommend',
    body: 'Bought a full POS setup for my café. The team helped me pick exactly what I needed and set it all up. Everything just works.',
    name: 'Karim H.', role: 'Café owner', gradient: 'from-blue-400 to-blue-500',
  },
  {
    title: 'Super Quick Turnaround',
    body: 'Ordered two monitors and a dock on Tuesday — delivered to my office in Tripoli the next morning. Genuine products, great price.',
    name: 'Lara A.', role: 'Architect', gradient: 'from-blue-400 to-blue-500',
  },
  {
    title: 'The Wizard Nailed It',
    body: 'I had no idea what laptop to get for engineering. Answered three questions and it recommended the perfect machine within my budget.',
    name: 'Omar D.', role: 'Engineering student', gradient: 'from-blue-500 to-blue-800',
  },
  {
    title: 'Genuine Experts',
    body: 'What I appreciated most was the honest advice — they steered me to a cheaper model that fit my needs instead of upselling. Rare these days.',
    name: 'Nadia S.', role: 'Photographer', gradient: 'from-blue-400 to-blue-500',
  },
]

export function Testimonials() {
  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 py-20">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: '-80px' }}
        transition={{ duration: 0.5 }}
        className="text-center max-w-2xl mx-auto mb-12"
      >
        <p className="text-xs uppercase tracking-widest text-blue-600 font-semibold mb-2">Loved across Lebanon</p>
        <h2 className="text-3xl md:text-4xl font-bold text-slate-900">What our customers say</h2>
        <p className="text-slate-500 mt-3">Real reviews from people and businesses we&apos;ve helped.</p>
      </motion.div>

      <div className="columns-1 md:columns-2 lg:columns-3 gap-5 [column-fill:_balance]">
        {REVIEWS.map((r, i) => (
          <motion.div
            key={r.name}
            initial={{ opacity: 0, y: 24 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: '-40px' }}
            transition={{ duration: 0.5, delay: (i % 3) * 0.08, ease: [0.22, 1, 0.36, 1] }}
            className="mb-5 break-inside-avoid rounded-3xl bg-white border border-slate-200 p-6 shadow-sm hover:shadow-xl hover:shadow-slate-900/5 transition-shadow"
          >
            <Quote size={28} className="text-blue-200 fill-blue-100" />
            <h3 className="mt-4 text-lg font-bold text-slate-900 leading-snug">{r.title}</h3>
            <p className="mt-3 text-slate-500 text-sm leading-relaxed">{r.body}</p>
            <div className="mt-6 flex items-center gap-3">
              <span className={`w-9 h-9 rounded-full bg-gradient-to-br ${r.gradient} flex items-center justify-center text-white text-xs font-bold ring-2 ring-white shadow`}>
                {r.name.charAt(0)}
              </span>
              <div>
                <p className="text-sm font-semibold text-slate-900 leading-none">{r.name}</p>
                <p className="text-xs text-slate-400 mt-1">{r.role}</p>
              </div>
            </div>
          </motion.div>
        ))}
      </div>
    </section>
  )
}
