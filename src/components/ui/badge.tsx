import { clsx } from 'clsx'

type BadgeProps = {
  children: React.ReactNode
  variant?: 'default' | 'blue' | 'green' | 'red' | 'amber'
  className?: string
}

const variants = {
  default: 'bg-slate-100 text-slate-600',
  blue: 'bg-blue-50 text-blue-700 ring-1 ring-blue-100',
  green: 'bg-blue-50 text-blue-700 ring-1 ring-blue-100',
  red: 'bg-blue-900 text-white shadow-sm',
  amber: 'bg-blue-50 text-blue-700 ring-1 ring-blue-100',
}

export function Badge({ children, variant = 'default', className }: BadgeProps) {
  return (
    <span className={clsx('inline-flex items-center px-2 py-0.5 rounded-md text-xs font-medium', variants[variant], className)}>
      {children}
    </span>
  )
}
