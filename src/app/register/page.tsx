'use client'
import { Suspense, useState } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import Link from 'next/link'
import { UserPlus, Loader2, MailCheck } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import { AuthCard } from '@/components/ui/AuthCard'

export default function RegisterPage() {
  return (
    <Suspense>
      <RegisterForm />
    </Suspense>
  )
}

function RegisterForm() {
  const router = useRouter()
  const params = useSearchParams()
  const next = params.get('next') || '/account'
  const [name, setName] = useState('')
  const [phone, setPhone] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [checkEmail, setCheckEmail] = useState(false)

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError(null)
    if (password.length < 8) { setError('Password must be at least 8 characters.'); return }
    setLoading(true)
    try {
      const supabase = createClient()
      const { data, error } = await supabase.auth.signUp({
        email, password,
        options: { data: { name, phone } },
      })
      if (error) { setError(error.message); return }

      if (!data.session) {
        // Email confirmation required before a session exists.
        setCheckEmail(true)
        return
      }

      await fetch('/api/account/link', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name, phone }),
      })
      router.replace(next)
      router.refresh()
    } catch {
      setError('Could not reach the server. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  if (checkEmail) {
    return (
      <AuthCard icon={<MailCheck size={22} />} title="Check your email">
        <p className="text-sm text-slate-500">We sent a confirmation link to {email}. Click it to activate your account, then sign in.</p>
        <Link href="/login" className="inline-block mt-5 text-blue-600 hover:text-blue-700 font-medium text-sm">Go to sign in →</Link>
      </AuthCard>
    )
  }

  return (
    <AuthCard icon={<UserPlus size={22} />} title="Create an account" subtitle="Track orders, save a wishlist, and manage gift certificates.">
      <form onSubmit={onSubmit} className="space-y-3">
        <input
          type="text" required value={name} onChange={(e) => setName(e.target.value)}
          placeholder="Full name" maxLength={80}
          className="w-full px-4 py-3 rounded-xl border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
        />
        <input
          type="tel" required value={phone} onChange={(e) => setPhone(e.target.value)}
          placeholder="Phone number" maxLength={30}
          className="w-full px-4 py-3 rounded-xl border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
        />
        <input
          type="email" required value={email} onChange={(e) => setEmail(e.target.value)}
          placeholder="Email"
          className="w-full px-4 py-3 rounded-xl border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
        />
        <input
          type="password" required value={password} onChange={(e) => setPassword(e.target.value)}
          placeholder="Password (min. 8 characters)"
          className="w-full px-4 py-3 rounded-xl border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400"
        />
        {error && <p className="text-sm text-red-600">{error}</p>}
        <button
          type="submit" disabled={loading}
          className="w-full inline-flex items-center justify-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white font-semibold py-3 rounded-xl shadow-lg shadow-blue-600/20 disabled:opacity-50"
        >
          {loading ? <Loader2 size={16} className="animate-spin" /> : null}
          Create account
        </button>
      </form>

      <p className="text-sm text-slate-500 mt-5 text-center">
        Already have an account?{' '}
        <Link href={`/login${next !== '/account' ? `?next=${encodeURIComponent(next)}` : ''}`} className="text-blue-600 hover:text-blue-700 font-medium">
          Sign in
        </Link>
      </p>
    </AuthCard>
  )
}
