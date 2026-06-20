'use client'
import { useState, useTransition } from 'react'
import { Plus, Edit, Trash2, Loader2, X } from 'lucide-react'
import type { Customer } from '@/lib/erp'
import { saveCustomer, deleteCustomer, type CustomerInput } from '@/app/admin/erp-actions'

const blank: CustomerInput = { name: '', email: '', phone: '', address: '', notes: '' }

export function CustomersManager({ initial }: { initial: Customer[] }) {
  const [rows, setRows] = useState(initial)
  const [form, setForm] = useState<CustomerInput | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [saving, start] = useTransition()

  function submit(e: React.FormEvent) {
    e.preventDefault()
    if (!form) return
    start(async () => {
      const res = await saveCustomer(form)
      if (res.error) { setError(res.error); return }
      setRows((prev) => {
        const next = { ...(form as Customer), id: res.id! }
        return form.id ? prev.map((r) => (r.id === form.id ? next : r)) : [...prev, next].sort((a, b) => a.name.localeCompare(b.name))
      })
      setForm(null)
    })
  }

  function remove(c: Customer) {
    if (!confirm(`Delete customer "${c.name}"?`)) return
    setRows((p) => p.filter((r) => r.id !== c.id))
    start(() => { deleteCustomer(c.id) })
  }

  const inputCls = 'w-full px-3 py-2 rounded-lg border border-slate-200 text-sm text-slate-900 outline-none focus:border-blue-400'

  return (
    <>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">Customers</h1>
          <p className="text-slate-500 text-sm mt-0.5">{rows.length} customers</p>
        </div>
        <button onClick={() => { setForm({ ...blank }); setError(null) }} className="inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white text-sm font-semibold px-4 py-2.5 rounded-xl shadow-lg shadow-blue-600/20">
          <Plus size={16} /> Add customer
        </button>
      </div>

      <div className="bg-white border border-slate-200 rounded-2xl overflow-hidden">
        <table className="w-full text-sm">
          <thead><tr className="border-b border-slate-200 bg-slate-50/60 text-left text-slate-500">
            <th className="px-5 py-3 font-medium">Name</th>
            <th className="px-5 py-3 font-medium hidden md:table-cell">Phone</th>
            <th className="px-5 py-3 font-medium hidden lg:table-cell">Email</th>
            <th className="px-5 py-3 font-medium text-right">Actions</th>
          </tr></thead>
          <tbody className="divide-y divide-slate-100">
            {rows.map((c) => (
              <tr key={c.id} className="hover:bg-slate-50/60">
                <td className="px-5 py-3 font-medium text-slate-900">{c.name}</td>
                <td className="px-5 py-3 text-slate-500 hidden md:table-cell">{c.phone || '—'}</td>
                <td className="px-5 py-3 text-slate-500 hidden lg:table-cell">{c.email || '—'}</td>
                <td className="px-5 py-3">
                  <div className="flex justify-end gap-1">
                    <button onClick={() => { setForm({ id: c.id, name: c.name, email: c.email, phone: c.phone, address: c.address, notes: c.notes }); setError(null) }} className="p-1.5 text-slate-400 hover:text-blue-600 hover:bg-blue-50 rounded-lg"><Edit size={15} /></button>
                    <button onClick={() => remove(c)} className="p-1.5 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg"><Trash2 size={15} /></button>
                  </div>
                </td>
              </tr>
            ))}
            {rows.length === 0 && <tr><td colSpan={4} className="px-5 py-10 text-center text-slate-400">No customers yet</td></tr>}
          </tbody>
        </table>
      </div>

      {form && (
        <div className="fixed inset-0 z-50 flex items-center justify-center px-4 bg-slate-900/30 backdrop-blur-sm" onClick={() => setForm(null)}>
          <form onClick={(e) => e.stopPropagation()} onSubmit={submit} className="w-full max-w-md bg-white rounded-2xl shadow-2xl p-6 space-y-3">
            <div className="flex items-center justify-between">
              <h2 className="font-semibold text-slate-900">{form.id ? 'Edit customer' : 'New customer'}</h2>
              <button type="button" onClick={() => setForm(null)} className="text-slate-400 hover:text-slate-700"><X size={18} /></button>
            </div>
            <input className={inputCls} placeholder="Name *" required value={form.name} onChange={(e) => setForm({ ...form, name: e.target.value })} />
            <div className="grid grid-cols-2 gap-2">
              <input className={inputCls} placeholder="Phone" value={form.phone ?? ''} onChange={(e) => setForm({ ...form, phone: e.target.value })} />
              <input className={inputCls} placeholder="Email" value={form.email ?? ''} onChange={(e) => setForm({ ...form, email: e.target.value })} />
            </div>
            <input className={inputCls} placeholder="Address" value={form.address ?? ''} onChange={(e) => setForm({ ...form, address: e.target.value })} />
            <textarea className={inputCls + ' resize-y'} rows={2} placeholder="Notes" value={form.notes ?? ''} onChange={(e) => setForm({ ...form, notes: e.target.value })} />
            {error && <p className="text-sm text-red-600">{error}</p>}
            <button type="submit" disabled={saving} className="w-full inline-flex items-center justify-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white font-semibold py-2.5 rounded-lg disabled:opacity-50">
              {saving && <Loader2 size={16} className="animate-spin" />} {form.id ? 'Save' : 'Create'}
            </button>
          </form>
        </div>
      )}
    </>
  )
}
