'use client'
import { useEffect } from 'react'
import { useRouter, usePathname } from 'next/navigation'
import { Heart } from 'lucide-react'
import { useWishlistStore } from '@/store/wishlist'

/** Compact icon-only variant (product card overlay) or labeled variant (product detail page). */
export function WishlistButton({ productId, variant = 'icon' }: { productId: string; variant?: 'icon' | 'labeled' }) {
  const router = useRouter()
  const pathname = usePathname()
  const hydrate = useWishlistStore((s) => s.hydrate)
  const toggle = useWishlistStore((s) => s.toggle)
  const active = useWishlistStore((s) => s.ids.has(productId))

  useEffect(() => {
    hydrate()
  }, [hydrate])

  async function onClick(e: React.MouseEvent) {
    e.preventDefault()
    e.stopPropagation()
    const result = await toggle(productId)
    if (result === 'unauthorized') router.push(`/login?next=${encodeURIComponent(pathname)}`)
  }

  if (variant === 'labeled') {
    return (
      <button
        onClick={onClick}
        className={`inline-flex items-center gap-2 h-10 px-4 rounded-xl text-sm font-semibold border transition-colors ${
          active ? 'bg-red-50 border-red-200 text-red-600' : 'bg-white border-slate-200 text-slate-600 hover:border-slate-300'
        }`}
      >
        <Heart size={16} className={active ? 'fill-red-500 text-red-500' : ''} />
        {active ? 'Saved' : 'Save for later'}
      </button>
    )
  }

  return (
    <button
      onClick={onClick}
      title={active ? 'Remove from wishlist' : 'Add to wishlist'}
      className={`absolute top-12 right-2 z-10 w-9 h-9 rounded-full flex items-center justify-center shadow-sm transition-colors ${
        active ? 'bg-red-50 text-red-500' : 'bg-white/95 text-slate-400 hover:text-red-500 border border-slate-200'
      }`}
    >
      <Heart size={16} className={active ? 'fill-red-500' : ''} />
    </button>
  )
}
