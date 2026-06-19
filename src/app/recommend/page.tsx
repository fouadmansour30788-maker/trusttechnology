import { Sparkles } from 'lucide-react'
import { AiAdvisor } from '@/components/wizard/AiAdvisor'

export const metadata = {
  title: 'AI Product Advisor – Trust Technology',
  description: 'Describe what you need and our AI advisor recommends the perfect products from our catalog.',
}

export default function RecommendPage() {
  return (
    <div className="relative min-h-screen overflow-hidden">
      {/* Ambient background */}
      <div className="pointer-events-none absolute inset-0 bg-grid-light [mask-image:radial-gradient(ellipse_at_top,black,transparent_70%)]" />
      <div className="pointer-events-none absolute -top-20 left-1/2 -translate-x-1/2 w-[640px] h-[360px] bg-blue-300/30 blur-3xl rounded-full" />

      <div className="relative max-w-2xl mx-auto px-4 sm:px-6 py-12">
        <div className="text-center mb-8">
          <div className="inline-flex items-center gap-2 bg-white/70 backdrop-blur border border-blue-100 rounded-full px-4 py-1.5 text-sm text-blue-700 mb-4 shadow-sm">
            <Sparkles size={14} />
            AI-Powered · Recommends real products
          </div>
          <h1 className="text-4xl font-bold text-slate-900">Find Your Perfect Setup</h1>
          <p className="text-slate-500 mt-3 text-lg">
            Describe your needs in plain words — our advisor matches you with the best products from our catalog.
          </p>
        </div>

        <div className="glass-card border border-slate-200 rounded-3xl p-4 sm:p-6 shadow-xl shadow-slate-900/5">
          <AiAdvisor />
        </div>
      </div>
    </div>
  )
}
