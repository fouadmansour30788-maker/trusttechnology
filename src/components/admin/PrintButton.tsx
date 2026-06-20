'use client'
import { Printer } from 'lucide-react'

export function PrintButton() {
  return (
    <button
      onClick={() => window.print()}
      className="print:hidden inline-flex items-center gap-2 bg-gradient-to-r from-blue-600 to-blue-800 text-white text-sm font-semibold px-4 py-2 rounded-xl shadow-lg shadow-blue-600/20"
    >
      <Printer size={15} /> Print / Save PDF
    </button>
  )
}
