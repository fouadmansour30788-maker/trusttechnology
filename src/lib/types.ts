export type TagType = 'brand' | 'use_case' | 'type'

export type Tag = {
  id: string
  name: string
  slug: string
  type: TagType
}

export type Category = {
  id: string
  name: string
  slug: string
  parent_id: string | null
  description: string | null
  image_url: string | null
  sort_order: number
  children?: Category[]
}

export type Product = {
  id: string
  name: string
  slug: string
  description: string | null
  price: number
  compare_at_price: number | null
  primary_category_id: string | null
  images: string[]
  stock: number
  sku: string | null
  is_active: boolean
  is_featured: boolean
  specs: Record<string, string>
  created_at: string
  updated_at: string
  primary_category?: Category
  tags?: Tag[]
  /** True when the price is "Call" in the price list (shown as "Call for price"). */
  priceOnRequest?: boolean
  /** Internal purchase cost (admin only — never shown to customers). */
  cost?: number | null
  /** VAT rate % (Lebanon standard 11%). */
  vat_rate?: number | null
  /** Available colour options, e.g. ['Black','White','Red']. */
  colors?: string[] | null
}

export type Bundle = {
  id: string
  name: string
  slug: string
  description: string | null
  image_url: string | null
  discount_percentage: number
  is_active: boolean
  items?: BundleItem[]
}

export type BundleItem = {
  product: Product
  quantity: number
}

export type OrderStatus = 'pending' | 'confirmed' | 'shipped' | 'delivered' | 'cancelled'

export type Order = {
  id: string
  user_id: string | null
  status: OrderStatus
  total: number
  customer_name: string | null
  customer_email: string | null
  customer_phone: string | null
  shipping_address: Record<string, string> | null
  notes: string | null
  created_at: string
  items?: OrderItem[]
}

export type OrderItem = {
  id: string
  order_id: string
  product_id: string
  quantity: number
  price: number
  product?: Product
}

export type CartItem = {
  product: Product
  quantity: number
}

export type NavSubItem = {
  label: string
  slug: string
}

export type NavColumn = {
  title: string
  items: NavSubItem[]
}

export type NavCategory = {
  label: string
  slug: string
  columns: NavColumn[]
  featured?: { label: string; slug: string; tag?: string }
}
