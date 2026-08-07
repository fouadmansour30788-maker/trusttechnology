import { Gift, Clock, CheckCircle2, Ban } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { GiftCertificateActions } from '@/components/admin/GiftCertificateActions'

export const dynamic = 'force-dynamic'

type GCRow = {
  id: string; code: string | null; initial_balance: number; remaining_balance: number
  purchaser_name: string; purchaser_phone: string; recipient_name: string | null; recipient_email: string | null
  message: string | null; status: string; created_at: string; activated_at: string | null
}

function money(n: number) {
  return `$${n.toLocaleString(undefined, { maximumFractionDigits: 2 })}`
}

const STATUS_BADGE: Record<string, { label: string; className: string; icon: typeof Clock }> = {
  pending_payment: { label: 'Pending payment', className: 'text-amber-700 bg-amber-50', icon: Clock },
  active: { label: 'Active', className: 'text-emerald-700 bg-emerald-50', icon: CheckCircle2 },
  redeemed: { label: 'Fully redeemed', className: 'text-slate-500 bg-slate-100', icon: CheckCircle2 },
  cancelled: { label: 'Cancelled', className: 'text-red-600 bg-red-50', icon: Ban },
}

export default async function AdminGiftCertificatesPage() {
  let certs: GCRow[] = []
  if (isSupabaseConfigured()) {
    const supabase = await createClient()
    const { data } = await supabase
      .from('gift_certificates')
      .select('id, code, initial_balance, remaining_balance, purchaser_name, purchaser_phone, recipient_name, recipient_email, message, status, created_at, activated_at')
      .order('created_at', { ascending: false })
    certs = (data as GCRow[]) ?? []
  }

  const pending = certs.filter((c) => c.status === 'pending_payment')
  const active = certs.filter((c) => c.status === 'active')

  return (
    <div className="p-8">
      <div className="flex items-center gap-2 mb-1">
        <Gift size={20} className="text-blue-600" />
        <h1 className="text-2xl font-bold text-slate-900">Gift certificates</h1>
      </div>
      <p className="text-slate-500 text-sm mb-6">Purchased through the storefront like any COD order — confirm payment by phone, then activate to reveal the code.</p>

      <div className="grid sm:grid-cols-3 gap-4 mb-6">
        {[
          { label: 'Pending confirmation', value: pending.length },
          { label: 'Active balance outstanding', value: money(active.reduce((s, c) => s + Number(c.remaining_balance), 0)) },
          { label: 'Total certificates', value: certs.length },
        ].map(({ label, value }) => (
          <div key={label} className="bg-white border border-slate-200 rounded-2xl p-5">
            <p className="text-2xl font-bold text-slate-900">{value}</p>
            <p className="text-sm text-slate-500 mt-0.5">{label}</p>
          </div>
        ))}
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl p-5">
        {certs.length === 0 ? (
          <p className="text-sm text-slate-400 py-12 text-center">No gift certificate orders yet.</p>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="text-left text-xs uppercase tracking-wide text-slate-400 border-b border-slate-100">
                  <th className="py-2 pr-4 font-semibold">Purchaser</th>
                  <th className="py-2 pr-4 font-semibold">Recipient</th>
                  <th className="py-2 pr-4 font-semibold text-right">Amount</th>
                  <th className="py-2 pr-4 font-semibold">Status</th>
                  <th className="py-2 pr-4 font-semibold">Code</th>
                  <th className="py-2 font-semibold"></th>
                </tr>
              </thead>
              <tbody>
                {certs.map((c) => {
                  const badge = STATUS_BADGE[c.status] ?? STATUS_BADGE.pending_payment
                  const Icon = badge.icon
                  return (
                    <tr key={c.id} className="border-b border-slate-50 last:border-0 align-top">
                      <td className="py-2.5 pr-4">
                        <p className="text-slate-800 font-medium">{c.purchaser_name}</p>
                        <p className="text-xs text-slate-400">{c.purchaser_phone}</p>
                      </td>
                      <td className="py-2.5 pr-4">
                        {c.recipient_name ? (
                          <>
                            <p className="text-slate-700">{c.recipient_name}</p>
                            {c.recipient_email && <p className="text-xs text-slate-400">{c.recipient_email}</p>}
                          </>
                        ) : <span className="text-slate-300">—</span>}
                      </td>
                      <td className="py-2.5 pr-4 text-right tabular-nums">
                        <p className="text-slate-900 font-semibold">{money(Number(c.initial_balance))}</p>
                        {c.status === 'active' && Number(c.remaining_balance) < Number(c.initial_balance) && (
                          <p className="text-xs text-slate-400">{money(Number(c.remaining_balance))} left</p>
                        )}
                      </td>
                      <td className="py-2.5 pr-4">
                        <span className={`inline-flex items-center gap-1 text-xs font-semibold rounded-full px-2 py-0.5 ${badge.className}`}>
                          <Icon size={11} /> {badge.label}
                        </span>
                      </td>
                      <td className="py-2.5 pr-4">
                        {c.code ? <code className="text-xs bg-slate-100 px-1.5 py-0.5 rounded">{c.code}</code> : <span className="text-slate-300">—</span>}
                      </td>
                      <td className="py-2.5">
                        {c.status === 'pending_payment' && <GiftCertificateActions id={c.id} />}
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  )
}
