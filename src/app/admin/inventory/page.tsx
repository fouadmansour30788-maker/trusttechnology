import { getLowStock, getStockMovements, getProductsLite } from '@/lib/erp'
import { InventoryManager } from '@/components/admin/InventoryManager'

export const dynamic = 'force-dynamic'

export default async function InventoryPage() {
  const [lowStock, movements, products] = await Promise.all([
    getLowStock(5),
    getStockMovements(100),
    getProductsLite(),
  ])
  return (
    <div className="p-8">
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-slate-900">Inventory</h1>
        <p className="text-slate-500 text-sm mt-0.5">Adjust stock and review every movement.</p>
      </div>
      <InventoryManager lowStock={lowStock} movements={movements} products={products} />
    </div>
  )
}
