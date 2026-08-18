import { Sparkles } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'
import { POINTS_PER_DOLLAR_REDEEM, POINTS_MIN_REDEEM } from '@/lib/loyalty'

export const dynamic = 'force-dynamic'

const REASON_LABELS: Record<string, string> = {
  purchase: 'Earned from order',
  redemption: 'Redeemed at checkout',
  manual_adjustment: 'Adjustment',
}

type LedgerRow = { id: string; delta: number; reason: string; created_at: string; sales_order: { reference: string } | null }

export default async function AccountPointsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  const { data: customer } = await supabase.from('customers').select('id, points_balance').eq('auth_user_id', user!.id).maybeSingle()
  const cust = customer as { id?: string; points_balance?: number } | null

  let ledger: LedgerRow[] = []
  if (cust?.id) {
    const { data } = await supabase
      .from('points_ledger')
      .select('id, delta, reason, created_at, sales_order:sales_orders(reference)')
      .eq('customer_id', cust.id)
      .order('created_at', { ascending: false })
      .limit(100)
    ledger = (data as unknown as LedgerRow[]) ?? []
  }

  const balance = cust?.points_balance ?? 0

  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-900 mb-6">Points</h1>

      <div className="bg-gradient-to-br from-amber-500 to-amber-600 rounded-2xl p-6 text-white mb-6 relative overflow-hidden">
        <Sparkles size={80} className="absolute -right-4 -bottom-4 text-white/15" />
        <p className="text-amber-100 text-sm">Your balance</p>
        <p className="text-4xl font-bold mt-1">{balance.toLocaleString()} points</p>
        <p className="text-amber-100 text-sm mt-2">
          Worth ${(balance / POINTS_PER_DOLLAR_REDEEM).toFixed(2)} — redeemable at checkout in blocks of {POINTS_MIN_REDEEM}.
        </p>
      </div>

      {ledger.length === 0 ? (
        <div className="bg-white border border-slate-200 rounded-2xl p-10 text-center">
          <Sparkles size={32} className="text-slate-300 mx-auto mb-3" />
          <p className="text-slate-500 text-sm">No points activity yet — earn {POINTS_PER_DOLLAR_REDEEM > 0 ? '1 point per $1' : ''} on your next order.</p>
        </div>
      ) : (
        <div className="bg-white border border-slate-200 rounded-2xl divide-y divide-slate-100">
          {ledger.map((l) => (
            <div key={l.id} className="flex items-center justify-between gap-3 px-5 py-3.5">
              <div>
                <p className="text-sm text-slate-900 font-medium">{REASON_LABELS[l.reason] ?? l.reason}</p>
                <p className="text-xs text-slate-400">
                  {new Date(l.created_at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })}
                  {l.sales_order?.reference ? ` · ${l.sales_order.reference}` : ''}
                </p>
              </div>
              <span className={`text-sm font-bold tabular-nums ${l.delta > 0 ? 'text-emerald-600' : 'text-slate-500'}`}>
                {l.delta > 0 ? '+' : ''}{l.delta}
              </span>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
