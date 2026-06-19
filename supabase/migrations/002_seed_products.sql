-- AUTO-GENERATED product seed from FULL PRICE LIST 11062026.xlsx
-- Run AFTER 001_schema.sql. Idempotent (ON CONFLICT DO NOTHING).

-- Brand tags
INSERT INTO tags (name, slug, type) VALUES
  ('Acer', 'acer', 'brand'),
  ('Apple', 'apple', 'brand'),
  ('Cedar', 'cedar', 'brand'),
  ('Dell', 'dell', 'brand'),
  ('Gigabyte', 'gigabyte', 'brand'),
  ('HP', 'hp', 'brand'),
  ('Lenovo', 'lenovo', 'brand'),
  ('MSI', 'msi', 'brand'),
  ('NEC', 'nec', 'brand'),
  ('Philips', 'philips', 'brand')
ON CONFLICT (slug) DO NOTHING;

-- Products
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'NEC VERSAPRO VEE11', 'nec-nec-versapro-vee11', 'CPU: INTEL N5100 1.1GHZ, RAM: 4GB RAM, Storage: 64GB SSD',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/nec-nec-versapro-vee11.jpg']::text[], '{"CPU": "INTEL N5100 1.1GHZ", "RAM": "4GB RAM", "Storage": "64GB SSD", "VGA": "INTEL", "Screen": "11.6\" HD X360 TOUCH", "LAN": "NO LAN", "Keyboard": "EN/JP", "OS": "WIN 11 EDUCATION", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASPIRE 5 (NX.KGZEM.00B)', 'acer-aspire-5-nx-kgzem-00b', 'CPU: CORE I7-1355U, RAM: 8GB DDR4, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/acer-aspire-5-nx-kgzem-00b.jpg']::text[], '{"CPU": "CORE I7-1355U", "RAM": "8GB DDR4", "Storage": "NVME 512GB", "VGA": "NVIDIA® GeForce® RTX™2050 4GB GDDR6 Dedicated Graphics", "Screen": "15.6\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LATTITUDE 5540 (210-BGBJ-I5) BLACK', 'dell-lattitude-5540-210-bgbj-i5-black', 'CPU: CORE I5 1335U, RAM: 8GB DDR4, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/dell-lattitude-5540-210-bgbj-i5-black.jpg']::text[], '{"CPU": "CORE I5 1335U", "RAM": "8GB DDR4", "Storage": "NVME 512GB", "VGA": "INTEL IRIS XE", "Screen": "15.6\" FHD", "LAN": "LAN", "Keyboard": "BACKLIT EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MHFA4HN/A', 'apple-mhfa4hn-a', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB RAM, Storage: SSD 256GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/apple-mhfa4hn-a.jpg']::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB RAM", "Storage": "SSD 256GB", "VGA": "5-CORE GPU", "Screen": "13\" 2408x1506", "Keyboard": "ENGLISH", "OS": "MAC OS/SILVER", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MHFD4LL/A', 'apple-mhfd4ll-a', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB RAM, Storage: SSD 256GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/apple-mhfd4ll-a.jpg']::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB RAM", "Storage": "SSD 256GB", "VGA": "5-CORE GPU", "Screen": "13\" 2408x1506", "Keyboard": "ENGLISH", "OS": "MAC OS/CITRUS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MHFF4HN/A', 'apple-mhff4hn-a', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB RAM, Storage: SSD 256GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/apple-mhff4hn-a.jpg']::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB RAM", "Storage": "SSD 256GB", "VGA": "5-CORE GPU", "Screen": "13\" 2408x1506", "Keyboard": "ENGLISH", "OS": "MAC OS/INDIGO", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MDHH4LL/A', 'apple-mdhh4ll-a', 'CPU: Apple M5 10-Core Chip, RAM: 16GB RAM, Storage: SSD 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/apple-mdhh4ll-a.jpg']::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB RAM", "Storage": "SSD 512GB", "VGA": "8-CORE GPU", "Screen": "13.6\" 2560x1664", "Keyboard": "ENGLISH", "OS": "MAC OS/SKYBLUE", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MDHA4HN/A', 'apple-mdha4hn-a', 'CPU: Apple M5 10-Core Chip, RAM: 16GB RAM, Storage: SSD 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/apple-mdha4hn-a.jpg']::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB RAM", "Storage": "SSD 512GB", "VGA": "8-CORE GPU", "Screen": "13.6\" 2560x1664", "Keyboard": "ENGLISH", "OS": "MAC OS/STARELIGHT", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MDHE4LL/A', 'apple-mdhe4ll-a', 'CPU: Apple M5 10-Core Chip, RAM: 16GB RAM, Storage: SSD 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/apple-mdhe4ll-a.jpg']::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB RAM", "Storage": "SSD 512GB", "VGA": "8-CORE GPU", "Screen": "13.6\" 2560x1664", "Keyboard": "ENGLISH", "OS": "MAC OS/MIDNIGHT", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MDVQ4LL/A', 'apple-mdvq4ll-a', 'CPU: Apple M5 10-Core Chip, RAM: 16GB RAM, Storage: SSD 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/apple-mdvq4ll-a.jpg']::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB RAM", "Storage": "SSD 512GB", "VGA": "10-CORE GPU", "Screen": "15.3\" 2880x1864", "Keyboard": "ENGLISH", "OS": "MAC OS/SKYBLUE", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MDVH4LL/A', 'apple-mdvh4ll-a', 'CPU: Apple M5 10-Core Chip, RAM: 16GB RAM, Storage: SSD 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/apple-mdvh4ll-a.jpg']::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB RAM", "Storage": "SSD 512GB", "VGA": "10-CORE GPU", "Screen": "15.3\" 2880x1864", "Keyboard": "ENGLISH", "OS": "MAC OS/MIDNIGHT", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MDE14LL/A', 'apple-mde14ll-a', 'CPU: Apple M5 10-Core Chip, RAM: 16GB RAM, Storage: SSD 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/apple-mde14ll-a.jpg']::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB RAM", "Storage": "SSD 1TB", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "Keyboard": "ENGLISH", "OS": "MAC OS/SPACE BLACK", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FC0033CA (B46P0UAR#ABL) / 256GB REF', 'hp-15-fc0033ca-b46p0uar-abl-256gb-ref', 'CPU: ATHLON 7120U, RAM: 8GB DDR5 ONBOARD, Storage: NVME 256GB*',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fc0033ca-b46p0uar-abl-256gb-ref.jpg']::text[], '{"CPU": "ATHLON 7120U", "RAM": "8GB DDR5 ONBOARD", "Storage": "NVME 256GB*", "VGA": "AMD Radeon 610M Graphics", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "DOS", "Warranty": "1YR/REF"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FC0033CA (B46P0UAR#ABL) REF', 'hp-15-fc0033ca-b46p0uar-abl-ref', 'CPU: ATHLON 7120U, RAM: 8GB DDR5 ONBOARD, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fc0033ca-b46p0uar-abl-ref.jpg']::text[], '{"CPU": "ATHLON 7120U", "RAM": "8GB DDR5 ONBOARD", "Storage": "NVME 512GB", "VGA": "AMD Radeon 610M Graphics", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "DOS", "Warranty": "1YR/REF"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FD0133WM (NATURAL SILVER)', 'hp-15-fd0133wm-natural-silver', 'CPU: CORE I3 N305, RAM: 8GB DDR4 + 1 SLOT, Storage: NVME 256GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fd0133wm-natural-silver.jpg']::text[], '{"CPU": "CORE I3 N305", "RAM": "8GB DDR4 + 1 SLOT", "Storage": "NVME 256GB", "VGA": "INTEL UHD GRAPHICS", "Screen": "15.6\"FHD", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FD0154WM (BZ1W9UA#ABA-125H)', 'hp-15-fd0154wm-bz1w9ua-aba-125h', 'CPU: CORE ULTRA 5 125H, RAM: 8GB DDR5 + 1 SLOT, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fd0154wm-bz1w9ua-aba-125h.jpg']::text[], '{"CPU": "CORE ULTRA 5 125H", "RAM": "8GB DDR5 + 1 SLOT", "Storage": "NVME 512GB", "VGA": "INTEL IRIS XE", "Screen": "15.6\" FHD TOUCH", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FD0250WM (SILVER)', 'hp-15-fd0250wm-silver', 'CPU: CORE I5-1334U, RAM: 8GB DDR4 + 1 SLOT, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fd0250wm-silver.jpg']::text[], '{"CPU": "CORE I5-1334U", "RAM": "8GB DDR4 + 1 SLOT", "Storage": "NVME 512GB", "VGA": "INTEL IRIS XE", "Screen": "15.6\" HD", "LAN": "NO LAN", "Keyboard": "EN/AR* (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '250 G10 (SILVER)', 'hp-250-g10-silver', 'CPU: CORE I5-1334U, RAM: 8GB DDR4 + 1 SLOT, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-250-g10-silver.jpg']::text[], '{"CPU": "CORE I5-1334U", "RAM": "8GB DDR4 + 1 SLOT", "Storage": "NVME 512GB", "VGA": "INTEL IRIS XE", "Screen": "15.6\" HD", "LAN": "NO LAN", "Keyboard": "EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AI 15-FD2023NE (NATURAL SILVER)', 'hp-ai-15-fd2023ne-natural-silver', 'CPU: CORE ULTRA 5 225U, RAM: 8GB DDR5 + 1 SLOT, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-ai-15-fd2023ne-natural-silver.jpg']::text[], '{"CPU": "CORE ULTRA 5 225U", "RAM": "8GB DDR5 + 1 SLOT", "Storage": "NVME 512GB", "VGA": "Intel® Graphics", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "BACKLIT EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FD1899NR (SILVER)', 'hp-15-fd1899nr-silver', 'CPU: CORE 7 150U, RAM: 16GB DDR4, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fd1899nr-silver.jpg']::text[], '{"CPU": "CORE 7 150U", "RAM": "16GB DDR4", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FD0143NE (NATURAL SILVER)', 'hp-15-fd0143ne-natural-silver', 'CPU: CORE I7-1355U, RAM: 8GB DDR4 (8GB + 1SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fd0143ne-natural-silver.jpg']::text[], '{"CPU": "CORE I7-1355U", "RAM": "8GB DDR4 (8GB + 1SLOT)", "Storage": "NVME 512GB", "VGA": "VGA 2GB MX570", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "BACKLIT EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FD0371NIA (NATURAL SILVER)', 'hp-15-fd0371nia-natural-silver', 'CPU: CORE I7-1355U, RAM: 8GB DDR4 + 1 SLOT, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fd0371nia-natural-silver.jpg']::text[], '{"CPU": "CORE I7-1355U", "RAM": "8GB DDR4 + 1 SLOT", "Storage": "NVME 512GB", "VGA": "VGA 2GB MX570", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "BACKLIT EN/AR* (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FD0138NE (NATURAL SILVER)', 'hp-15-fd0138ne-natural-silver', 'CPU: CORE I7-1355U, RAM: 16GB DDR4 (8GB*2), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fd0138ne-natural-silver.jpg']::text[], '{"CPU": "CORE I7-1355U", "RAM": "16GB DDR4 (8GB*2)", "Storage": "NVME 512GB", "VGA": "VGA 2GB MX570", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "BACKLIT EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '15-FD0142NE (NATURAL SILVER)', 'hp-15-fd0142ne-natural-silver', 'CPU: CORE I7-1355U, RAM: 16GB DDR4 (8GB*2), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-15-fd0142ne-natural-silver.jpg']::text[], '{"CPU": "CORE I7-1355U", "RAM": "16GB DDR4 (8GB*2)", "Storage": "NVME 512GB", "VGA": "VGA 2GB MX570", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "BACKLIT EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AI 15-FD2022NE (NATURALSILVER)', 'hp-ai-15-fd2022ne-naturalsilver', 'CPU: CORE ULTRA 7 255U, RAM: 8GB DDR5 + 1 SLOT, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-ai-15-fd2022ne-naturalsilver.jpg']::text[], '{"CPU": "CORE ULTRA 7 255U", "RAM": "8GB DDR5 + 1 SLOT", "Storage": "NVME 512GB", "VGA": "Intel® Graphics", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "BACKLIT EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'PROBOOK 460G11 (A22ZZEA#ABV)', 'hp-probook-460g11-a22zzea-abv', 'CPU: CORE ULTRA 5-125U, RAM: 8GB DDR5 (8GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-probook-460g11-a22zzea-abv.webp']::text[], '{"CPU": "CORE ULTRA 5-125U", "RAM": "8GB DDR5 (8GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT EN/AR", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'PROBOOK 460G11 (CT9N7ET) + BAG', 'hp-probook-460g11-ct9n7et-bag', 'CPU: CORE ULTRA 5-125U, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-probook-460g11-ct9n7et-bag.webp']::text[], '{"CPU": "CORE ULTRA 5-125U", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT EN/AR", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'PROBOOK 4G1I (D0VG6ET#BH5)', 'hp-probook-4g1i-d0vg6et-bh5', 'CPU: CORE ULTRA 7-255U, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-probook-4g1i-d0vg6et-bh5.webp']::text[], '{"CPU": "CORE ULTRA 7-255U", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "14\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'PROBOOK 4G1I (AT6F5AV)', 'hp-probook-4g1i-at6f5av', 'CPU: CORE ULTRA 7-255U, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-probook-4g1i-at6f5av.webp']::text[], '{"CPU": "CORE ULTRA 7-255U", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "14\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'PROBOOK 4G1I (D0VG1ET#BH5)', 'hp-probook-4g1i-d0vg1et-bh5', 'CPU: CORE ULTRA 7-255U, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-probook-4g1i-d0vg1et-bh5.webp']::text[], '{"CPU": "CORE ULTRA 7-255U", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'PROBOOK 4G1I (AT7K5AV)', 'hp-probook-4g1i-at7k5av', 'CPU: CORE ULTRA 7-255U, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-probook-4g1i-at7k5av.webp']::text[], '{"CPU": "CORE ULTRA 7-255U", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'PROBOOK 4G1I (CT1G9ET)', 'hp-probook-4g1i-ct1g9et', 'CPU: CORE ULTRA 7-255U, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-probook-4g1i-ct1g9et.webp']::text[], '{"CPU": "CORE ULTRA 7-255U", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT EN/AR", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'PROBOOK 4G1I (D0UV0ET#BH5)', 'hp-probook-4g1i-d0uv0et-bh5', 'CPU: CORE ULTRA 7-255H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-probook-4g1i-d0uv0et-bh5.webp']::text[], '{"CPU": "CORE ULTRA 7-255H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 1TB", "VGA": "RTX 3050 4GB", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'OMNIBOOK 5 FLIP 14-FP0023DX', 'hp-omnibook-5-flip-14-fp0023dx', 'CPU: CORE 7 150U, RAM: 16GB DDR5 ONBOARD, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-omnibook-5-flip-14-fp0023dx.webp']::text[], '{"CPU": "CORE 7 150U", "RAM": "16GB DDR5 ONBOARD", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "14\" 2K (1920*1200) TOUCH", "LAN": "NO LAN", "Keyboard": "BACKLIT ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ELITEBOOK ULTRA G1Q (A4JE4UT#ABA) BLUE', 'hp-elitebook-ultra-g1q-a4je4ut-aba-blue', 'CPU: Snapdragon X1E-78-100, RAM: 16GB DDR5 ONBOARD, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-elitebook-ultra-g1q-a4je4ut-aba-blue.webp']::text[], '{"CPU": "Snapdragon X1E-78-100", "RAM": "16GB DDR5 ONBOARD", "Storage": "NVME 512GB", "VGA": "Qualcomm® Adreno™ GPU", "Screen": "14\" (2240x1400) TOUCHSCREEN", "LAN": "NO LAN", "Keyboard": "BACKLIT ENGLISH (US)", "OS": "WIN 11 PRO", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ELITEBOOK 660G11 (A6UC4UT#ABA) SILVER', 'hp-elitebook-660g11-a6uc4ut-aba-silver', 'CPU: CORE ULTRA 7 165U VPRO, RAM: 16GB DDR5 + 1 SLOT, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-elitebook-660g11-a6uc4ut-aba-silver.webp']::text[], '{"CPU": "CORE ULTRA 7 165U VPRO", "RAM": "16GB DDR5 + 1 SLOT", "Storage": "NVME 512GB", "VGA": "INTEL GRAPHICS", "Screen": "16\" IPS FHD", "LAN": "NO LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "WIN11 PRO", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ELITEBOOK 840G11 (B1SB9UP) SILVER', 'hp-elitebook-840g11-b1sb9up-silver', 'CPU: CORE ULTRA 5 125U, RAM: 16GB DDR5, Storage: NVME 256GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-elitebook-840g11-b1sb9up-silver.webp']::text[], '{"CPU": "CORE ULTRA 5 125U", "RAM": "16GB DDR5", "Storage": "NVME 256GB", "VGA": "INTEL GRAPHICS", "Screen": "14\" IPS FHD TOUCH", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "WIN11 PRO", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'SPECTRE 16-AA0013 (NIGHTFALL BLACK) REFURB', 'hp-spectre-16-aa0013-nightfall-black-refurb', 'CPU: CORE ULTRA 7 155H, RAM: 16GB DDR5 ONBOARD, Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-spectre-16-aa0013-nightfall-black-refurb.webp']::text[], '{"CPU": "CORE ULTRA 7 155H", "RAM": "16GB DDR5 ONBOARD", "Storage": "NVME 1TB", "VGA": "Intel® Arc™ Graphics", "Screen": "16\" (2880x1800) Touch Screen", "LAN": "NO LAN", "Keyboard": "BACKLIT ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ENVY 16-AD0097NR (METEOR SILVER) REFURB', 'hp-envy-16-ad0097nr-meteor-silver-refurb', 'CPU: RYZEN 7 8840HS, RAM: 16GB DDR5 ONBOARD, Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-envy-16-ad0097nr-meteor-silver-refurb.webp']::text[], '{"CPU": "RYZEN 7 8840HS", "RAM": "16GB DDR5 ONBOARD", "Storage": "NVME 1TB", "VGA": "AMD Radeon Graphics", "Screen": "16″ (2880×1880) OLED TOUCHSCREEN", "LAN": "NO LAN", "Keyboard": "BACKLIT ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'VICTUS 15-FA2082WM (MICA SILVER)', 'hp-victus-15-fa2082wm-mica-silver', 'CPU: CORE I5-13420H, RAM: 16GB DDR5, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-victus-15-fa2082wm-mica-silver.webp']::text[], '{"CPU": "CORE I5-13420H", "RAM": "16GB DDR5", "Storage": "NVME 512GB", "VGA": "NVIDIA RTX 4050 6GB DDR6", "Screen": "15.6\" FHD 144HZ", "LAN": "NO LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'VICTUS 15-FA2021NIA (MICA SILVER)', 'hp-victus-15-fa2021nia-mica-silver', 'CPU: CORE I7-13620H, RAM: 16GB DDR4 (16GB DDR4+1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-victus-15-fa2021nia-mica-silver.webp']::text[], '{"CPU": "CORE I7-13620H", "RAM": "16GB DDR4 (16GB DDR4+1 SLOT)", "Storage": "NVME 512GB", "VGA": "NVIDIA RTX 3050 6GB DDR6", "Screen": "15.6\" FHD IPS 144HZ", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'OMEN 16-AN0075CL (SHADOW BLACK)', 'hp-omen-16-an0075cl-shadow-black', 'CPU: CORE ULTRA 9-285H, RAM: 32GB DDR5 (16GB*2), Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/hp-omen-16-an0075cl-shadow-black.webp']::text[], '{"CPU": "CORE ULTRA 9-285H", "RAM": "32GB DDR5 (16GB*2)", "Storage": "NVME 1TB", "VGA": "NVIDIA RTX 5070 8GB DDR7", "Screen": "16\" IPS WQXGA (2560 x 1600), 60-240 Hz, 3 ms response time, IPS, micro-edge, anti-glare, Low Blue Light, 500 nits, 100% Srgb", "LAN": "NO LAN", "Keyboard": "4-zone RGB BACKLIT ENGLISH", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IP1-82LX00GSAD (ARCTIC GREY) + CARRY CASE', 'lenovo-ip1-82lx00gsad-arctic-grey-carry-case', 'CPU: CELERON N4500, RAM: 8GB DDR4, Storage: NVME 256GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ip1-82lx00gsad-arctic-grey-carry-case.webp']::text[], '{"CPU": "CELERON N4500", "RAM": "8GB DDR4", "Storage": "NVME 256GB", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.6\" HD", "LAN": "NO LAN", "Keyboard": "EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IPS3-82X700HRAX (ARCTIC GREY)', 'lenovo-ips3-82x700hrax-arctic-grey', 'CPU: CORE I3-1315U, RAM: 8GB DDR5 ONBOARD, Storage: NVME 256GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ips3-82x700hrax-arctic-grey.webp']::text[], '{"CPU": "CORE I3-1315U", "RAM": "8GB DDR5 ONBOARD", "Storage": "NVME 256GB (2242)", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IPS3-82X700DFDP (ARCTIC GREY) + CARRY CASE', 'lenovo-ips3-82x700dfdp-arctic-grey-carry-case', 'CPU: CORE I3-1315U, RAM: 8GB DDR5 ONBOARD, Storage: NVME 512GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ips3-82x700dfdp-arctic-grey-carry-case.webp']::text[], '{"CPU": "CORE I3-1315U", "RAM": "8GB DDR5 ONBOARD", "Storage": "NVME 512GB (2242)", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'V15-83GW0076GP (BUSINESS BLACK)', 'lenovo-v15-83gw0076gp-business-black', 'CPU: CORE I3-1315U, RAM: 8GB DDR5 + 1 SLOT, Storage: NVME 256GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-v15-83gw0076gp-business-black.webp']::text[], '{"CPU": "CORE I3-1315U", "RAM": "8GB DDR5 + 1 SLOT", "Storage": "NVME 256GB (2242)", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.6\" FHD", "LAN": "LAN", "Keyboard": "ENGLISH (UK)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'V15-83GW0066PB (BUSINESS BLACK)', 'lenovo-v15-83gw0066pb-business-black', 'CPU: CORE I5-13420H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-v15-83gw0066pb-business-black.webp']::text[], '{"CPU": "CORE I5-13420H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.6\" FHD", "LAN": "LAN", "Keyboard": "ENGLISH (EU)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IP1-83B40006US (ABYSS BLUE)', 'lenovo-ip1-83b40006us-abyss-blue', 'CPU: CORE I5-1335U, RAM: 8GB DDR4 + 1 SLOT, Storage: NVME 256GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ip1-83b40006us-abyss-blue.webp']::text[], '{"CPU": "CORE I5-1335U", "RAM": "8GB DDR4 + 1 SLOT", "Storage": "NVME 256GB (2242)", "VGA": "INTEL IRIS XE", "Screen": "15.6\" IPS TOUCH", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IP1-83B40006US/512GB (ABYSS BLUE)', 'lenovo-ip1-83b40006us-512gb-abyss-blue', 'CPU: CORE I5-1335U, RAM: 8GB DDR4 + 1 SLOT, Storage: NVME 512GB (2242)*',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ip1-83b40006us-512gb-abyss-blue.webp']::text[], '{"CPU": "CORE I5-1335U", "RAM": "8GB DDR4 + 1 SLOT", "Storage": "NVME 512GB (2242)*", "VGA": "INTEL IRIS XE", "Screen": "15.6\" IPS TOUCH", "LAN": "NO LAN", "Keyboard": "EN/AR* (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IP1-83B40008US (CLOUD GREY)', 'lenovo-ip1-83b40008us-cloud-grey', 'CPU: CORE I5-1335U, RAM: 16GB DDR4 (8GB ONBOARD+8GB SLOT), Storage: NVME 256 (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ip1-83b40008us-cloud-grey.webp']::text[], '{"CPU": "CORE I5-1335U", "RAM": "16GB DDR4 (8GB ONBOARD+8GB SLOT)", "Storage": "NVME 256 (2242)", "VGA": "INTEL IRIS XE", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IP1-83B40008US/512GB (CLOUD GREY)', 'lenovo-ip1-83b40008us-512gb-cloud-grey', 'CPU: CORE I5-1335U, RAM: 16GB DDR4 (8GB ONBOARD+8GB SLOT), Storage: NVME 512 (2242)*',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ip1-83b40008us-512gb-cloud-grey.webp']::text[], '{"CPU": "CORE I5-1335U", "RAM": "16GB DDR4 (8GB ONBOARD+8GB SLOT)", "Storage": "NVME 512 (2242)*", "VGA": "INTEL IRIS XE", "Screen": "15.6\" FHD", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IPS3-83K100E9AX (LUNA GREY)', 'lenovo-ips3-83k100e9ax-luna-grey', 'CPU: CORE I5-13420H, RAM: 8GB DDR5 (8GB ONBOARD + 1 SLOT), Storage: NVME 512GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ips3-83k100e9ax-luna-grey.webp']::text[], '{"CPU": "CORE I5-13420H", "RAM": "8GB DDR5 (8GB ONBOARD + 1 SLOT)", "Storage": "NVME 512GB (2242)", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.3\" IPS FHD", "LAN": "NO LAN", "Keyboard": "EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IPS3-83K100C1DP (LUNA GREY)', 'lenovo-ips3-83k100c1dp-luna-grey', 'CPU: CORE I5-13420H, RAM: 16GB DDR5 (8GB ONBOARD+8GB), Storage: NVME 512GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ips3-83k100c1dp-luna-grey.webp']::text[], '{"CPU": "CORE I5-13420H", "RAM": "16GB DDR5 (8GB ONBOARD+8GB)", "Storage": "NVME 512GB (2242)", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.3\" IPS FHD", "LAN": "NO LAN", "Keyboard": "EN/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'V15-83CR000PIN (IRON GREY)', 'lenovo-v15-83cr000pin-iron-grey', 'CPU: RYZEN 7-7730U, RAM: 8GB DDR4 (8GB + 1SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-v15-83cr000pin-iron-grey.webp']::text[], '{"CPU": "RYZEN 7-7730U", "RAM": "8GB DDR4 (8GB + 1SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated AMD Radeon™ Graphics", "Screen": "15.6\" FHD", "LAN": "LAN", "Keyboard": "ENGLISH (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'V14-83A000PCUS (BUSINESS BLACK)', 'lenovo-v14-83a000pcus-business-black', 'CPU: CORE I7-13620H, RAM: 16GB DDR4 (8GB ONBOARD+8GB SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-v14-83a000pcus-business-black.webp']::text[], '{"CPU": "CORE I7-13620H", "RAM": "16GB DDR4 (8GB ONBOARD+8GB SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® UHD Graphics", "Screen": "14\" FHD", "LAN": "LAN", "Keyboard": "ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'V15-83GW006VED (BUSINESS BLACK) + CARRY CASE', 'lenovo-v15-83gw006ved-business-black-carry-case', 'CPU: CORE I7-13620H, RAM: 8GB DDR5 + 1 SLOT, Storage: NVME 512GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-v15-83gw006ved-business-black-carry-case.webp']::text[], '{"CPU": "CORE I7-13620H", "RAM": "8GB DDR5 + 1 SLOT", "Storage": "NVME 512GB (2242)", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.6\" FHD", "LAN": "LAN", "Keyboard": "EN/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'V15-83HF00EMIG (LUNA GREY)', 'lenovo-v15-83hf00emig-luna-grey', 'CPU: CORE I7-13620H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-v15-83hf00emig-luna-grey.webp']::text[], '{"CPU": "CORE I7-13620H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.6\" FHD", "LAN": "LAN", "Keyboard": "ENG/AR* (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IDEAPAD SLIM3-83K100E8AX (LUNA GREY)', 'lenovo-ideapad-slim3-83k100e8ax-luna-grey', 'CPU: CORE I7-13620H, RAM: 16GB DDR5 (8GB ONBOARD + 8GB SLOT), Storage: NVME 512GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ideapad-slim3-83k100e8ax-luna-grey.webp']::text[], '{"CPU": "CORE I7-13620H", "RAM": "16GB DDR5 (8GB ONBOARD + 8GB SLOT)", "Storage": "NVME 512GB (2242)", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.3\" IPS FHD", "LAN": "NO LAN", "Keyboard": "EN/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IDEAPAD SLIM3-83K100E7DP (LUNA GREY)', 'lenovo-ideapad-slim3-83k100e7dp-luna-grey', 'CPU: CORE I7-13620H, RAM: 16GB DDR5 (8GB ONBOARD + 8GB SLOT), Storage: NVME 512GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ideapad-slim3-83k100e7dp-luna-grey.webp']::text[], '{"CPU": "CORE I7-13620H", "RAM": "16GB DDR5 (8GB ONBOARD + 8GB SLOT)", "Storage": "NVME 512GB (2242)", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.3\" IPS FHD", "LAN": "NO LAN", "Keyboard": "EN/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'IDEAPAD SLIM3-82X700HUUS (LUNA GREY)', 'lenovo-ideapad-slim3-82x700huus-luna-grey', 'CPU: CORE I7-1355U, RAM: 16GB DDR5, Storage: NVME 1TB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-ideapad-slim3-82x700huus-luna-grey.webp']::text[], '{"CPU": "CORE I7-1355U", "RAM": "16GB DDR5", "Storage": "NVME 1TB (2242)", "VGA": "Integrated Intel® UHD Graphics", "Screen": "15.6\" FHD TOUCH", "LAN": "NO LAN", "Keyboard": "ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E14-21T9004VED + CARRY CASE', 'lenovo-e14-21t9004ved-carry-case', 'CPU: INTEL CORE 5 210H, RAM: 8GB DDR5 (8GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e14-21t9004ved-carry-case.webp']::text[], '{"CPU": "INTEL CORE 5 210H", "RAM": "8GB DDR5 (8GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Graphics", "Screen": "14\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E14-21SXS0N600', 'lenovo-e14-21sxs0n600', 'CPU: CORE ULTRA 5 225H, RAM: 8GB DDR5 (8GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e14-21sxs0n600.webp']::text[], '{"CPU": "CORE ULTRA 5 225H", "RAM": "8GB DDR5 (8GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Graphics", "Screen": "14\" IPS FHD", "LAN": "LAN", "Keyboard": "ENGLSIH (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E16-21TF005DED + CARRY CASE', 'lenovo-e16-21tf005ded-carry-case', 'CPU: INTEL CORE 5 210H, RAM: 8GB DDR5 (8GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e16-21tf005ded-carry-case.webp']::text[], '{"CPU": "INTEL CORE 5 210H", "RAM": "8GB DDR5 (8GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Graphics", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E16-21SR005CED + CARRY CASE', 'lenovo-e16-21sr005ced-carry-case', 'CPU: CORE ULTRA 5 225U, RAM: 8GB DDR5 (8GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e16-21sr005ced-carry-case.webp']::text[], '{"CPU": "CORE ULTRA 5 225U", "RAM": "8GB DDR5 (8GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Graphics", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E14-21T90053ED + CARRY CASE', 'lenovo-e14-21t90053ed-carry-case', 'CPU: INTEL CORE 7- 240H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e14-21t90053ed-carry-case.webp']::text[], '{"CPU": "INTEL CORE 7- 240H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Graphics", "Screen": "14\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E14-21SX006UED + CARRY CASE', 'lenovo-e14-21sx006ued-carry-case', 'CPU: CORE ULTRA 7-255H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e14-21sx006ued-carry-case.webp']::text[], '{"CPU": "CORE ULTRA 7-255H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Arc™ 140T GPU Functions as Intel® Graphics", "Screen": "14\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E16-21TF0057ED + CARRY CASE', 'lenovo-e16-21tf0057ed-carry-case', 'CPU: INTEL CORE 7- 240H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e16-21tf0057ed-carry-case.webp']::text[], '{"CPU": "INTEL CORE 7- 240H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Graphics", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E16-21SR0063ED + CARRY CASE', 'lenovo-e16-21sr0063ed-carry-case', 'CPU: CORE ULTRA 7 255H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e16-21sr0063ed-carry-case.webp']::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Arc™ 140T GPU Functions as Intel® Graphics", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E16-21SRS0UQ00', 'lenovo-e16-21srs0uq00', 'CPU: CORE ULTRA 7 255H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e16-21srs0uq00.webp']::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Arc™ 140T GPU Functions as Intel® Graphics", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TB 16- 21US003MED + CARRY CASE', 'lenovo-tb-16-21us003med-carry-case', 'CPU: CORE 7-240H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-tb-16-21us003med-carry-case.webp']::text[], '{"CPU": "CORE 7-240H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "INTEGRATED INTEL GRAPHICS", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "ENG / AR", "OS": "DOS", "Warranty": "2 YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'E16-21SR005YED + CARRY CASE', 'lenovo-e16-21sr005yed-carry-case', 'CPU: CORE ULTRA 7-255H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 1 TERRA',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-e16-21sr005yed-carry-case.webp']::text[], '{"CPU": "CORE ULTRA 7-255H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 1 TERRA", "VGA": "Integrated Intel® Arc™ 140T GPU Functions as Intel® Graphics", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENG/AR", "OS": "DOS", "Warranty": "2 YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKBOOK 14-21SJS05S00', 'lenovo-thinkbook-14-21sjs05s00', 'CPU: CORE ULTRA 7 255H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-thinkbook-14-21sjs05s00.webp']::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Arc™ 140T GPU Functions as Intel® Graphics", "Screen": "14\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKBOOK 16-21SK0030GQ (ARCTIC GREY) + CARRY CASE', 'lenovo-thinkbook-16-21sk0030gq-arctic-grey-carry-case', 'CPU: CORE ULTRA 7 255H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-thinkbook-16-21sk0030gq-arctic-grey-carry-case.webp']::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Arc™ 140T GPU Functions as Intel Graphics", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH (EU)/AR*", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKBOOK 16-21SKS05C00', 'lenovo-thinkbook-16-21sks05c00', 'CPU: CORE ULTRA 7 255H, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-thinkbook-16-21sks05c00.webp']::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Arc™ 140T GPU Functions as Intel Graphics", "Screen": "16\" IPS FHD", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'YOGA 7-83DL0002US (STORM GREY)', 'lenovo-yoga-7-83dl0002us-storm-grey', 'CPU: CORE ULTRA 7 155U, RAM: 16GB DDR5 ONBOARD, Storage: NVME 1TB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-yoga-7-83dl0002us-storm-grey.webp']::text[], '{"CPU": "CORE ULTRA 7 155U", "RAM": "16GB DDR5 ONBOARD", "Storage": "NVME 1TB (2242)", "VGA": "Integrated Intel® Graphics", "Screen": "16\" IPS FHD TOUCH", "LAN": "NO LAN", "Keyboard": "BACKLIT ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD T14-21QDS6DX00', 'lenovo-thinkpad-t14-21qds6dx00', 'CPU: CORE ULTRA 7 255U, RAM: 16GB DDR5, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-thinkpad-t14-21qds6dx00.webp']::text[], '{"CPU": "CORE ULTRA 7 255U", "RAM": "16GB DDR5", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Graphics", "Screen": "14\" IPS TOUCH", "LAN": "LAN", "Keyboard": "BACKLIT ENGLSIH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD T14-21MMS1SK00 (NEW OPEN BOX)', 'lenovo-thinkpad-t14-21mms1sk00-new-open-box', 'CPU: CORE ULTRA 7 165U VPRO, RAM: 16GB DDR5, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-thinkpad-t14-21mms1sk00-new-open-box.webp']::text[], '{"CPU": "CORE ULTRA 7 165U VPRO", "RAM": "16GB DDR5", "Storage": "NVME 512GB", "VGA": "Integrated Intel® Graphics", "Screen": "14\" WUXGA", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH (US)", "OS": "WIN11 PRO", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LOQ-83DV01BCAX (LUNA GREY)', 'lenovo-loq-83dv01bcax-luna-grey', 'CPU: CORE I5-13450HX, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-loq-83dv01bcax-luna-grey.webp']::text[], '{"CPU": "CORE I5-13450HX", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "NVIDIA® GeForce RTX™ 3050 6GB GDDR6, Boost Clock 1732MHz, TGP 95W, 142 AI TOPS", "Screen": "15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNC®", "LAN": "LAN", "Keyboard": "WHITE BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LOQ-83DV000EAX (LUNA GREY)', 'lenovo-loq-83dv000eax-luna-grey', 'CPU: CORE I7-13650HX, RAM: 16GB DDR5 (16GB+ 1SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-loq-83dv000eax-luna-grey.webp']::text[], '{"CPU": "CORE I7-13650HX", "RAM": "16GB DDR5 (16GB+ 1SLOT)", "Storage": "NVME 512GB", "VGA": "NVIDIA® GeForce RTX™ 3050 6GB GDDR6, Boost Clock 1732MHz, TGP 95W, 142 AI TOPS", "Screen": "15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNC®", "LAN": "LAN", "Keyboard": "WHITE BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LOQ-83LK003TPS (LUNA GREY)', 'lenovo-loq-83lk003tps-luna-grey', 'CPU: CORE I7-12650HX, RAM: 16GB DDR5 SLOT, Storage: NVME 512GB (2242)',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-loq-83lk003tps-luna-grey.webp']::text[], '{"CPU": "CORE I7-12650HX", "RAM": "16GB DDR5 SLOT", "Storage": "NVME 512GB (2242)", "VGA": "NVIDIA® GeForce RTX™ 4050 6GB GDDR6, Boost Clock 2145MHz, TGP 65W, 194 AI TOPS", "Screen": "15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz", "LAN": "LAN", "Keyboard": "WHITE BACKLIT ENGLISH (UK)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LOQ-83DV000DAX (LUNA GREY)', 'lenovo-loq-83dv000dax-luna-grey', 'CPU: CORE I7-13650HX, RAM: 16GB DDR5 (16GB+ 1SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-loq-83dv000dax-luna-grey.webp']::text[], '{"CPU": "CORE I7-13650HX", "RAM": "16GB DDR5 (16GB+ 1SLOT)", "Storage": "NVME 512GB", "VGA": "NVIDIA® GeForce RTX™ 4050 6GB GDDR6, Boost Clock 2370MHz, TGP 105W, 194 AI TOPS", "Screen": "15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNC®", "LAN": "LAN", "Keyboard": "WHITE BACKLIT ENG/AR", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LOQ-83JE00KWAX (LUNA GREY)', 'lenovo-loq-83je00kwax-luna-grey', 'CPU: CORE I7-13700HX, RAM: 24GB DDR5 (12GB*2), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-loq-83je00kwax-luna-grey.webp']::text[], '{"CPU": "CORE I7-13700HX", "RAM": "24GB DDR5 (12GB*2)", "Storage": "NVME 512GB", "VGA": "NVIDIA® GeForce RTX™ 5050 8GB GDDR7, Boost Clock 2370MHz, TGP 100W, 440 AI TOPS", "Screen": "15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNC®", "LAN": "LAN", "Keyboard": "WHITE BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LOQ-83JE0114AX (LUNA GREY)', 'lenovo-loq-83je0114ax-luna-grey', 'CPU: CORE I7-14700HX, RAM: 16GB DDR5 (16GB + 1 SLOT), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-loq-83je0114ax-luna-grey.webp']::text[], '{"CPU": "CORE I7-14700HX", "RAM": "16GB DDR5 (16GB + 1 SLOT)", "Storage": "NVME 512GB", "VGA": "NVIDIA® GeForce RTX™ 5050 8GB GDDR7, Boost Clock 2370MHz, TGP 100W, 440 AI TOPS", "Screen": "15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNC®", "LAN": "LAN", "Keyboard": "WHITE BACKLIT ENG/AR (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LOQ-83JE002LUS (LUNA GREY)', 'lenovo-loq-83je002lus-luna-grey', 'CPU: CORE I7-13650HX, RAM: 16GB DDR5 + 1 SLOT, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-loq-83je002lus-luna-grey.webp']::text[], '{"CPU": "CORE I7-13650HX", "RAM": "16GB DDR5 + 1 SLOT", "Storage": "NVME 512GB", "VGA": "NVIDIA® GeForce RTX™ 5060 8GB GDDR7, Boost Clock 2497MHz, TGP 100W, 572 AI TOPS", "Screen": "15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNC®", "LAN": "LAN", "Keyboard": "WHITE BACKLIT ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LOQ-83JE00XAFU/512GB* (LUNA GREY)', 'lenovo-loq-83je00xafu-512gb-luna-grey', 'CPU: CORE I7-14700HX, RAM: 16GB DDR5 + 1 SLOT, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-loq-83je00xafu-512gb-luna-grey.webp']::text[], '{"CPU": "CORE I7-14700HX", "RAM": "16GB DDR5 + 1 SLOT", "Storage": "NVME 512GB", "VGA": "NVIDIA GeForce RTX™ 5060 8GB GDDR7, Boost Clock 2497MHz, TGP 100W, 572 AI TOPS", "Screen": "15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNC®", "LAN": "LAN", "Keyboard": "WHITE BACKLIT ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LOQ-83JE00XAFU (LUNA GREY)', 'lenovo-loq-83je00xafu-luna-grey', 'CPU: CORE I7-14700HX, RAM: 16GB DDR5 + 1 SLOT, Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-loq-83je00xafu-luna-grey.webp']::text[], '{"CPU": "CORE I7-14700HX", "RAM": "16GB DDR5 + 1 SLOT", "Storage": "NVME 1TB", "VGA": "NVIDIA GeForce RTX™ 5060 8GB GDDR7, Boost Clock 2497MHz, TGP 100W, 572 AI TOPS", "Screen": "15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNC®", "LAN": "LAN", "Keyboard": "WHITE BACKLIT ENGLISH (US)", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LEGION 5-83NX0000US (STORM GREY)', 'lenovo-legion-5-83nx0000us-storm-grey', 'CPU: Core™ Ultra 9 275HX, RAM: 32GB DDR5 (16GB*2), Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-legion-5-83nx0000us-storm-grey.webp']::text[], '{"CPU": "Core™ Ultra 9 275HX", "RAM": "32GB DDR5 (16GB*2)", "Storage": "NVME 1TB", "VGA": "NVIDIA GeForce RTX™ 5060 8GB GDDR7, Boost Clock 2497MHz, TGP 105W, 572 AI TOPS", "Screen": "16\" WQXGA (2560x1600) IPS 500nits Anti-glare, 100% DCI-P3, 240Hz, DisplayHDR™ 400, Dolby Vision®, G-SYNC®, Low Blue Light, High Gaming Performance", "LAN": "LAN", "Keyboard": "24-Zone RGB Backlit, English", "OS": "WIN11 HOME", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LEGION 5-83LY00N9AX (ECLIPSE BLACK)', 'lenovo-legion-5-83ly00n9ax-eclipse-black', 'CPU: CORE I9-14900HX, RAM: 32GB DDR5 (16GB*2), Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-legion-5-83ly00n9ax-eclipse-black.webp']::text[], '{"CPU": "CORE I9-14900HX", "RAM": "32GB DDR5 (16GB*2)", "Storage": "NVME 1TB", "VGA": "NVIDIA GeForce RTX™ 5070 8GB GDDR7, Boost Clock 2347MHz, TGP 115W, 798 AI TOPS", "Screen": "15.1\" WQXGA (2560x1600) OLED 1000nits (peak) / 500nits (typical) glossy, 100% DCI-P3, 165Hz, Dolby Vision®, DisplayHDR™ True Black 600", "LAN": "LAN", "Keyboard": "24-Zone RGB Backlit, Arabic", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LEGION PRO 5-83NN001XAX (ECLIPSE BLACK)', 'lenovo-legion-pro-5-83nn001xax-eclipse-black', 'CPU: CORE I9-14900HX, RAM: 32GB DDR5(16GB*2), Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/lenovo-legion-pro-5-83nn001xax-eclipse-black.webp']::text[], '{"CPU": "CORE I9-14900HX", "RAM": "32GB DDR5(16GB*2)", "Storage": "NVME 1TB", "VGA": "NVIDIA® GeForce RTX™ 5070 8GB GDDR7, Boost Clock 2347MHz, TGP 115W, 798 AI TOPS,AI CHIP :LA3", "Screen": "16\" WQXGA (2560x1600) IPS 500nits Anti-glare, 100% DCI-P3, 240Hz, DisplayHDR™ 400, Dolby Vision®, G-SYNC®, Low Blue Light, High Gaming Performance", "LAN": "LAN", "Keyboard": "24-ZONE RGB BACKLIT,ARABIC", "OS": "DOS", "Warranty": "2YS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CYBORG 15-A13UC', 'msi-cyborg-15-a13uc', 'CPU: CORE I7-13620H, RAM: 16GB DDR5 (8GB*2), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/msi-cyborg-15-a13uc.webp']::text[], '{"CPU": "CORE I7-13620H", "RAM": "16GB DDR5 (8GB*2)", "Storage": "NVME 512GB", "VGA": "NVIDIA RTX 3050 4GB DDR6", "Screen": "15.6\" FHD 144HZ", "LAN": "LAN", "Keyboard": "24-Zone RGB Backlit, Arabic (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'KATANA 15 HX-B14WFK', 'msi-katana-15-hx-b14wfk', 'CPU: CORE I9-14900HX, RAM: 16GB DDR5, Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/msi-katana-15-hx-b14wfk.webp']::text[], '{"CPU": "CORE I9-14900HX", "RAM": "16GB DDR5", "Storage": "NVME 1TB", "VGA": "NVIDIA RTX 5060 8GB DDR7", "Screen": "15.6\" QHD 165HZ", "LAN": "LAN", "Keyboard": "24-Zone RGB Backlit, Arabic (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'KATANA 15 HX-B14WGK', 'msi-katana-15-hx-b14wgk', 'CPU: CORE I9-14900HX, RAM: 16GB DDR5, Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/msi-katana-15-hx-b14wgk.webp']::text[], '{"CPU": "CORE I9-14900HX", "RAM": "16GB DDR5", "Storage": "NVME 1TB", "VGA": "NVIDIA RTX 5070 8GB DDR7", "Screen": "15.6\" QHD 165HZ", "LAN": "LAN", "Keyboard": "24-Zone RGB Backlit, Arabic (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'VENTURE PRO 15-A2RWFG', 'msi-venture-pro-15-a2rwfg', 'CPU: CORE 7 240H, RAM: 16GB DDR5 (8GB*2), Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/msi-venture-pro-15-a2rwfg.webp']::text[], '{"CPU": "CORE 7 240H", "RAM": "16GB DDR5 (8GB*2)", "Storage": "NVME 512GB", "VGA": "NVIDIA RTX 5060 8GB DDR7", "Screen": "15.6\" FHD 144HX", "LAN": "LAN", "Keyboard": "24-Zone RGB Backlit, Arabic (US)", "OS": "DOS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'VECTOR 16 HX AI A2XWJG', 'msi-vector-16-hx-ai-a2xwjg', 'CPU: CORE ULTRA 9 275HX, RAM: 32GB DDR5 (16GB*2), Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/msi-vector-16-hx-ai-a2xwjg.webp']::text[], '{"CPU": "CORE ULTRA 9 275HX", "RAM": "32GB DDR5 (16GB*2)", "Storage": "NVME 1TB", "VGA": "NVIDIA RTX 5090 24GB DDR7", "Screen": "16\" QHD 240HZ", "LAN": "LAN", "Keyboard": "24-Zone RGB Backlit, Arabic (US)", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'GIGABYTE G6 MF', 'gigabyte-gigabyte-g6-mf', 'CPU: CORE I7-13620H, RAM: 16GB DDR5, Storage: NVME 1TB',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/gigabyte-gigabyte-g6-mf.webp']::text[], '{"CPU": "CORE I7-13620H", "RAM": "16GB DDR5", "Storage": "NVME 1TB", "VGA": "NVIDIA RTX 4050 6GB DDR6", "Screen": "16\" FHD 165HZ", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'GIGABYTE G6 MF*', 'gigabyte-gigabyte-g6-mf-2', 'CPU: CORE I7-13620H, RAM: 16GB DDR5, Storage: NVME 512*',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, NULL, TRUE, ARRAY['/products/gigabyte-gigabyte-g6-mf-2.webp']::text[], '{"CPU": "CORE I7-13620H", "RAM": "16GB DDR5", "Storage": "NVME 512*", "VGA": "NVIDIA RTX 4050 6GB DDR6", "Screen": "16\" FHD 165HZ", "LAN": "LAN", "Keyboard": "BACKLIT ENGLISH", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ACER VS2720G-I3 (WIFI/BT)', 'acer-acer-vs2720g-i3-wifi-bt', 'CPU: CORE I3 14100, RAM: 8GB DDR5, Storage: NVME 512GB',
  470.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/acer-acer-vs2720g-i3-wifi-bt.jpg']::text[], '{"CPU": "CORE I3 14100", "RAM": "8GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "INTEL UHD GRAPHICS", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ACER VS2720G-I5 (WIFI/BT)', 'acer-acer-vs2720g-i5-wifi-bt', 'CPU: CORE I5 14400, RAM: 8GB DDR5, Storage: NVME 512GB',
  565.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/acer-acer-vs2720g-i5-wifi-bt.jpg']::text[], '{"CPU": "CORE I5 14400", "RAM": "8GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "INTEL UHD GRAPHICS", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ACER VS2720G-I7(WIFI/BT)', 'acer-acer-vs2720g-i7-wifi-bt', 'CPU: CORE I7 14700, RAM: 8GB DDR5, Storage: NVME 512GB',
  700.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/acer-acer-vs2720g-i7-wifi-bt.jpg']::text[], '{"CPU": "CORE I7 14700", "RAM": "8GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "INTEL UHD GRAPHICS", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ACER VERITON-I7 WIFI/BT', 'acer-acer-veriton-i7-wifi-bt', 'CPU: CORE I7 12700, RAM: 8GB DDR5, Storage: NVME 512GB',
  650.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/acer-acer-veriton-i7-wifi-bt.jpg']::text[], '{"CPU": "CORE I7 12700", "RAM": "8GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "INTEL UHD GRAPHICS", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'OPTIPLEX AIO 7420 24" NON TOUCH', 'dell-optiplex-aio-7420-24-non-touch', 'CPU: CORE I7 14700 VPRO, RAM: 32GB DDR5 (16GB*2), Storage: NVME 1TB (2230)',
  1750.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/dell-optiplex-aio-7420-24-non-touch.jpg']::text[], '{"CPU": "CORE I7 14700 VPRO", "RAM": "32GB DDR5 (16GB*2)", "Storage": "NVME 1TB (2230)", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "Intel® UHD Graphics 770", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 290 G9 (CT6Y4AT)', 'hp-hp-290-g9-ct6y4at', 'CPU: CORE I7 14700, RAM: 8GB DDR4, Storage: NVME 512GB',
  780.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/hp-hp-290-g9-ct6y4at.webp']::text[], '{"CPU": "CORE I7 14700", "RAM": "8GB DDR4", "Storage": "NVME 512GB", "Keyboard/Mouse": "DVDRW USB KEYBOARD & MOUSE", "Graphics": "INTEL UHD GRAPHICS", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP PRODESK 400 MINI (8X4W1AV) WIFI/BT', 'hp-hp-prodesk-400-mini-8x4w1av-wifi-bt', 'CPU: CORE I7 14700T, RAM: 8GB DDR5, Storage: NVME 512GB',
  850.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/hp-hp-prodesk-400-mini-8x4w1av-wifi-bt.webp']::text[], '{"CPU": "CORE I7 14700T", "RAM": "8GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "Intel® UHD Graphics 770", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '800 G9 MINI (449W2ES) WIFI+BT', 'hp-800-g9-mini-449w2es-wifi-bt', 'CPU: CORE I7 14700, RAM: 16GB DDR5, Storage: NVME 512GB',
  1100.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/hp-800-g9-mini-449w2es-wifi-bt.webp']::text[], '{"CPU": "CORE I7 14700", "RAM": "16GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "WIRELESS KEYBOARD & MOUSE", "Graphics": "Intel® UHD Graphics 770", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'NEO 50T-12UD00C2EX', 'lenovo-neo-50t-12ud00c2ex', 'CPU: CORE I3 14100, RAM: 8GB DDR5, Storage: NVME 512GB',
  500.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/lenovo-neo-50t-12ud00c2ex.webp']::text[], '{"CPU": "CORE I3 14100", "RAM": "8GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "Integrated Intel® UHD Graphics 730", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'NEO M70Q-12TESKR400 TINY (WIFI/BT)', 'lenovo-neo-m70q-12teskr400-tiny-wifi-bt', 'CPU: CORE I5-14400T, RAM: 16GB DDR5, Storage: NVME 512GB',
  725.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/lenovo-neo-m70q-12teskr400-tiny-wifi-bt.webp']::text[], '{"CPU": "CORE I5-14400T", "RAM": "16GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "Integrated Intel® UHD Graphics", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'NEO 50T-12UD00BSEX', 'lenovo-neo-50t-12ud00bsex', 'CPU: CORE I5 14400, RAM: 8GB DDR5, Storage: NVME 512GB',
  590.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/lenovo-neo-50t-12ud00bsex.webp']::text[], '{"CPU": "CORE I5 14400", "RAM": "8GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "Integrated Intel® UHD Graphics 730", "OS": "DOS", "Warranty": "2YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'NEO 50S-12XD004FGP', 'lenovo-neo-50s-12xd004fgp', 'CPU: CORE I5 14400, RAM: 16GB DDR5, Storage: NVME 512GB',
  675.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/lenovo-neo-50s-12xd004fgp.webp']::text[], '{"CPU": "CORE I5 14400", "RAM": "16GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "Integrated Intel® UHD Graphics 730", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'M70T-12TYS2VT00', 'lenovo-m70t-12tys2vt00', 'CPU: CORE I5 14500 VPRO, RAM: 16GB DDR5, Storage: NVME 1TB',
  725.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, NULL, TRUE, ARRAY['/products/lenovo-m70t-12tys2vt00.jpg']::text[], '{"CPU": "CORE I5 14500 VPRO", "RAM": "16GB DDR5", "Storage": "NVME 1TB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "Integrated Intel® UHD Graphics 730", "OS": "DOS", "Warranty": "3YRS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'NEO 50T-12UD00C2EX/i7 14700', 'lenovo-neo-50t-12ud00c2ex-i7-14700', 'CPU: CORE I7 14700, RAM: 8GB DDR5, Storage: NVME 512GB',
  0.0, (SELECT id FROM categories WHERE slug = 'desktops'), 0, NULL, TRUE, ARRAY['/products/lenovo-neo-50t-12ud00c2ex-i7-14700.webp']::text[], '{"CPU": "CORE I7 14700", "RAM": "8GB DDR5", "Storage": "NVME 512GB", "Keyboard/Mouse": "USB KEYBOARD & MOUSE", "Graphics": "Integrated Intel® UHD Graphics 730", "OS": "DOS", "Warranty": "1YR"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '221V8LB', 'philips-221v8lb', 'Description: • LCD panel type: VA LCD • Backlight type: W-LED system • Panel Size: 21.5 inch / 54.6 cm • Display Screen Coating: Anti-glare, 3H, Haze 25% • Effective viewing area: 478.656 (H) x 260.28 (V) • Aspect ratio: 16:9 • Maximum resolution: 1920 x 1080 @ 100 Hz* • Pixel Density: 102.46 PPI • Response time (typical): 4 ms (GtG)* • Brightness: 250 cd/m² • Contrast ratio (typical): 3000:1 • SmartContrast: Mega Infinity DCR • Pixel pitch: 0.2493 x 0.241 mm • Viewing angle: 178º (H) / 178º (V), @ C/R > 10 • Display colors: 16.7 M (8 bit) • Picture enhancement: SmartImage • Scanning Frequency: 30 - 115 kHz (H) / 48 - 100 Hz (V) •sRGB • Flicker-free •LowBlue Mode •EasyRead • Adaptive sync, Connectivity: • Signal Input: VGA (Analog), HDMI 1.4 • HDCP: HDCP 1.4 (HDMI) • Sync Input: Separate Sync, Sync on Green • Audio (In/Out): Audio out',
  78.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, '221V8LB', TRUE, ARRAY['/products/philips-221v8lb.jpg']::text[], '{"Description": "• LCD panel type: VA LCD • Backlight type: W-LED system • Panel Size: 21.5 inch / 54.6 cm • Display Screen Coating: Anti-glare, 3H, Haze 25% • Effective viewing area: 478.656 (H) x 260.28 (V) • Aspect ratio: 16:9 • Maximum resolution: 1920 x 1080 @ 100 Hz* • Pixel Density: 102.46 PPI • Response time (typical): 4 ms (GtG)* • Brightness: 250 cd/m² • Contrast ratio (typical): 3000:1 • SmartContrast: Mega Infinity DCR • Pixel pitch: 0.2493 x 0.241 mm • Viewing angle: 178º (H) / 178º (V), @ C/R > 10 • Display colors: 16.7 M (8 bit) • Picture enhancement: SmartImage • Scanning Frequency: 30 - 115 kHz (H) / 48 - 100 Hz (V) •sRGB • Flicker-free •LowBlue Mode •EasyRead • Adaptive sync", "Connectivity": "• Signal Input: VGA (Analog), HDMI 1.4 • HDCP: HDCP 1.4 (HDMI) • Sync Input: Separate Sync, Sync on Green • Audio (In/Out): Audio out"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '22E1N1100LA (MULTIMEDIA)', 'philips-22e1n1100la-multimedia', 'Description: Panel Size: 21.5"/54.5cm Aspect ratio: 16:9 LCD panel type: VA LCD Backlight type: W-LED system Pixel pitch: 0.2493 x 0.241 mm Brightness: 250 cd/m² Display colors: 16.7 M Color gamut (typical): Adobe RGB 83.74%; DCI_xfffe_P3:79.06%, sRGB: 102.08%, NTSC 86.93%* Contrast ratio (typical): 4000:1 SmartContrast: Mega Infinity DCR Response time MPRT: 1 ms* Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage Maximum resolution: 1920 x 1080 @ 120 Hz (HDMI)* Effective viewing area: 478.656 x 260.28mm Scanning Frequency: VGA: 30 KHz - 85 KHz (H) / 48 Hz - 60 Hz (V); HDMI: 30 KHz - 140 KHz (H) / 48 Hz - 120 Hz (V) sRGB Flicker-free Pixel Density: 102 PPI LowBlue Mode Display Screen Coating: Anti-Glare, 3H, Haze 25% MPRT: 1 ms* Built-in Speakers: 2W x 2 Adaptive sync, Connectivity: Signal Input: VGA x 1, HDMI 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Audio out, Audio-in HDCP: HDCP 1.4 (HDMI)',
  90.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, '22E1N1100LA (MULTIMEDIA)', TRUE, ARRAY['/products/philips-22e1n1100la-multimedia.png']::text[], '{"Description": "Panel Size: 21.5\"/54.5cm Aspect ratio: 16:9 LCD panel type: VA LCD Backlight type: W-LED system Pixel pitch: 0.2493 x 0.241 mm Brightness: 250 cd/m² Display colors: 16.7 M Color gamut (typical): Adobe RGB 83.74%; DCI_xfffe_P3:79.06%, sRGB: 102.08%, NTSC 86.93%* Contrast ratio (typical): 4000:1 SmartContrast: Mega Infinity DCR Response time MPRT: 1 ms* Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage Maximum resolution: 1920 x 1080 @ 120 Hz (HDMI)* Effective viewing area: 478.656 x 260.28mm Scanning Frequency: VGA: 30 KHz - 85 KHz (H) / 48 Hz - 60 Hz (V); HDMI: 30 KHz - 140 KHz (H) / 48 Hz - 120 Hz (V) sRGB Flicker-free Pixel Density: 102 PPI LowBlue Mode Display Screen Coating: Anti-Glare, 3H, Haze 25% MPRT: 1 ms* Built-in Speakers: 2W x 2 Adaptive sync", "Connectivity": "Signal Input: VGA x 1, HDMI 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Audio out, Audio-in HDCP: HDCP 1.4 (HDMI)"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '24E2N2100', 'philips-24e2n2100', 'Description: Picture/Display Panel Size: 23.8 inch / 60.5 cm Aspect ratio: 16:9 LCD panel type: IPS technology Backlight type: W-LED system Pixel pitch: 0.2745 x 0.2745 mm Brightness: 300 cd/m² Display colors: 16.7 M Contrast ratio (typical): 1500:1 SmartContrast: Mega Infinity DCR Response time MPRT: 1 ms* Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage Maximum resolution: 1920 x 1080 @ 120 Hz Effective viewing area: 527.04 (H) x 296.46 (V) Scanning Frequency: VGAI: 30 KHz - 85 KHz (H) / 48 Hz - 75 Hz (V); HDMI: 30 KHz - 140 KHz (H) / 48 Hz - 120 Hz (V) sRGB Flicker-free Pixel Density: 93 PPI LowBlue Mode Display Screen Coating: Anti-Glare, 3H, Haze 25% MPRT: 1 ms* EasyRead Adaptive sync, Connectivity: Connectivity Signal Input: VGA x 1, HDMI 1.4 x 1 Sync Input: Separate Sync HDCP: HDCP 1.4 (HDMI)',
  95.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, '24E2N2100', TRUE, ARRAY['/products/philips-24e2n2100.webp']::text[], '{"Description": "Picture/Display Panel Size: 23.8 inch / 60.5 cm Aspect ratio: 16:9 LCD panel type: IPS technology Backlight type: W-LED system Pixel pitch: 0.2745 x 0.2745 mm Brightness: 300 cd/m² Display colors: 16.7 M Contrast ratio (typical): 1500:1 SmartContrast: Mega Infinity DCR Response time MPRT: 1 ms* Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage Maximum resolution: 1920 x 1080 @ 120 Hz Effective viewing area: 527.04 (H) x 296.46 (V) Scanning Frequency: VGAI: 30 KHz - 85 KHz (H) / 48 Hz - 75 Hz (V); HDMI: 30 KHz - 140 KHz (H) / 48 Hz - 120 Hz (V) sRGB Flicker-free Pixel Density: 93 PPI LowBlue Mode Display Screen Coating: Anti-Glare, 3H, Haze 25% MPRT: 1 ms* EasyRead Adaptive sync", "Connectivity": "Connectivity Signal Input: VGA x 1, HDMI 1.4 x 1 Sync Input: Separate Sync HDCP: HDCP 1.4 (HDMI)"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '24M2N3200FQ', 'philips-24m2n3200fq', 'Description: Panel Size: 23.8"/60.5 cm Aspect ratio: 16:9 LCD panel type: IPS technology Backlight type: W-LED system Pixel pitch: 0.2745 x 0.2745mm Brightness: 300 cd/m² Display colors: 16.7 M Color gamut (typical): Adobe RGB 89%; DCI_xfffe_P3:93% sRGB: 125%,, NTSC 105%.* Contrast ratio (typical): 1000:1 SmartContrast: Mega Infinity DCR Response time Smart MBR: 0.3ms* Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage game Maximum resolution: 1920x1080 @ 200Hz (HDMI/DP)* Effective viewing area: 527.04(H)x296.46(V)mm Scanning Frequency: 30-230 KHz(H)/ 48-200 Hz(V) sRGB Flicker-free Pixel Density: 93 PPI LowBlue Mode Display Screen Coating: Anti-Glare, 3H, Haze 25% Low Input Lag Adaptive sync HDR: HDR 10 supported Stark Shadow Boost Smart MBR: 0.3ms* Smart Crosshair Shadow Boost, Connectivity: Signal Input: HDMI 2.0 x 1, DisplayPort 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Headphone out HDCP: HDCP 1.4 (HDMI / DP), HDCP 2.2 (HDMI / DP)',
  150.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, '24M2N3200FQ', TRUE, ARRAY['/products/philips-24m2n3200fq.jpg']::text[], '{"Description": "Panel Size: 23.8\"/60.5 cm Aspect ratio: 16:9 LCD panel type: IPS technology Backlight type: W-LED system Pixel pitch: 0.2745 x 0.2745mm Brightness: 300 cd/m² Display colors: 16.7 M Color gamut (typical): Adobe RGB 89%; DCI_xfffe_P3:93% sRGB: 125%,, NTSC 105%.* Contrast ratio (typical): 1000:1 SmartContrast: Mega Infinity DCR Response time Smart MBR: 0.3ms* Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage game Maximum resolution: 1920x1080 @ 200Hz (HDMI/DP)* Effective viewing area: 527.04(H)x296.46(V)mm Scanning Frequency: 30-230 KHz(H)/ 48-200 Hz(V) sRGB Flicker-free Pixel Density: 93 PPI LowBlue Mode Display Screen Coating: Anti-Glare, 3H, Haze 25% Low Input Lag Adaptive sync HDR: HDR 10 supported Stark Shadow Boost Smart MBR: 0.3ms* Smart Crosshair Shadow Boost", "Connectivity": "Signal Input: HDMI 2.0 x 1, DisplayPort 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Headphone out HDCP: HDCP 1.4 (HDMI / DP), HDCP 2.2 (HDMI / DP)"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'PHILIPS 271V8lA', 'philips-philips-271v8la', 'Description: • LCD panel type: VA LCD • Backlight type: W-LED system • Panel Size: 27 inch / 68.6 cm • Display Screen Coating: Anti-Glare, 3H, Haze 25% • Effective viewing area: 597.9 (H) x 336.3 (V) • Aspect ratio: 16:9 • Maximum resolution: 1920 x 1080 @ 75 Hz* • Pixel Density: 82 PPI • Response time (typical): 4 ms (GtG)* • Brightness: 250 cd/m² • Contrast ratio (typical): 3000:1 • SmartContrast: Mega Infinity DCR • Pixel pitch: 0.3114 x 0.3114 mm • Viewing angle: 178º (H) / 178º (V), @ C/R > 10 • Flicker-free • Display colors: 16.7 M • Scanning Frequency: 30 -85 kHz (H) / 48 -75 Hz (V) • LowBlue Mode • EasyRead • sRGB • Built-in Speakers: 2 W x 2 • Adaptive sync, Connectivity: • Signal Input: VGA (Analog ), HDMI (digital, HDCP) • Sync Input: Separate Sync, Sync on Green • Audio (In/Out): Audio out',
  145.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, 'PHILIPS 271V8lA', TRUE, ARRAY['/products/philips-philips-271v8la.webp']::text[], '{"Description": "• LCD panel type: VA LCD • Backlight type: W-LED system • Panel Size: 27 inch / 68.6 cm • Display Screen Coating: Anti-Glare, 3H, Haze 25% • Effective viewing area: 597.9 (H) x 336.3 (V) • Aspect ratio: 16:9 • Maximum resolution: 1920 x 1080 @ 75 Hz* • Pixel Density: 82 PPI • Response time (typical): 4 ms (GtG)* • Brightness: 250 cd/m² • Contrast ratio (typical): 3000:1 • SmartContrast: Mega Infinity DCR • Pixel pitch: 0.3114 x 0.3114 mm • Viewing angle: 178º (H) / 178º (V), @ C/R > 10 • Flicker-free • Display colors: 16.7 M • Scanning Frequency: 30 -85 kHz (H) / 48 -75 Hz (V) • LowBlue Mode • EasyRead • sRGB • Built-in Speakers: 2 W x 2 • Adaptive sync", "Connectivity": "• Signal Input: VGA (Analog ), HDMI (digital, HDCP) • Sync Input: Separate Sync, Sync on Green • Audio (In/Out): Audio out"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '271V8W', 'philips-271v8w', 'Description: • Panel Size: 27 inch / 68.6 cm • Aspect ratio: 16:9 • LCD panel type: IPS technology • Backlight type: W-LED system • Pixel pitch: 0.311 x 0.311 mm • Brightness: 250 cd/m² • Display colors: 16.7 M • Contrast ratio (typical): 1000:1 • SmartContrast: Mega Infinity DCR • Response time (typical): 4 ms (GtG)* • Viewing angle: 178º (H) / 178º (V), @ C/R &gt; 10 • Maximum resolution: 1920 x 1080 @ 75 Hz* • Effective viewing area: 597.9 (H) x 336.3 (V) • Scanning Frequency: 30 -83 kHz (H) / 56 -76 Hz (V) • sRGB • Flicker-free • Pixel Density: 82 PPI • LowBlue Mode • Display Screen Coating: Anti-Glare, 3H, Haze 25% • EasyRead • Adaptive sync, Connectivity: VGA (Analog ), HDMI (digital, HDCP)',
  0.0, (SELECT id FROM categories WHERE slug = 'monitors'), 0, '271V8W', TRUE, ARRAY['/products/philips-271v8w.webp']::text[], '{"Description": "• Panel Size: 27 inch / 68.6 cm • Aspect ratio: 16:9 • LCD panel type: IPS technology • Backlight type: W-LED system • Pixel pitch: 0.311 x 0.311 mm • Brightness: 250 cd/m² • Display colors: 16.7 M • Contrast ratio (typical): 1000:1 • SmartContrast: Mega Infinity DCR • Response time (typical): 4 ms (GtG)* • Viewing angle: 178º (H) / 178º (V), @ C/R &gt; 10 • Maximum resolution: 1920 x 1080 @ 75 Hz* • Effective viewing area: 597.9 (H) x 336.3 (V) • Scanning Frequency: 30 -83 kHz (H) / 56 -76 Hz (V) • sRGB • Flicker-free • Pixel Density: 82 PPI • LowBlue Mode • Display Screen Coating: Anti-Glare, 3H, Haze 25% • EasyRead • Adaptive sync", "Connectivity": "VGA (Analog ), HDMI (digital, HDCP)"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '27E1N1800A (4K)', 'philips-27e1n1800a-4k', 'Description: Panel Size: 27 inch/68.6 cm Aspect ratio: 16:9 LCD panel type: IPS technology Backlight type: W-LED system Pixel pitch: 0.1554 x 0.1554 mm Brightness: 350 cd/m² Display colours: 1.07 B (8 bit + Hi-FRC) Contrast ratio (typical): 1000:1 SmartContrast: Mega Infinity DCR Response time (typical): 4 ms (Grey to Grey)* Viewing angle: 178º (H)/178º (V), @ C/R > 10 Picture enhancement: SmartImage Maximum resolution: 3840 x 2160 @ 60 Hz* Effective viewing area: 597.888 (H) x 336.312 (V) Scanning Frequency: 30–140 kHz (H)/40–60 Hz (V) Built-in Speakers: 2 W x 2 Delta E: < 2 Flicker-free Pixel Density: 163.18 PPI LowBlue Mode Display Screen Coating: Anti-Glare, 3H, Haze 25% SmartUniformity: 93%–105% EasyRead Adaptive sync HDR: HDR 10 supported, Connectivity: Connectivity Signal Input: HDMI2.0 x 2 , DisplayPort 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Audio out HDCP: HDCP 1.4 (HDMI/DisplayPort), HDCP 2.2(HDMI/DisplayPort)',
  225.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, '27E1N1800A (4K)', TRUE, ARRAY['/products/philips-27e1n1800a-4k.png']::text[], '{"Description": "Panel Size: 27 inch/68.6 cm Aspect ratio: 16:9 LCD panel type: IPS technology Backlight type: W-LED system Pixel pitch: 0.1554 x 0.1554 mm Brightness: 350 cd/m² Display colours: 1.07 B (8 bit + Hi-FRC) Contrast ratio (typical): 1000:1 SmartContrast: Mega Infinity DCR Response time (typical): 4 ms (Grey to Grey)* Viewing angle: 178º (H)/178º (V), @ C/R > 10 Picture enhancement: SmartImage Maximum resolution: 3840 x 2160 @ 60 Hz* Effective viewing area: 597.888 (H) x 336.312 (V) Scanning Frequency: 30–140 kHz (H)/40–60 Hz (V) Built-in Speakers: 2 W x 2 Delta E: < 2 Flicker-free Pixel Density: 163.18 PPI LowBlue Mode Display Screen Coating: Anti-Glare, 3H, Haze 25% SmartUniformity: 93%–105% EasyRead Adaptive sync HDR: HDR 10 supported", "Connectivity": "Connectivity Signal Input: HDMI2.0 x 2 , DisplayPort 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Audio out HDCP: HDCP 1.4 (HDMI/DisplayPort), HDCP 2.2(HDMI/DisplayPort)"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '27E1N5800E (UltraClear 4K UHD (3840x2160))', 'philips-27e1n5800e-ultraclear-4k-uhd-3840x2160', 'Description: • LCD panel type: IPS technology • Backlight type: W-LED system • Panel Size: 27 inch / 68.6 cm • Display Screen Coating: Anti-Glare, 3H, Haze 25% • Effective viewing area: 596.736 (H) x 335.664 (V) • Aspect ratio: 16:9 • Maximum resolution: 3840 x 2160 @ 60 Hz* • Pixel Density: 163.18 PPI • Response time (typical): 4 ms (Gray to Gray)* • Brightness: 350 cd/m² • Contrast ratio (typical): 1000:1 • SmartContrast: Mega Infinity DCR • Pixel pitch: 0.1554 x 0.1554 mm • Viewing angle: 178º (H) / 178º (V), @ C/R > 10 • Flicker-free • Picture enhancement: SmartImage game • Color gamut (typical): NTSC 106.4%*, sRGB 125.7%* • Display colors: Color support 1.07 billion colors • Scanning Frequency: 30 - 114 kHz (H) / 48 - 75 Hz (V) • SmartUniformity: 97 ~ 102% • Delta E: < 2 (sRGB) • LowBlue Mode • EasyRead • sRGB, Connectivity: • Signal Input: HDMI 2.0 x 2, DisplayPort 1.2 x 1 • Sync Input: Separate Sync • Audio (In/Out): Audio out• Height adjustment: 130 mm • Pivot: -/+ 90 degree • Tilt: -5/20 degree',
  350.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, '27E1N5800E (UltraClear 4K UHD (3840x2160))', TRUE, ARRAY['/products/philips-27e1n5800e-ultraclear-4k-uhd-3840x2160.png']::text[], '{"Description": "• LCD panel type: IPS technology • Backlight type: W-LED system • Panel Size: 27 inch / 68.6 cm • Display Screen Coating: Anti-Glare, 3H, Haze 25% • Effective viewing area: 596.736 (H) x 335.664 (V) • Aspect ratio: 16:9 • Maximum resolution: 3840 x 2160 @ 60 Hz* • Pixel Density: 163.18 PPI • Response time (typical): 4 ms (Gray to Gray)* • Brightness: 350 cd/m² • Contrast ratio (typical): 1000:1 • SmartContrast: Mega Infinity DCR • Pixel pitch: 0.1554 x 0.1554 mm • Viewing angle: 178º (H) / 178º (V), @ C/R > 10 • Flicker-free • Picture enhancement: SmartImage game • Color gamut (typical): NTSC 106.4%*, sRGB 125.7%* • Display colors: Color support 1.07 billion colors • Scanning Frequency: 30 - 114 kHz (H) / 48 - 75 Hz (V) • SmartUniformity: 97 ~ 102% • Delta E: < 2 (sRGB) • LowBlue Mode • EasyRead • sRGB", "Connectivity": "• Signal Input: HDMI 2.0 x 2, DisplayPort 1.2 x 1 • Sync Input: Separate Sync • Audio (In/Out): Audio out• Height adjustment: 130 mm • Pivot: -/+ 90 degree • Tilt: -5/20 degree"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '27M2N3200FQ', 'philips-27m2n3200fq', 'Description: Panel Size: 27 inch / 68.5 cm Aspect ratio: 16:9 LCD panel type: IPS technology Backlight type: W-LED system Pixel pitch: 0.3114 x 0.3114mm Brightness: 300 cd/m² Display colors: 16.7 M Color gamut (typical): Adobe RGB 89%; DCI_xfffe_P3:94%, sRGB: 120%, NTSC 100%, * Contrast ratio (typical): 1000:1 SmartContrast: Mega Infinity DCR Response time Smart MBR: 0.3ms* Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage game Maximum resolution: 1920x1080 @ 200Hz (HDMI/DP) Effective viewing area: 597.888(H)x336.312(V)mm Scanning Frequency: 30K-230K Hz (H)/ 48-200 Hz (V) sRGB Flicker-free Pixel Density: 82 PPI LowBlue Mode Display Screen Coating: Anti-glare, 25%, 3H Low Input Lag G-SYNC HDR: HDR 10 supported Stark Shadow Boost Smart Crosshair Shadow Boost, Connectivity: Connectivity Signal Input: HDMI 2.0 x 1, DisplayPort 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Headphone out HDCP: HDCP 1.4 (HDMI / DP), HDCP 2.2 (HDMI / DP)',
  185.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, '27M2N3200FQ', TRUE, ARRAY['/products/philips-27m2n3200fq.png']::text[], '{"Description": "Panel Size: 27 inch / 68.5 cm Aspect ratio: 16:9 LCD panel type: IPS technology Backlight type: W-LED system Pixel pitch: 0.3114 x 0.3114mm Brightness: 300 cd/m² Display colors: 16.7 M Color gamut (typical): Adobe RGB 89%; DCI_xfffe_P3:94%, sRGB: 120%, NTSC 100%, * Contrast ratio (typical): 1000:1 SmartContrast: Mega Infinity DCR Response time Smart MBR: 0.3ms* Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage game Maximum resolution: 1920x1080 @ 200Hz (HDMI/DP) Effective viewing area: 597.888(H)x336.312(V)mm Scanning Frequency: 30K-230K Hz (H)/ 48-200 Hz (V) sRGB Flicker-free Pixel Density: 82 PPI LowBlue Mode Display Screen Coating: Anti-glare, 25%, 3H Low Input Lag G-SYNC HDR: HDR 10 supported Stark Shadow Boost Smart Crosshair Shadow Boost", "Connectivity": "Connectivity Signal Input: HDMI 2.0 x 1, DisplayPort 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Headphone out HDCP: HDCP 1.4 (HDMI / DP), HDCP 2.2 (HDMI / DP)"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '346B1C', 'philips-346b1c', 'Description: • LCD panel type: VA LCD • Adaptive sync • Backlight type: W-LED system • Panel Size: 34 inch / 86.36 cm • Display Screen Coating: Anti-Glare, 2H, Haze 25% • Effective viewing area: 797.2 (H) x 333.7 (V) - at a 1500 R curvature* • Aspect ratio: 21:9 • Maximum resolution: 3440 x 1440 @ 100 Hz* • Pixel Density: 110 PPI • Response time (typical): 4 ms (Gray to Gray)* • Brightness: 300 cd/m² • Contrast ratio (typical): 3,000:1 • SmartContrast: 80,000,000 :1 • Pixel pitch: 0.23175 x 0.23175 mm • Viewing angle: 178º (H) / 178º (V), @ C/R > 10 • Flicker-free • Picture enhancement: SmartImage • Display colors: 16.7 M • Color gamut (typical): NTSC 100%*, sRGB 119%*, Adobe RGB 90%* • Scanning Frequency: 30 - 160 kHz (H) / 48 - 100 Hz (V) • SmartUniformity: 93 ~ 105% • Delta E: < 2 (sRGB) • sRGB • LowBlue Mode • EasyRead, Connectivity: • Signal Input: DisplayPort 1.2 x 1, HDMI 2.0 x 1, USB-C 3.2 Gen 1 x 1 (upstream, power delivery up to 90 W) • HDCP: HDCP 1.4 (DP / USB-C), HDCP 2.2 (HDMI) • USB:: USB-C x 1, USB-B x 1 (upstream), USB 3.2 x 4 (downstream with 1 fast charge B.C 1.2) • Audio (In/Out): Headphone out • RJ45: Ethernet LAN up to 1G*, Wake On Lan • Sync Input: Separate Sync USB • USB-C: Reversible plug connector • Super speed: Data and Video transfer • DP: Built-in Display Port Alt mode • Power delivery: USB PD version 3.0 • USB-C max. power delivery: Up to 90W (5V/3A; 7V/3A; 9V/3A; 10V/3A;12V/3A; 15V/3A; 20V/4.5A',
  500.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, '346B1C', TRUE, ARRAY['/products/philips-346b1c.png']::text[], '{"Description": "• LCD panel type: VA LCD • Adaptive sync • Backlight type: W-LED system • Panel Size: 34 inch / 86.36 cm • Display Screen Coating: Anti-Glare, 2H, Haze 25% • Effective viewing area: 797.2 (H) x 333.7 (V) - at a 1500 R curvature* • Aspect ratio: 21:9 • Maximum resolution: 3440 x 1440 @ 100 Hz* • Pixel Density: 110 PPI • Response time (typical): 4 ms (Gray to Gray)* • Brightness: 300 cd/m² • Contrast ratio (typical): 3,000:1 • SmartContrast: 80,000,000 :1 • Pixel pitch: 0.23175 x 0.23175 mm • Viewing angle: 178º (H) / 178º (V), @ C/R > 10 • Flicker-free • Picture enhancement: SmartImage • Display colors: 16.7 M • Color gamut (typical): NTSC 100%*, sRGB 119%*, Adobe RGB 90%* • Scanning Frequency: 30 - 160 kHz (H) / 48 - 100 Hz (V) • SmartUniformity: 93 ~ 105% • Delta E: < 2 (sRGB) • sRGB • LowBlue Mode • EasyRead", "Connectivity": "• Signal Input: DisplayPort 1.2 x 1, HDMI 2.0 x 1, USB-C 3.2 Gen 1 x 1 (upstream, power delivery up to 90 W) • HDCP: HDCP 1.4 (DP / USB-C), HDCP 2.2 (HDMI) • USB:: USB-C x 1, USB-B x 1 (upstream), USB 3.2 x 4 (downstream with 1 fast charge B.C 1.2) • Audio (In/Out): Headphone out • RJ45: Ethernet LAN up to 1G*, Wake On Lan • Sync Input: Separate Sync USB • USB-C: Reversible plug connector • Super speed: Data and Video transfer • DP: Built-in Display Port Alt mode • Power delivery: USB PD version 3.0 • USB-C max. power delivery: Up to 90W (5V/3A; 7V/3A; 9V/3A; 10V/3A;12V/3A; 15V/3A; 20V/4.5A"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'EVNIA 34M2C5500 (CrystalClear images with UltraWide QHD 3440 x 1440 pixels)', 'philips-evnia-34m2c5500-crystalclear-images-with-ultrawide-q', 'Description: Panel Size: 34 inch / 86.36 cm Aspect ratio: 21:9 Monitor Panel Type: VA, 1500R (curvature) Brightness: 430nits; 460nits (HDR peak) nit Display colors: 1.07G (8bits+FRC) Color gamut (typical): Adobe RGB 91%; DCIP3:95%, sRGB: 126%, NTSC 87% ,DisplayHDR 400 Contrast ratio (typical): 4000:1 SmartContrast: Mega Infinity DCR Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage game Maximum resolution: 3440x1440@ 180 Hz 0.5MS (DP), Delta E: <2 (sRGB),Height adjustment: 130 mm Swivel: -/+ 30 degree Tilt: -5/20 degree,MultiView: PIP/PBP mode, 2x devices, Connectivity: Signal Input: HDMI 2.0 x 2, DisplayPort 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Headphone out HDCP: HDCP 1.4 (HDMI / DisplayPort), HDCP 2.2 (HDMI / DisplayPort) USB Hub: USB 3.2, Gen 1,USB-B upstream x 1, USB-A downstream x 4 (1 for FC)',
  450.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, 'EVNIA 34M2C5500 (CrystalClear images with UltraWide QHD 3440 x 1440 pixels)', TRUE, ARRAY['/products/philips-evnia-34m2c5500-crystalclear-images-with-ultrawide-q.png']::text[], '{"Description": "Panel Size: 34 inch / 86.36 cm Aspect ratio: 21:9 Monitor Panel Type: VA, 1500R (curvature) Brightness: 430nits; 460nits (HDR peak) nit Display colors: 1.07G (8bits+FRC) Color gamut (typical): Adobe RGB 91%; DCIP3:95%, sRGB: 126%, NTSC 87% ,DisplayHDR 400 Contrast ratio (typical): 4000:1 SmartContrast: Mega Infinity DCR Viewing angle: 178º (H) / 178º (V), @ C/R > 10 Picture enhancement: SmartImage game Maximum resolution: 3440x1440@ 180 Hz 0.5MS (DP), Delta E: <2 (sRGB),Height adjustment: 130 mm Swivel: -/+ 30 degree Tilt: -5/20 degree,MultiView: PIP/PBP mode, 2x devices", "Connectivity": "Signal Input: HDMI 2.0 x 2, DisplayPort 1.4 x 1 Sync Input: Separate Sync Audio (In/Out): Headphone out HDCP: HDCP 1.4 (HDMI / DisplayPort), HDCP 2.2 (HDMI / DisplayPort) USB Hub: USB 3.2, Gen 1,USB-B upstream x 1, USB-A downstream x 4 (1 for FC)"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CE285A/35', 'cedar-cedar-ce285a-35', 'Capacity: 1600.0, Pcs/Carton: 15.0',
  6.5, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-ce285a-35.jpg']::text[], '{"Capacity": "1600.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF217A', 'cedar-cedar-cf217a', 'Capacity: 1600.0, Pcs/Carton: 15.0',
  8.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf217a.jpg']::text[], '{"Capacity": "1600.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CE505A/80A', 'cedar-cedar-ce505a-80a', 'Capacity: 2300.0, Pcs/Carton: 10.0',
  8.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-ce505a-80a.jpg']::text[], '{"Capacity": "2300.0", "Pcs/Carton": "10.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF226A', 'cedar-cedar-cf226a', 'Capacity: 3100.0, Pcs/Carton: 10.0',
  8.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf226a.jpg']::text[], '{"Capacity": "3100.0", "Pcs/Carton": "10.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF279A', 'cedar-cedar-cf279a', 'Capacity: 1000.0, Pcs/Carton: 15.0',
  7.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf279a.jpg']::text[], '{"Capacity": "1000.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF283A', 'cedar-cedar-cf283a', 'Capacity: 1500.0, Pcs/Carton: 15.0',
  6.5, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf283a.jpg']::text[], '{"Capacity": "1500.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF530A', 'cedar-cedar-cf530a', 'Capacity: 1100.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf530a.jpg']::text[], '{"Capacity": "1100.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF531A', 'cedar-cedar-cf531a', 'Capacity: 900.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf531a.jpg']::text[], '{"Capacity": "900.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF532A', 'cedar-cedar-cf532a', 'Capacity: 900.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf532a.jpg']::text[], '{"Capacity": "900.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF533A', 'cedar-cedar-cf533a', 'Capacity: 900.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf533a.jpg']::text[], '{"Capacity": "900.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF540A', 'cedar-cedar-cf540a', 'Capacity: 1400.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf540a.jpg']::text[], '{"Capacity": "1400.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF541A', 'cedar-cedar-cf541a', 'Capacity: 1300.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf541a.jpg']::text[], '{"Capacity": "1300.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF542A', 'cedar-cedar-cf542a', 'Capacity: 1300.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf542a.jpg']::text[], '{"Capacity": "1300.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF543A', 'cedar-cedar-cf543a', 'Capacity: 1300.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf543a.jpg']::text[], '{"Capacity": "1300.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF410A', 'cedar-cedar-cf410a', 'Capacity: 2300.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf410a.jpg']::text[], '{"Capacity": "2300.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF411A', 'cedar-cedar-cf411a', 'Capacity: 2300.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf411a.jpg']::text[], '{"Capacity": "2300.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF412A', 'cedar-cedar-cf412a', 'Capacity: 2300.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf412a.jpg']::text[], '{"Capacity": "2300.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF413A', 'cedar-cedar-cf413a', 'Capacity: 2300.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf413a.jpg']::text[], '{"Capacity": "2300.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR MLT-D101S', 'cedar-cedar-mlt-d101s', 'Capacity: 1500.0, Pcs/Carton: 15.0',
  8.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-mlt-d101s.jpg']::text[], '{"Capacity": "1500.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR MLT-D111S (NEW CHIP)', 'cedar-cedar-mlt-d111s-new-chip', 'Capacity: 1000.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-mlt-d111s-new-chip.jpg']::text[], '{"Capacity": "1000.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF278A', 'cedar-cedar-cf278a', 'Capacity: 2100.0, Pcs/Carton: 15.0',
  6.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf278a.jpg']::text[], '{"Capacity": "2100.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W1106 WITHOUT CHIP', 'cedar-cedar-w1106-without-chip', 'Capacity: 1000.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w1106-without-chip.jpg']::text[], '{"Capacity": "1000.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR XEROX 3025', 'cedar-cedar-xerox-3025', 'Capacity: 1500.0, Pcs/Carton: 15.0',
  14.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-xerox-3025.jpg']::text[], '{"Capacity": "1500.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF244A', 'cedar-cedar-cf244a', 'Capacity: 1000.0, Pcs/Carton: 15.0',
  8.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf244a.jpg']::text[], '{"Capacity": "1000.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF350A UNIVERSAL', 'cedar-cedar-cf350a-universal', 'Capacity: 1200.0, Pcs/Carton: 20.0',
  8.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf350a-universal.jpg']::text[], '{"Capacity": "1200.0", "Pcs/Carton": "20.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF210A UNIVERSAL', 'cedar-cedar-cf210a-universal', 'Capacity: 2200.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf210a-universal.jpg']::text[], '{"Capacity": "2200.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF400A', 'cedar-cedar-cf400a', 'Capacity: 1500.0, Pcs/Carton: 15.0',
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf400a.jpg']::text[], '{"Capacity": "1500.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2210A W/O CHIP', 'cedar-cedar-w2210a-w-o-chip', 'Capacity: 1350.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2210a-w-o-chip.jpg']::text[], '{"Capacity": "1350.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2211A W/O CHIP', 'cedar-cedar-w2211a-w-o-chip', 'Capacity: 1250.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2211a-w-o-chip.jpg']::text[], '{"Capacity": "1250.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2212A W/O CHIP', 'cedar-cedar-w2212a-w-o-chip', 'Capacity: 1250.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2212a-w-o-chip.jpg']::text[], '{"Capacity": "1250.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2213A W/O CHIP', 'cedar-cedar-w2213a-w-o-chip', 'Capacity: 1250.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2213a-w-o-chip.jpg']::text[], '{"Capacity": "1250.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2410A W/O CHIP', 'cedar-cedar-w2410a-w-o-chip', 'Capacity: 1050.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2410a-w-o-chip.jpg']::text[], '{"Capacity": "1050.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2411A W/O CHIP', 'cedar-cedar-w2411a-w-o-chip', 'Capacity: 850.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2411a-w-o-chip.jpg']::text[], '{"Capacity": "850.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2412A W/O CHIP', 'cedar-cedar-w2412a-w-o-chip', 'Capacity: 850.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2412a-w-o-chip.jpg']::text[], '{"Capacity": "850.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2413A W/O CHIP', 'cedar-cedar-w2413a-w-o-chip', 'Capacity: 850.0, Pcs/Carton: 15.0',
  11.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2413a-w-o-chip.jpg']::text[], '{"Capacity": "850.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2070A', 'cedar-cedar-w2070a', 'Capacity: 1000.0, Pcs/Carton: 15.0',
  28.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2070a.jpg']::text[], '{"Capacity": "1000.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2071A', 'cedar-cedar-w2071a', 'Capacity: 700.0, Pcs/Carton: 15.0',
  28.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2071a.jpg']::text[], '{"Capacity": "700.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2072A', 'cedar-cedar-w2072a', 'Capacity: 700.0, Pcs/Carton: 15.0',
  28.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2072a.jpg']::text[], '{"Capacity": "700.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR W2073A', 'cedar-cedar-w2073a', 'Capacity: 700.0, Pcs/Carton: 15.0',
  28.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-w2073a.jpg']::text[], '{"Capacity": "700.0", "Pcs/Carton": "15.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF360A WITH CHIP', 'cedar-cedar-cf360a-with-chip', 'Capacity: 6000.0, Pcs/Carton: 12.0',
  32.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf360a-with-chip.jpg']::text[], '{"Capacity": "6000.0", "Pcs/Carton": "12.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF361A WITH CHIP', 'cedar-cedar-cf361a-with-chip', 'Capacity: 5000.0, Pcs/Carton: 12.0',
  32.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf361a-with-chip.jpg']::text[], '{"Capacity": "5000.0", "Pcs/Carton": "12.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF362A WITH CHIP', 'cedar-cedar-cf362a-with-chip', 'Capacity: 5000.0, Pcs/Carton: 12.0',
  32.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf362a-with-chip.jpg']::text[], '{"Capacity": "5000.0", "Pcs/Carton": "12.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CF363A WITH CHIP', 'cedar-cedar-cf363a-with-chip', 'Capacity: 5000.0, Pcs/Carton: 12.0',
  32.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-cf363a-with-chip.jpg']::text[], '{"Capacity": "5000.0", "Pcs/Carton": "12.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CE740A', 'cedar-cedar-ce740a', 'Capacity: 7000.0, Pcs/Carton: 4.0',
  55.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-ce740a.jpg']::text[], '{"Capacity": "7000.0", "Pcs/Carton": "4.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CE741A', 'cedar-cedar-ce741a', 'Capacity: 7300.0, Pcs/Carton: 4.0',
  55.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-ce741a.jpg']::text[], '{"Capacity": "7300.0", "Pcs/Carton": "4.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CE742A', 'cedar-cedar-ce742a', 'Capacity: 7300.0, Pcs/Carton: 4.0',
  55.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-ce742a.jpg']::text[], '{"Capacity": "7300.0", "Pcs/Carton": "4.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CEDAR CE743A', 'cedar-cedar-ce743a', 'Capacity: 7300.0, Pcs/Carton: 4.0',
  55.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-cedar-ce743a.jpg']::text[], '{"Capacity": "7300.0", "Pcs/Carton": "4.0"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'DRUM HP 19A', 'cedar-drum-hp-19a', NULL,
  20.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-drum-hp-19a.jpg']::text[], '{}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TONER HP CE250/1/2/3', 'cedar-toner-hp-ce250-1-2-3', NULL,
  20.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-toner-hp-ce250-1-2-3.jpg']::text[], '{}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TONER HP CE410/1/2/3', 'cedar-toner-hp-ce410-1-2-3', NULL,
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-toner-hp-ce410-1-2-3.jpg']::text[], '{}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TONER HP CF210/CB540/CE320', 'cedar-toner-hp-cf210-cb540-ce320', NULL,
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-toner-hp-cf210-cb540-ce320.jpg']::text[], '{}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TONER HP CF400/1/2/3', 'cedar-toner-hp-cf400-1-2-3', NULL,
  10.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-toner-hp-cf400-1-2-3.jpg']::text[], '{}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TONER HP CF350/CE310', 'cedar-toner-hp-cf350-ce310', NULL,
  8.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-toner-hp-cf350-ce310.jpg']::text[], '{}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TONER HP 12A', 'cedar-toner-hp-12a', NULL,
  8.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-toner-hp-12a.jpg']::text[], '{}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TONER HP 49A/53A', 'cedar-toner-hp-49a-53a', NULL,
  14.0, (SELECT id FROM categories WHERE slug = 'ink-toner'), 5, NULL, TRUE, ARRAY['/products/cedar-toner-hp-49a-53a.jpg']::text[], '{}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'KSYS POS CORE I5/8GB/256/DISPLAY', 'ksys-pos-core-i5-8gb-256-display', 'Category: POS',
  0.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 0, NULL, TRUE, ARRAY['/products/ksys-pos-core-i5-8gb-256-display.jpg']::text[], '{"Category": "POS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'RECEIPT PRINTER T80 USB+LAN', 'receipt-printer-t80-usb-lan', 'Category: PRINTERS',
  60.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, ARRAY['/products/receipt-printer-t80-usb-lan.jpg']::text[], '{"Category": "PRINTERS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MOBILE RECEIPT PRINTER USB+BT+WIFI P810', 'mobile-receipt-printer-usb-bt-wifi-p810', 'Category: PRINTERS',
  80.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, ARRAY['/products/mobile-receipt-printer-usb-bt-wifi-p810.jpg']::text[], '{"Category": "PRINTERS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MOBILE RECEIPT PRINTER USB + BT RPP300', 'mobile-receipt-printer-usb-bt-rpp300', 'Category: PRINTERS',
  75.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, ARRAY['/products/mobile-receipt-printer-usb-bt-rpp300.jpg']::text[], '{"Category": "PRINTERS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LABEL BARCODE PRINTER XP365B', 'label-barcode-printer-xp365b', 'Category: PRINTERS',
  0.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 0, NULL, TRUE, ARRAY['/products/label-barcode-printer-xp365b.jpg']::text[], '{"Category": "PRINTERS"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'WIRED BARCODE READER A806', 'wired-barcode-reader-a806', 'Category: BARCODE READER',
  35.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, ARRAY['/products/wired-barcode-reader-a806.jpg']::text[], '{"Category": "BARCODE READER"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'WIRELESS BARCORE READER SD1806W', 'wireless-barcore-reader-sd1806w', 'Category: BARCODE READER',
  55.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, ARRAY['/products/wireless-barcore-reader-sd1806w.jpg']::text[], '{"Category": "BARCODE READER"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'BARCODE OMNI A6200 2D', 'barcode-omni-a6200-2d', 'Category: BARCODE READER',
  75.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, ARRAY['/products/barcode-omni-a6200-2d.jpg']::text[], '{"Category": "BARCODE READER"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'FINGER PRINT ZKT T628', 'finger-print-zkt-t628', 'Category: FINGER PRINT',
  100.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, ARRAY['/products/finger-print-zkt-t628.jpg']::text[], '{"Category": "FINGER PRINT"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'WLL-A100 8 INCHES 4GB/128GB WIFI', 'wll-a100-8-inches-4gb-128gb-wifi', 'Category: PRICE CHECKER',
  375.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, ARRAY['/products/wll-a100-8-inches-4gb-128gb-wifi.jpg']::text[], '{"Category": "PRICE CHECKER"}'::jsonb
) ON CONFLICT (slug) DO NOTHING;

-- Product ↔ brand tag links
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('nec') WHERE p.slug = 'nec-nec-versapro-vee11' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('acer') WHERE p.slug = 'acer-aspire-5-nx-kgzem-00b' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('dell') WHERE p.slug = 'dell-lattitude-5540-210-bgbj-i5-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-mhfa4hn-a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-mhfd4ll-a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-mhff4hn-a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-mdhh4ll-a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-mdha4hn-a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-mdhe4ll-a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-mdvq4ll-a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-mdvh4ll-a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-mde14ll-a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fc0033ca-b46p0uar-abl-256gb-ref' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fc0033ca-b46p0uar-abl-ref' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0133wm-natural-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0154wm-bz1w9ua-aba-125h' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0250wm-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-250-g10-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-ai-15-fd2023ne-natural-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd1899nr-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0143ne-natural-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0371nia-natural-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0138ne-natural-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0142ne-natural-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-ai-15-fd2022ne-naturalsilver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-probook-460g11-a22zzea-abv' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-probook-460g11-ct9n7et-bag' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-probook-4g1i-d0vg6et-bh5' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-probook-4g1i-at6f5av' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-probook-4g1i-d0vg1et-bh5' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-probook-4g1i-at7k5av' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-probook-4g1i-ct1g9et' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-probook-4g1i-d0uv0et-bh5' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-omnibook-5-flip-14-fp0023dx' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-elitebook-ultra-g1q-a4je4ut-aba-blue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-elitebook-660g11-a6uc4ut-aba-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-elitebook-840g11-b1sb9up-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-spectre-16-aa0013-nightfall-black-refurb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-envy-16-ad0097nr-meteor-silver-refurb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-victus-15-fa2082wm-mica-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-victus-15-fa2021nia-mica-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-omen-16-an0075cl-shadow-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ip1-82lx00gsad-arctic-grey-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ips3-82x700hrax-arctic-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ips3-82x700dfdp-arctic-grey-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-83gw0076gp-business-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-83gw0066pb-business-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ip1-83b40006us-abyss-blue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ip1-83b40006us-512gb-abyss-blue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ip1-83b40008us-cloud-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ip1-83b40008us-512gb-cloud-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ips3-83k100e9ax-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ips3-83k100c1dp-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-83cr000pin-iron-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v14-83a000pcus-business-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-83gw006ved-business-black-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-83hf00emig-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim3-83k100e8ax-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim3-83k100e7dp-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim3-82x700huus-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e14-21t9004ved-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e14-21sxs0n600' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e16-21tf005ded-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e16-21sr005ced-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e14-21t90053ed-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e14-21sx006ued-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e16-21tf0057ed-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e16-21sr0063ed-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e16-21srs0uq00' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-tb-16-21us003med-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-e16-21sr005yed-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkbook-14-21sjs05s00' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkbook-16-21sk0030gq-arctic-grey-carry-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkbook-16-21sks05c00' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-yoga-7-83dl0002us-storm-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-t14-21qds6dx00' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-t14-21mms1sk00-new-open-box' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-loq-83dv01bcax-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-loq-83dv000eax-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-loq-83lk003tps-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-loq-83dv000dax-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-loq-83je00kwax-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-loq-83je0114ax-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-loq-83je002lus-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-loq-83je00xafu-512gb-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-loq-83je00xafu-luna-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-legion-5-83nx0000us-storm-grey' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-legion-5-83ly00n9ax-eclipse-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-legion-pro-5-83nn001xax-eclipse-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-cyborg-15-a13uc' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-katana-15-hx-b14wfk' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-katana-15-hx-b14wgk' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-venture-pro-15-a2rwfg' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-vector-16-hx-ai-a2xwjg' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('gigabyte') WHERE p.slug = 'gigabyte-gigabyte-g6-mf' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('gigabyte') WHERE p.slug = 'gigabyte-gigabyte-g6-mf-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('acer') WHERE p.slug = 'acer-acer-vs2720g-i3-wifi-bt' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('acer') WHERE p.slug = 'acer-acer-vs2720g-i5-wifi-bt' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('acer') WHERE p.slug = 'acer-acer-vs2720g-i7-wifi-bt' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('acer') WHERE p.slug = 'acer-acer-veriton-i7-wifi-bt' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('dell') WHERE p.slug = 'dell-optiplex-aio-7420-24-non-touch' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-hp-290-g9-ct6y4at' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-hp-prodesk-400-mini-8x4w1av-wifi-bt' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-800-g9-mini-449w2es-wifi-bt' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-neo-50t-12ud00c2ex' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-neo-m70q-12teskr400-tiny-wifi-bt' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-neo-50t-12ud00bsex' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-neo-50s-12xd004fgp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-m70t-12tys2vt00' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-neo-50t-12ud00c2ex-i7-14700' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-221v8lb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-22e1n1100la-multimedia' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-24e2n2100' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-24m2n3200fq' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-philips-271v8la' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-271v8w' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-27e1n1800a-4k' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-27e1n5800e-ultraclear-4k-uhd-3840x2160' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-27m2n3200fq' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-346b1c' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('philips') WHERE p.slug = 'philips-evnia-34m2c5500-crystalclear-images-with-ultrawide-q' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-ce285a-35' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf217a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-ce505a-80a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf226a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf279a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf283a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf530a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf531a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf532a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf533a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf540a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf541a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf542a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf543a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf410a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf411a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf412a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf413a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-mlt-d101s' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-mlt-d111s-new-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf278a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w1106-without-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-xerox-3025' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf244a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf350a-universal' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf210a-universal' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf400a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2210a-w-o-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2211a-w-o-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2212a-w-o-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2213a-w-o-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2410a-w-o-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2411a-w-o-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2412a-w-o-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2413a-w-o-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2070a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2071a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2072a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-w2073a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf360a-with-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf361a-with-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf362a-with-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-cf363a-with-chip' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-ce740a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-ce741a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-ce742a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-cedar-ce743a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-drum-hp-19a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-toner-hp-ce250-1-2-3' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-toner-hp-ce410-1-2-3' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-toner-hp-cf210-cb540-ce320' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-toner-hp-cf400-1-2-3' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-toner-hp-cf350-ce310' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-toner-hp-12a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('cedar') WHERE p.slug = 'cedar-toner-hp-49a-53a' ON CONFLICT DO NOTHING;
