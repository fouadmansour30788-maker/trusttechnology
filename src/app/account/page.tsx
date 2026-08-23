import Link from 'next/link'
import { Package, Heart, Gift, ArrowRight, Sparkles } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

export default async function AccountOverviewPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: customer } = await supabase.from('customers').select('id, name, email, phone, points_balance').eq('auth_user_id', user!.id).maybeSingle()
  const custId = (customer as { id?: string } | null)?.id

  const [{ count: orderCount }, { count: wishlistCount }, { count: giftCertCount }] = await Promise.all([
    custId
      ? supabase.from('sales_orders').select('id', { count: 'exact', head: true }).eq('customer_id', custId)
      : Promise.resolve({ count: 0 }),
    supabase.from('wishlist_items').select('id', { count: 'exact', head: true }).eq('auth_user_id', user!.id),
    supabase.from('gift_certificates').select('id', { count: 'exact', head: true }).eq('purchaser_auth_user_id', user!.id),
  ])

  const name = (customer as { name?: string } | null)?.name ?? user?.email ?? 'there'
  const pointsBalance = (customer as { points_balance?: number } | null)?.points_balance ?? 0

  const tiles = [
    { label: 'Orders', value: orderCount ?? 0, href: '/account/orders', icon: Package },
    { label: 'Wishlist items', value: wishlistCount ?? 0, href: '/account/wishlist', icon: Heart },
    { label: 'Points', value: pointsBalance, href: '/account/points', icon: Sparkles },
    { label: 'Gift certificates', value: giftCertCount ?? 0, href: '/account/gift-certificates', icon: Gift },
  ]

  return (
    <div>
      <h1 className="text-3xl font-bold text-slate-900 tracking-tight mb-1">Hi, {name}</h1>
      <p className="text-slate-500 text-sm mb-8">{(customer as { email?: string } | null)?.email ?? user?.email}</p>

      <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {tiles.map(({ label, value, href, icon: Icon }) => (
          <Link
            key={href}
            href={href}
            className="group bg-white border border-slate-200 rounded-3xl p-5 hover:border-blue-200 hover:-translate-y-0.5 hover:shadow-lg hover:shadow-blue-900/5 transition-all duration-300"
          >
            <div className="w-10 h-10 rounded-xl bg-blue-50 flex items-center justify-center mb-3 text-blue-600">
              <Icon size={18} />
            </div>
            <p className="text-2xl font-bold text-slate-900">{value}</p>
            <p className="text-sm text-slate-500 mt-0.5 flex items-center gap-1">
              {label} <ArrowRight size={12} className="opacity-0 group-hover:opacity-100 transition-opacity" />
            </p>
          </Link>
        ))}
      </div>
    </div>
  )
}
