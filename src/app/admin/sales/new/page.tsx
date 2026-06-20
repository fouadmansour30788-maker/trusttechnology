import { getCustomers, getProductsLite } from '@/lib/erp'
import { SaleForm } from '@/components/admin/SaleForm'

export const dynamic = 'force-dynamic'

export default async function NewSalePage() {
  const [customers, products] = await Promise.all([getCustomers(), getProductsLite()])
  return (
    <div className="p-8">
      <SaleForm customers={customers} products={products} />
    </div>
  )
}
