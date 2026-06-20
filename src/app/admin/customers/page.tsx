import { getCustomers } from '@/lib/erp'
import { CustomersManager } from '@/components/admin/CustomersManager'

export const dynamic = 'force-dynamic'

export default async function CustomersPage() {
  const customers = await getCustomers()
  return (
    <div className="p-8">
      <CustomersManager initial={customers} />
    </div>
  )
}
