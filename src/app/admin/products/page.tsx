'use client'
import { useState } from 'react'
import Link from 'next/link'
import { Plus, Search, Edit, Trash2, ToggleLeft, ToggleRight } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import type { Product } from '@/lib/types'

const MOCK_PRODUCTS: Product[] = [
  {
    id: '1', name: 'Dell Latitude 5540', slug: 'dell-latitude-5540',
    description: null, price: 1299, compare_at_price: 1499,
    primary_category_id: null, images: [], stock: 5,
    sku: 'DELL-5540', is_active: true, is_featured: true,
    specs: {}, created_at: '2026-01-10', updated_at: '2026-01-10',
    tags: [{ id: 't1', name: 'Dell', slug: 'dell', type: 'brand' }],
  },
  {
    id: '2', name: 'Apple MacBook Air M3', slug: 'macbook-air-m3',
    description: null, price: 1749, compare_at_price: null,
    primary_category_id: null, images: [], stock: 4,
    sku: 'APPLE-MBA-M3', is_active: true, is_featured: true,
    specs: {}, created_at: '2026-01-12', updated_at: '2026-01-12',
    tags: [{ id: 't2', name: 'Apple', slug: 'apple', type: 'brand' }],
  },
  {
    id: '3', name: 'HP LaserJet Pro M428', slug: 'hp-laserjet-m428',
    description: null, price: 649, compare_at_price: 749,
    primary_category_id: null, images: [], stock: 0,
    sku: 'HP-LJ-M428', is_active: false, is_featured: false,
    specs: {}, created_at: '2026-01-08', updated_at: '2026-01-08',
    tags: [{ id: 't3', name: 'HP', slug: 'hp', type: 'brand' }],
  },
]

export default function AdminProductsPage() {
  const [search, setSearch] = useState('')
  const [products, setProducts] = useState(MOCK_PRODUCTS)

  const filtered = products.filter((p) =>
    p.name.toLowerCase().includes(search.toLowerCase()) ||
    p.sku?.toLowerCase().includes(search.toLowerCase())
  )

  function toggleActive(id: string) {
    setProducts((prev) => prev.map((p) => p.id === id ? { ...p, is_active: !p.is_active } : p))
  }

  return (
    <div className="p-8">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-white">Products</h1>
          <p className="text-zinc-500 text-sm mt-0.5">{products.length} total products</p>
        </div>
        <Link href="/admin/products/new">
          <Button>
            <Plus size={16} /> Add Product
          </Button>
        </Link>
      </div>

      {/* Search */}
      <div className="flex items-center gap-3 bg-zinc-900 border border-zinc-800 rounded-xl px-4 py-2.5 mb-6 max-w-md">
        <Search size={16} className="text-zinc-500" />
        <input
          type="text"
          placeholder="Search by name or SKU..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="bg-transparent text-sm text-white placeholder-zinc-600 outline-none flex-1"
        />
      </div>

      {/* Table */}
      <div className="bg-zinc-900 border border-zinc-800 rounded-2xl overflow-hidden">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-zinc-800">
              <th className="text-left px-5 py-3 text-zinc-500 font-medium">Product</th>
              <th className="text-left px-5 py-3 text-zinc-500 font-medium hidden md:table-cell">SKU</th>
              <th className="text-left px-5 py-3 text-zinc-500 font-medium">Price</th>
              <th className="text-left px-5 py-3 text-zinc-500 font-medium hidden lg:table-cell">Stock</th>
              <th className="text-left px-5 py-3 text-zinc-500 font-medium">Status</th>
              <th className="text-left px-5 py-3 text-zinc-500 font-medium">Actions</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-zinc-800">
            {filtered.map((product) => (
              <tr key={product.id} className="hover:bg-zinc-800/40 transition-colors">
                <td className="px-5 py-4">
                  <div>
                    <p className="text-white font-medium">{product.name}</p>
                    <div className="flex gap-1 mt-1 flex-wrap">
                      {product.tags?.map((t) => (
                        <Badge key={t.id} className="text-xs">{t.name}</Badge>
                      ))}
                      {product.is_featured && <Badge variant="amber">Featured</Badge>}
                    </div>
                  </div>
                </td>
                <td className="px-5 py-4 text-zinc-400 hidden md:table-cell">{product.sku ?? '—'}</td>
                <td className="px-5 py-4">
                  <span className="text-white font-semibold">${product.price}</span>
                  {product.compare_at_price && (
                    <span className="text-zinc-500 line-through text-xs ml-1">${product.compare_at_price}</span>
                  )}
                </td>
                <td className="px-5 py-4 hidden lg:table-cell">
                  <span className={product.stock === 0 ? 'text-red-400' : 'text-zinc-300'}>
                    {product.stock === 0 ? 'Out of stock' : product.stock}
                  </span>
                </td>
                <td className="px-5 py-4">
                  <button onClick={() => toggleActive(product.id)} className="flex items-center gap-1.5 text-sm">
                    {product.is_active
                      ? <><ToggleRight size={18} className="text-green-400" /><span className="text-green-400">Active</span></>
                      : <><ToggleLeft size={18} className="text-zinc-600" /><span className="text-zinc-500">Inactive</span></>
                    }
                  </button>
                </td>
                <td className="px-5 py-4">
                  <div className="flex items-center gap-2">
                    <Link href={`/admin/products/${product.id}`} className="p-1.5 text-zinc-500 hover:text-white hover:bg-zinc-700 rounded-lg transition-colors">
                      <Edit size={15} />
                    </Link>
                    <button className="p-1.5 text-zinc-500 hover:text-red-400 hover:bg-zinc-700 rounded-lg transition-colors">
                      <Trash2 size={15} />
                    </button>
                  </div>
                </td>
              </tr>
            ))}
            {filtered.length === 0 && (
              <tr>
                <td colSpan={6} className="px-5 py-10 text-center text-zinc-500">
                  No products found
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  )
}
