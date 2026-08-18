/**
 * Loyalty points rules — shared by the checkout page (display) and
 * /api/checkout (authoritative server-side calculation), same split as
 * delivery.ts.
 */
export const POINTS_EARN_PER_DOLLAR = 1 // 1 point per $1 of subtotal, floored
export const POINTS_PER_DOLLAR_REDEEM = 100 // 100 points = $1 off
export const POINTS_MIN_REDEEM = 100

export function pointsEarned(subtotal: number): number {
  return Math.floor(Math.max(0, subtotal) * POINTS_EARN_PER_DOLLAR)
}

export function pointsValue(points: number): number {
  return Math.round((points / POINTS_PER_DOLLAR_REDEEM) * 100) / 100
}

/** Largest valid redemption (multiple of POINTS_MIN_REDEEM) that doesn't exceed the balance or the order total. */
export function maxRedeemable(balance: number, orderTotal: number): number {
  const byBalance = Math.floor(balance / POINTS_MIN_REDEEM) * POINTS_MIN_REDEEM
  const byTotal = Math.floor(orderTotal * POINTS_PER_DOLLAR_REDEEM / POINTS_MIN_REDEEM) * POINTS_MIN_REDEEM
  return Math.max(0, Math.min(byBalance, byTotal))
}
