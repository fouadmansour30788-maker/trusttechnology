-- Richer product-page content (ayoubcomputers.com-style): a scannable
-- key-features bullet list and a dedicated warranty paragraph, alongside
-- the existing free-text description and specs JSONB. Both nullable/empty
-- by default so existing rows render exactly as before until populated.
ALTER TABLE products ADD COLUMN IF NOT EXISTS key_features TEXT[] DEFAULT '{}';
ALTER TABLE products ADD COLUMN IF NOT EXISTS warranty_info TEXT;
