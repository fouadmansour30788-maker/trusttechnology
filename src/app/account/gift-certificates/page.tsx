import Link from 'next/link'
import { Gift, Clock, CheckCircle2 } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

type GCRow = {
  id: string; code: string | null; initial_balance: number; remaining_balance: number
  recipient_name: string | null; status: string; created_at: string
}

const STATUS: Record<string, { label: string; className: string }> = {
  pending_payment: { label: 'Awaiting confirmation', className: 'text-amber-700 bg-amber-50' },
  active: { label: 'Active', className: 'text-emerald-700 bg-emerald-50' },
  redeemed: { label: 'Fully redeemed', className: 'text-slate-500 bg-slate-100' },
  cancelled: { label: 'Cancelled', className: 'text-red-600 bg-red-50' },
}

export default async function AccountGiftCertificatesPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  const { data } = await supabase
    .from('gift_certificates')
    .select('id, code, initial_balance, remaining_balance, recipient_name, status, created_at')
    .eq('purchaser_auth_user_id', user!.id)
    .order('created_at', { ascending: false })
  const certs = (data as GCRow[]) ?? []

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Gift certificates</h1>
        <Link href="/gift-certificates" className="text-sm font-medium text-blue-600 hover:text-blue-700">Buy one →</Link>
      </div>
      {certs.length === 0 ? (
        <div className="bg-white border border-slate-200 rounded-2xl p-10 text-center">
          <Gift size={32} className="text-slate-300 mx-auto mb-3" />
          <p className="text-slate-500 text-sm">You haven't purchased any gift certificates yet.</p>
        </div>
      ) : (
        <div className="space-y-3">
          {certs.map((c) => {
            const status = STATUS[c.status] ?? STATUS.pending_payment
            return (
              <div key={c.id} className="bg-white border border-slate-200 rounded-2xl p-5 flex items-center justify-between gap-4">
                <div>
                  <p className="font-semibold text-slate-900">${Number(c.initial_balance).toFixed(2)}{c.recipient_name ? ` — for ${c.recipient_name}` : ''}</p>
                  <p className="text-xs text-slate-400 mt-0.5">{new Date(c.created_at).toLocaleDateString('en-GB', { dateStyle: 'medium' })}</p>
                  {c.code && <code className="inline-block mt-2 text-xs bg-slate-100 px-2 py-1 rounded">{c.code}</code>}
                </div>
                <div className="text-right shrink-0">
                  <span className={`inline-flex text-xs font-semibold rounded-full px-2.5 py-1 ${status.className}`}>{status.label}</span>
                  {c.status === 'active' && Number(c.remaining_balance) < Number(c.initial_balance) && (
                    <p className="text-xs text-slate-400 mt-1">${Number(c.remaining_balance).toFixed(2)} left</p>
                  )}
                </div>
              </div>
            )
          })}
        </div>
      )}
    </div>
  )
}
