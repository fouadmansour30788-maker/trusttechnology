import { getSuppliers } from '@/lib/erp'
import { SuppliersManager } from '@/components/admin/SuppliersManager'

export const dynamic = 'force-dynamic'

export default async function SuppliersPage() {
  const suppliers = await getSuppliers()
  return (
    <div className="p-8">
      <SuppliersManager initial={suppliers} />
    </div>
  )
}
