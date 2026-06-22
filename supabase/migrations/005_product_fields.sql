-- Trust Technology — extra product fields: cost, VAT, colors
-- Run after 001–004. Safe to re-run.

ALTER TABLE products ADD COLUMN IF NOT EXISTS cost DECIMAL(12,2) DEFAULT 0;       -- internal purchase cost (admin only)
ALTER TABLE products ADD COLUMN IF NOT EXISTS vat_rate DECIMAL(5,2) DEFAULT 11;   -- Lebanon standard VAT 11%
ALTER TABLE products ADD COLUMN IF NOT EXISTS colors TEXT[] DEFAULT '{}';         -- available colour options
