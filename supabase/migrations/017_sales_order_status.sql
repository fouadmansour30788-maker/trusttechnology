-- Widen the sales_orders status flow so staff can actually track fulfillment
-- (requested -> confirmed -> out for delivery -> delivered), matching the
-- repairs status pattern. There was previously no admin UI to change an
-- order's status at all — orders sat at 'draft' forever unless someone
-- edited the database directly. Adds one new intermediate value
-- ('out_for_delivery'); the existing four are untouched, so no data
-- migration is needed for current rows.

ALTER TABLE sales_orders DROP CONSTRAINT IF EXISTS sales_orders_status_check;
ALTER TABLE sales_orders ADD CONSTRAINT sales_orders_status_check
  CHECK (status IN ('draft', 'confirmed', 'out_for_delivery', 'fulfilled', 'cancelled'));
