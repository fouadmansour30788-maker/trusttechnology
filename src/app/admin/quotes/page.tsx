import { createClient } from '@/lib/supabase/server'
import { isSupabaseConfigured } from '@/lib/db'
import { QuotesManager, type QuoteRow } from '@/components/admin/QuotesManager'

export const dynamic = 'force-dynamic'

export default async function AdminQuotesPage() {
  let quotes: QuoteRow[] = []
  if (isSupabaseConfigured()) {
    const supabase = await createClient()
    const { data } = await supabase
      .from('quote_requests')
      .select('id, reference, company_name, contact_name, phone, email, details, budget, status, internal_notes, created_at')
      .order('created_at', { ascending: false })
      .limit(300)
    quotes = (data as QuoteRow[]) ?? []
  }
  return (
    <div className="p-8">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Business Quotes</h1>
        <p className="text-slate-500 text-sm mt-0.5">
          Bulk / B2B quote requests from the /quote page — work them like a sales pipeline.
          {quotes.length === 0 && ' If the table doesn’t exist yet, run supabase/migrations/020_quote_requests.sql.'}
        </p>
      </div>
      <QuotesManager quotes={quotes} />
    </div>
  )
}
