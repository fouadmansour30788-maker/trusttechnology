import Link from 'next/link'
import { TrustoAvatar } from '@/components/trusto/TrustoAvatar'

export default function NotFound() {
  return (
    <div className="min-h-[70vh] flex flex-col items-center justify-center px-4 text-center gap-4">
      <TrustoAvatar mood="confused" size={88} />
      <h1 className="text-2xl font-bold text-slate-900">Trusto couldn't find that page</h1>
      <p className="text-slate-500 max-w-sm">It may have moved, or the link's outdated. Let's get you back on track.</p>
      <div className="flex gap-3 mt-2">
        <Link href="/" className="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-2.5 rounded-xl transition-colors">
          Back to store
        </Link>
        <Link href="/products" className="border border-slate-200 hover:border-blue-300 text-slate-700 font-semibold px-5 py-2.5 rounded-xl transition-colors">
          Browse products
        </Link>
      </div>
    </div>
  )
}
