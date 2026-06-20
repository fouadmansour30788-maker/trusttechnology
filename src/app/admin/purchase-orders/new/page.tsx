import { getSuppliers, getProductsLite } from '@/lib/erp'
import { POForm } from '@/components/admin/POForm'

export const dynamic = 'force-dynamic'

export default async function NewPurchaseOrderPage() {
  const [suppliers, products] = await Promise.all([getSuppliers(), getProductsLite()])
  return (
    <div className="p-8">
      <POForm suppliers={suppliers} products={products} />
    </div>
  )
}
