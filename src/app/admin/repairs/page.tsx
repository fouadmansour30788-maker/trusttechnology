import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { RepairsManager, type RepairRow } from '@/components/admin/RepairsManager'

export const dynamic = 'force-dynamic'

export default async function AdminRepairsPage() {
  let repairs: RepairRow[] = []
  if (isSupabaseConfigured()) {
    const supabase = await createClient()
    const { data } = await supabase.from('repairs').select('*').order('created_at', { ascending: false }).limit(200)
    repairs = (data as RepairRow[]) ?? []
  }
  return (
    <div className="p-8">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Repairs</h1>
        <p className="text-slate-500 text-sm mt-0.5">
          Service tickets from the website and walk-ins. Status changes are visible to customers on the tracking page.
          {repairs.length === 0 && ' If the table doesn’t exist yet, run supabase/migrations/009_repairs_questions.sql.'}
        </p>
      </div>
      <RepairsManager repairs={repairs} />
    </div>
  )
}
