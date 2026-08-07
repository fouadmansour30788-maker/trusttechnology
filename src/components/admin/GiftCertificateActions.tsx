'use client'
import { useState } from 'react'
import { CheckCircle2, XCircle, Copy } from 'lucide-react'
import { activateGiftCertificate, cancelGiftCertificate } from '@/app/admin/gift-certificates/actions'

export function GiftCertificateActions({ id }: { id: string }) {
  const [loading, setLoading] = useState(false)
  const [revealedCode, setRevealedCode] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)

  async function activate() {
    setLoading(true)
    setError(null)
    const result = await activateGiftCertificate(id)
    if (result.ok && result.code) setRevealedCode(result.code)
    else setError(result.error ?? 'Failed')
    setLoading(false)
  }

  async function cancel() {
    setLoading(true)
    setError(null)
    const result = await cancelGiftCertificate(id)
    if (!result.ok) setError(result.error ?? 'Failed')
    setLoading(false)
  }

  if (revealedCode) {
    return (
      <div className="flex items-center gap-2 text-xs">
        <code className="bg-emerald-50 text-emerald-700 font-semibold px-2 py-1 rounded-lg">{revealedCode}</code>
        <button
          onClick={() => navigator.clipboard.writeText(revealedCode)}
          title="Copy code"
          className="text-slate-400 hover:text-blue-600"
        >
          <Copy size={13} />
        </button>
      </div>
    )
  }

  return (
    <div className="flex items-center gap-2">
      {error && <span className="text-xs text-red-600">{error}</span>}
      <button
        onClick={activate}
        disabled={loading}
        className="inline-flex items-center gap-1 text-xs font-semibold text-emerald-700 bg-emerald-50 hover:bg-emerald-100 rounded-lg px-2.5 py-1.5 disabled:opacity-60"
      >
        <CheckCircle2 size={13} /> Confirm & activate
      </button>
      <button
        onClick={cancel}
        disabled={loading}
        className="inline-flex items-center gap-1 text-xs font-semibold text-slate-500 hover:text-red-600 hover:bg-red-50 rounded-lg px-2.5 py-1.5 disabled:opacity-60"
      >
        <XCircle size={13} /> Cancel
      </button>
    </div>
  )
}
