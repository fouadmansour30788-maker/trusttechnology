/**
 * Delivery regions & fees (USD). Shared by the checkout page (display)
 * and /api/checkout (authoritative server-side calculation).
 *
 * ⚠️ PLACEHOLDER FEES — confirm real rates with the store before launch.
 * Set `FREE_DELIVERY_OVER` to a dollar amount to waive fees on big orders,
 * or keep null to always charge.
 */
export const DELIVERY_REGIONS = [
  { id: 'tripoli', label: 'Tripoli & North', fee: 2 },
  { id: 'beirut', label: 'Beirut & Mount Lebanon', fee: 4 },
  { id: 'other', label: 'South, Bekaa & elsewhere', fee: 5 },
] as const

export type DeliveryRegionId = (typeof DELIVERY_REGIONS)[number]['id']

export const FREE_DELIVERY_OVER: number | null = null

export function deliveryFee(regionId: string, subtotal: number): { region: (typeof DELIVERY_REGIONS)[number]; fee: number } {
  const region = DELIVERY_REGIONS.find((r) => r.id === regionId) ?? DELIVERY_REGIONS[0]
  const fee = FREE_DELIVERY_OVER !== null && subtotal >= FREE_DELIVERY_OVER ? 0 : region.fee
  return { region, fee }
}
