-- AUTO-GENERATED catalog replacement from the 2026-07 price lists.
-- Old products are DEACTIVATED (is_active=false), not deleted, so order
-- history (sales_order_items etc, all ON DELETE CASCADE) is preserved.

UPDATE products SET is_active = false WHERE is_active = true;

-- Brand tags
INSERT INTO tags (name, slug, type) VALUES
  ('Acer', 'acer', 'brand'),
  ('Apple', 'apple', 'brand'),
  ('AppoStars', 'appostars', 'brand'),
  ('Asus', 'asus', 'brand'),
  ('Canon', 'canon', 'brand'),
  ('Dell', 'dell', 'brand'),
  ('Epson', 'epson', 'brand'),
  ('HP', 'hp', 'brand'),
  ('Lenovo', 'lenovo', 'brand'),
  ('LG', 'lg', 'brand'),
  ('Microsoft', 'microsoft', 'brand'),
  ('MSI', 'msi', 'brand'),
  ('Optoma', 'optoma', 'brand'),
  ('Samsung', 'samsung', 'brand'),
  ('Seagate', 'seagate', 'brand')
ON CONFLICT (slug) DO NOTHING;

-- New products
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS ROG STRIX SCAR EDITION 18 G835LX-S9113', 'asus-rog-strix-scar-edition-18-g835lx-s9113', 'CPU: CORE ULTRA 9 275HX, RAM: 64GB DDR5, Storage: 2TB NVME',
  4225.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'G835LX-S9113', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 9 275HX", "RAM": "64GB DDR5", "Storage": "2TB NVME", "Language": "EN", "Screen": "18\" 2.5K WQXGA (2560 x 1600) 240HZ", "VGA": "RTX 5090 24GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "OFF BLACK/ROG GLADIUS 3 MOUSE P514 + ROG BACKPACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — CORE ULTRA 9 285H / RTX 5090 24GB', 'asus-gaming-laptop-core-ultra-9-285h-rtx-5090-24gb', 'CPU: CORE ULTRA 9 285H, RAM: 64GB DDR5 ON BOARD, Storage: 1TB NVME',
  4125.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 9 285H", "RAM": "64GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" (2560 x 1600) OLED 240HZ", "VGA": "RTX 5090 24GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "PLATINUM WHITE/ROG IMPACT MOUSE + ROG SLEEVE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5090 24GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb', 'CPU: CORE ULTRA 9 275HX, RAM: 64GB DDR5, Storage: 2TB NVME',
  4885.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 9 275HX", "RAM": "64GB DDR5", "Storage": "2TB NVME", "Language": "EN", "Screen": "16\" WQXGA (2560 x 1600) 240HZ", "VGA": "RTX 5090 24GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "OFF BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5080 16GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5080-16gb', 'CPU: CORE ULTRA 9 275HX, RAM: 32GB DDR5, Storage: 1TB NVME',
  3315.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "16-inch QHD+ (2560x1600) 240Hz", "VGA": "RTX 5080 16GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "VOLT GREEN"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5070TI 12GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070ti-12gb', 'CPU: CORE ULTRA 9 275HX, RAM: 32GB DDR5, Storage: 2TB NVME',
  2750.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "2TB NVME", "Language": "EN/AR", "Screen": "18\" 2.5K WQXGA (2560 x 1600) 240HZ", "VGA": "RTX 5070TI 12GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "VOLT GREEN"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5070TI 12GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070ti-12gb-2', 'CPU: CORE ULTRA 9 275HX, RAM: 32GB DDR5, Storage: 1TB NVME',
  2575.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16-inch QHD+ (2560x1600) 240Hz", "VGA": "RTX 5070TI 12GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE GRAY/ROG IMPACT MOUSE + ROG BACKPACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD Ryzen AI MAX+ 395 / AMD RADEON 8060S', 'asus-gaming-laptop-amd-ryzen-ai-max-395-amd-radeon-8060s', 'CPU: AMD Ryzen AI MAX+ 395, RAM: 64GB DDR5 ON BOARD, Storage: 1TB NVME',
  2775.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD Ryzen AI MAX+ 395", "RAM": "64GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "13.4\" 2.5K(2560 x 1600) 180Hz TOUCHSCREEN", "VGA": "AMD RADEON 8060S", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "OFF BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD Ryzen AI MAX+ 395 / AMD RADEON 8060S', 'asus-gaming-laptop-amd-ryzen-ai-max-395-amd-radeon-8060s-2', 'CPU: AMD Ryzen AI MAX+ 395, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  2515.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD Ryzen AI MAX+ 395", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "13.4\" 2.5K(2560 x 1600) 180Hz TOUCHSCREEN", "VGA": "AMD RADEON 8060S", "Warranty": "2 YEARS", "OS": "WIN 11", "Color": "OFF BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD RYZEN 9-9955HX / RTX 5070TI 12GB', 'asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb', 'CPU: AMD RYZEN 9-9955HX, RAM: 16GB DDR5, Storage: 1TB NVME',
  2385.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD RYZEN 9-9955HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "16-inch WUXGA 165HZ", "VGA": "RTX 5070TI 12GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE GRAY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — CORE ULTRA 9 275HX / RTX 5060 8GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb', 'CPU: CORE ULTRA 9 275HX, RAM: 32GB DDR5, Storage: 1TB NVME',
  2385.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "18\" 2.5K WQXGA (2560 x 1600) 240HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ECLIPSE GRAY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD Ryzen 9 8940HX / RTX 5070 8GB', 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070-8gb', 'CPU: AMD Ryzen 9 8940HX, RAM: 16GB DDR5, Storage: 1TB NVME',
  1995.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD Ryzen 9 8940HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WUXGA 165HZ", "VGA": "RTX 5070 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ECLIPSE GRAY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD Ryzen 7 260 / RTX 5060 8GB', 'asus-gaming-laptop-amd-ryzen-7-260-rtx-5060-8gb', 'CPU: AMD Ryzen 7 260, RAM: 16GB DDR5, Storage: 1TB NVME',
  1765.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD Ryzen 7 260", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "18\"WUXGA 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "GRAY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — SNAPDRAGON X PLUS X1P 42 100 3.4 GHZ', 'asus-gaming-laptop-snapdragon-x-plus-x1p-42-100-3-4-ghz', 'CPU: SNAPDRAGON X PLUS X1P 42 100 3.4 GHZ, RAM: 16GB DDR5 ON BOARD, Storage: 1TB NVME',
  1385.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "SNAPDRAGON X PLUS X1P 42 100 3.4 GHZ", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "13\"OLED (2880 x 1800) DETACHABLE", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "QUALCOMM SNAPDRAGON X ELITE ADRENO / NANO BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core ULTRA 9 285H / RTX5070 8GB', 'asus-gaming-laptop-core-ultra-9-285h-rtx5070-8gb', 'CPU: Core ULTRA 9 285H, RAM: 32GB DDR5, Storage: 1TB NVME',
  1995.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core ULTRA 9 285H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K 144HZ", "VGA": "RTX5070 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD Ryzen 9 365 / RTX 5060 8GB', 'asus-gaming-laptop-amd-ryzen-9-365-rtx-5060-8gb', 'CPU: AMD Ryzen 9 365, RAM: 32GB DDR5, Storage: 1TB NVME',
  1955.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD Ryzen 9 365", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "17.3\" (1920 x 1200) 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD Ryzen 9 8940HX / RTX 5060 8GB', 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5060-8gb', 'CPU: AMD Ryzen 9 8940HX, RAM: 32GB DDR5, Storage: 1TB NVME',
  1955.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD Ryzen 9 8940HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16-inch diagonal, 2K (1920 x 1200) 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core ULTRA 7 255H / RTX 5060 8GB', 'asus-gaming-laptop-core-ultra-7-255h-rtx-5060-8gb', 'CPU: Core ULTRA 7 255H, RAM: 16GB DDR5, Storage: 1TB NVME',
  1645.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16-inch diagonal, 2K (1920 x 1200) 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5090 24GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-2', 'CPU: Core ULTRA 9 275HX, RAM: 32GB DDR5, Storage: 1TB NVME',
  4225.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "16\" WQXGA (2560x1600) OLED 240HZ", "VGA": "RTX 5090 24GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5080 16GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5080-16gb-2', 'CPU: Core ULTRA 9 275HX, RAM: 32GB DDR5, Storage: 1TB NVME',
  3345.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "16\" WQXGA (2560x1600) OLED 240HZ", "VGA": "RTX 5080 16GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5070 8GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070-8gb', 'CPU: Core ULTRA 9 275HX, RAM: 32GB DDR5, Storage: 1TB NVME',
  2345.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WQXGA (2560x1600) OLED 165HZ", "VGA": "RTX 5070 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ECLIPSE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core I9-14900HX / RTX 5070 8GB', 'asus-gaming-laptop-core-i9-14900hx-rtx-5070-8gb', 'CPU: Core I9-14900HX, RAM: 16GB DDR5, Storage: 1TB NVME',
  2045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core I9-14900HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR", "Screen": "15.1\" WQXGA (2560x1600) OLED 165HZ", "VGA": "RTX 5070 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5060 8GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb-2', 'CPU: Core ULTRA 9 275HX, RAM: 32GB DDR5, Storage: 1TB NVME',
  1985.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core ULTRA 9 275HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WQXGA (2560x1600) 240HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "STORM GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core I7-13650HX / RTX 5060 8GB', 'asus-gaming-laptop-core-i7-13650hx-rtx-5060-8gb', 'CPU: Core I7-13650HX, RAM: 32GB DDR5, Storage: 512GB NVME',
  1745.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core I7-13650HX", "RAM": "32GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "17.3\" FHD 165HZ", "VGA": "RTX 5060 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core I7-14700HX / RTX 5060 8GB', 'asus-gaming-laptop-core-i7-14700hx-rtx-5060-8gb', 'CPU: Core I7-14700HX, RAM: 16GB DDR5, Storage: 512GB NVME',
  1555.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core I7-14700HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core I7-13650HX / RTX 5050 8GB', 'asus-gaming-laptop-core-i7-13650hx-rtx-5050-8gb', 'CPU: Core I7-13650HX, RAM: 24GB DDR5, Storage: 512GB NVME',
  1555.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core I7-13650HX", "RAM": "24GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "17.3\" FHD 165HZ", "VGA": "RTX 5050 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core I7-13650HX / RTX 5050 8GB', 'asus-gaming-laptop-core-i7-13650hx-rtx-5050-8gb-2', 'CPU: Core I7-13650HX, RAM: 16GB DDR5, Storage: 512GB NVME',
  1465.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core I7-13650HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200) 165HZ", "VGA": "RTX 5050 8GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "ECLIPSE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD Ryzen 7 250 8 CORES / RTX 5060 8GB', 'asus-gaming-laptop-amd-ryzen-7-250-8-cores-rtx-5060-8gb', 'CPU: AMD Ryzen 7 250 8 CORES, RAM: 16GB DDR5, Storage: 512GB NVME',
  1465.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD Ryzen 7 250 8 CORES", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core I7-13650HX / RTX 3050 6GB', 'asus-gaming-laptop-core-i7-13650hx-rtx-3050-6gb', 'CPU: Core I7-13650HX, RAM: 16GB DDR5, Storage: 512GB NVME',
  1090.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core I7-13650HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 3050 6GB", "Warranty": "1 YEAR", "OS": "DOS", "Color": "LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD RYZEN 5 7235HS / RTX 4050 6GB', 'asus-gaming-laptop-amd-ryzen-5-7235hs-rtx-4050-6gb', 'CPU: AMD RYZEN 5 7235HS, RAM: 16GB DDR5, Storage: 512GB SSD',
  1090.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD RYZEN 5 7235HS", "RAM": "16GB DDR5", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 4050 6GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD Ryzen Z1 Extreme 8 CORES / AMD RADEON', 'asus-gaming-laptop-amd-ryzen-z1-extreme-8-cores-amd-radeon', 'CPU: AMD Ryzen Z1 Extreme 8 CORES, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1075.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD Ryzen Z1 Extreme 8 CORES", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "8\" WUXGA (1920x1200) IPS 500nits Glossy / Anti-fingerprint, 100% sRGB, 48-120Hz VRR, Panda King Glass, Low Blue Light, Touch", "VGA": "AMD RADEON", "Warranty": "1 YEAR", "Color": "STEAM OS / Nebula Nocturne"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core I5-13450HX / RTX 3050 6GB', 'asus-gaming-laptop-core-i5-13450hx-rtx-3050-6gb', 'CPU: Core I5-13450HX, RAM: 16GB DDR5, Storage: 512GB NVME',
  1045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core I5-13450HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 3050 6GB", "Warranty": "2 YEARS", "OS": "DOS", "Color": "LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core ULTRA 9 285HX / RTX 5070TI DDR7 12GB', 'asus-gaming-laptop-core-ultra-9-285hx-rtx-5070ti-ddr7-12gb', 'CPU: Core ULTRA 9 285HX, RAM: 32GB DDR5, Storage: 1TB NVME',
  2995.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core ULTRA 9 285HX", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "18\" QHD+ (2560x1600) 240HZ", "VGA": "RTX 5070TI DDR7 12GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD Ryzen 9 8940HX / RTX 5070TI DDR7 12GB', 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070ti-ddr7-12gb', 'CPU: AMD Ryzen 9 8940HX, RAM: 16GB DDR5, Storage: 1TB NVME',
  2045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD Ryzen 9 8940HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WQXGA (2560x1600) 240HZ", "VGA": "RTX 5070TI DDR7 12GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "GRAY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core i7-14650HX / RTX 5060 DDR7 8GB', 'asus-gaming-laptop-core-i7-14650hx-rtx-5060-ddr7-8gb', 'CPU: Core i7-14650HX, RAM: 16GB DDR5, Storage: 512GB NVME',
  1555.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core i7-14650HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5060 DDR7 8GB", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core i7-14650HX / RTX 5050 DDR7 8GB', 'asus-gaming-laptop-core-i7-14650hx-rtx-5050-ddr7-8gb', 'CPU: Core i7-14650HX, RAM: 16GB DDR5, Storage: 512GB NVME',
  1345.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core i7-14650HX", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5050 DDR7 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core 7-240H / RTX 5060 8GB', 'asus-gaming-laptop-core-7-240h-rtx-5060-8gb', 'CPU: Core 7-240H, RAM: 16GB DDR5, Storage: 512 GB NVME',
  1345.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core 7-240H", "RAM": "16GB DDR5", "Storage": "512 GB NVME", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core 9-270H', 'asus-gaming-laptop-core-9-270h', 'CPU: Core 9-270H, RAM: 32GB DDR5, Storage: 1TB NVME',
  1285.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core 9-270H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "15.6\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / CLASSIC BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — AMD RYZEN 5 7535HS / RTX 4050 6GB', 'asus-gaming-laptop-amd-ryzen-5-7535hs-rtx-4050-6gb', 'CPU: AMD RYZEN 5 7535HS, RAM: 8GB DDR5, Storage: 512GB SSD',
  1065.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "AMD RYZEN 5 7535HS", "RAM": "8GB DDR5", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.6\" FHD 144HZ", "VGA": "RTX 4050 6GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MSI GAMING LAPTOP — Core ULTRA 7 155U', 'msi-gaming-laptop-core-ultra-7-155u', 'CPU: Core ULTRA 7 155U, RAM: 16GB, Storage: 1TB SSD',
  975.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core ULTRA 7 155U", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "7\" FHD 120HZ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL ARC / BLACK/FREE MSI CLAW TRAVEL CASE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core 7 SERIES 2 240H / RTX 5060 8GB', 'asus-gaming-laptop-core-7-series-2-240h-rtx-5060-8gb', 'CPU: Core 7 SERIES 2 240H, RAM: 32GB DDR5, Storage: 1TB NVME',
  1785.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core 7 SERIES 2 240H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WVA (2560x1600) 120HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "Interstellar Indigo"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core ULTRA 9 275HX / RTX 5060 8GB', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb-3', 'CPU: Core ULTRA 9 275HX, RAM: 16GB DDR5, Storage: 1TB NVME',
  1745.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core ULTRA 9 275HX", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" OLED (2560x1600) 240HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "OBSIDIAN BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS GAMING LAPTOP — Core I9-13900H / RTX 5060 8GB', 'asus-gaming-laptop-core-i9-13900h-rtx-5060-8gb', 'CPU: Core I9-13900H, RAM: 16GB DDR4, Storage: 512GB NVME',
  1545.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "Core I9-13900H", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD 165HZ", "VGA": "RTX 5060 8GB", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO YOGA 7 AURA EDITION 15ILL9 83HM002WUS', 'lenovo-yoga-7-aura-edition-15ill9-83hm002wus', 'CPU: Core ULTRA 7 258V, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1750.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83HM002WUS', TRUE, '{}'::text[], '{"CPU": "Core ULTRA 7 258V", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "15.3\" 2.8K WQXGA+ (2880x1800) TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD 5 2 IN 1 16 83KS001BUS', 'lenovo-ideapad-5-2-in-1-16-83ks001bus', 'CPU: Core ULTRA 7 255U, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1550.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83KS001BUS', TRUE, '{}'::text[], '{"CPU": "Core ULTRA 7 255U", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WUXGA (1920x1200)X360 TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / COSMIC BLUE/LENOVO DIGITAL PEN 2"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO YOGA 7 16AHP9 83DM0006US', 'lenovo-yoga-7-16ahp9-83dm0006us', 'CPU: AMD RYZEN 7 8840HS, RAM: 16GB DDR5 ON BOARD, Storage: 1TB NVME',
  1225.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83DM0006US', TRUE, '{}'::text[], '{"CPU": "AMD RYZEN 7 8840HS", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WUXGA (1920x1200)X360 TOUCHSCREEN", "VGA": "AMD RADEON 780M", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ARCTIC GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD SLIM 3 15IPH11 83UR0042DP', 'lenovo-ideapad-slim-3-15iph11-83ur0042dp', 'CPU: Core ULTRA 7 355, RAM: 16GB DDR5, Storage: 512GB NVME',
  1040.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83UR0042DP', TRUE, '{}'::text[], '{"CPU": "Core ULTRA 7 355", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO V14 G5 IRL 83HDA06JUS', 'lenovo-v14-g5-irl-83hda06jus', 'CPU: Core 7-240H, RAM: 16GB DDR5, Storage: 1TB NVME',
  1025.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83HDA06JUS', TRUE, '{}'::text[], '{"CPU": "Core 7-240H", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN11", "Color": "INTEL / BUSINESS BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO V15 G5 IRL 83HFA08GUS', 'lenovo-v15-g5-irl-83hfa08gus', 'CPU: Core 7-240H, RAM: 16GB DDR5, Storage: 1TB NVME',
  1025.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83HFA08GUS', TRUE, '{}'::text[], '{"CPU": "Core 7-240H", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "WIN11", "Color": "INTEL / BUSINESS BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD SLIM 3 15IRH10 83K100E7DP', 'lenovo-ideapad-slim-3-15irh10-83k100e7dp', 'CPU: Core I7-13620H, RAM: 16GB DDR5, Storage: 512GB NVME',
  935.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83K100E7DP', TRUE, '{}'::text[], '{"CPU": "Core I7-13620H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" FHD", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO V15 G5 IRL 83HF00EMIG', 'lenovo-v15-g5-irl-83hf00emig', 'CPU: Core I7-13620H, RAM: 16GB DDR5, Storage: 512GB NVME',
  935.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83HF00EMIG', TRUE, '{}'::text[], '{"CPU": "Core I7-13620H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD SLIM 3 15IPH11 83UR007RDP', 'lenovo-ideapad-slim-3-15iph11-83ur007rdp', 'CPU: Core ULTRA 5 322, RAM: 16GB DDR5, Storage: 512GB NVME',
  870.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83UR007RDP', TRUE, '{}'::text[], '{"CPU": "Core ULTRA 5 322", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / LUNA GREY / LENOVO 16\" T210 TOPLOAD"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD 5 2 IN 1 14IAL10 14IAL10 83KR0047US', 'lenovo-ideapad-5-2-in-1-14ial10-14ial10-83kr0047us', 'CPU: Core ULTRA 5 225U, RAM: 8GB DDR5 ON BOARD, Storage: 512GB NVME',
  860.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83KR0047US', TRUE, '{}'::text[], '{"CPU": "Core ULTRA 5 225U", "RAM": "8GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "14\" WUXGA (1920x1200)X360 TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD SLIM 3 15ABR8 82XM00LMUS', 'lenovo-ideapad-slim-3-15abr8-82xm00lmus', 'CPU: AMD Ryzen 7 5825U, RAM: 16GB DDR4 ON BOARD, Storage: 512GB NVME',
  845.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '82XM00LMUS', TRUE, '{}'::text[], '{"CPU": "AMD Ryzen 7 5825U", "RAM": "16GB DDR4 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\"FHD TOUCHSCREEN", "VGA": "AMD RADEON", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ARCTIC GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD SLIM 3 15IRH10 83K100C1DP', 'lenovo-ideapad-slim-3-15irh10-83k100c1dp', 'CPU: Core I5-13420H, RAM: 16GB DDR5, Storage: 512GB NVME',
  799.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83K100C1DP', TRUE, '{}'::text[], '{"CPU": "Core I5-13420H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IP1 15IRU7 83B40001US', 'lenovo-ip1-15iru7-83b40001us', 'CPU: Core I5-1334U, RAM: 16GB DDR4, Storage: 512GB NVME',
  799.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83B40001US', TRUE, '{}'::text[], '{"CPU": "Core I5-1334U", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\"FHD TOUCHSCREEN", "VGA": "INTEL IRIS XE", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ABYSS BLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO V15 G5 IRL 83GW006AEQ', 'lenovo-v15-g5-irl-83gw006aeq', 'CPU: Core I5-13420H, RAM: 8GB DDR5 (2 SLOTS), Storage: 512GB NVME',
  685.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83GW006AEQ', TRUE, '{}'::text[], '{"CPU": "Core I5-13420H", "RAM": "8GB DDR5 (2 SLOTS)", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK/TOPLOADER/LAN"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO V15 G5 IRL 83HF00E6IG', 'lenovo-v15-g5-irl-83hf00e6ig', 'CPU: Core I5-13420H, RAM: 8GB DDR5 (2 SLOTS), Storage: 512GB NVME',
  685.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83HF00E6IG', TRUE, '{}'::text[], '{"CPU": "Core I5-13420H", "RAM": "8GB DDR5 (2 SLOTS)", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO V15 G5 IRL 83GW006XUE', 'lenovo-v15-g5-irl-83gw006xue', 'CPU: Core I5-13420H, RAM: 8GB DDR5 (2 SLOTS), Storage: 512GB NVME',
  685.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83GW006XUE', TRUE, '{}'::text[], '{"CPU": "Core I5-13420H", "RAM": "8GB DDR5 (2 SLOTS)", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK/LAN"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO V15 G5 IRL 83GW006XGP', 'lenovo-v15-g5-irl-83gw006xgp', 'CPU: Core I5-13420H, RAM: 8GB DDR5 (2 SLOTS), Storage: 512GB NVME',
  685.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83GW006XGP', TRUE, '{}'::text[], '{"CPU": "Core I5-13420H", "RAM": "8GB DDR5 (2 SLOTS)", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK/LAN"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IP1 15IRU7 83B40008US', 'lenovo-ip1-15iru7-83b40008us', 'CPU: Core I5-1335U, RAM: 16GB DDR4, Storage: 256GB NVME',
  690.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83B40008US', TRUE, '{}'::text[], '{"CPU": "Core I5-1335U", "RAM": "16GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\"FHD", "VGA": "INTEL IRIS XE", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "CLOUD GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD SLIM 3 15IRH10 83K100E9AX', 'lenovo-ideapad-slim-3-15irh10-83k100e9ax', 'CPU: Core I5-13420H, RAM: 8GB DDR5, Storage: 512GB NVME',
  695.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83K100E9AX', TRUE, '{}'::text[], '{"CPU": "Core I5-13420H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.3\" WUXGA (1920x1200)", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IP1 15AMN7 82VG00WXUS', 'lenovo-ip1-15amn7-82vg00wxus', 'CPU: AMD Ryzen 5 7520U, RAM: 8GB DDR5 ON BOARD, Storage: 256GB NVME',
  615.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '82VG00WXUS', TRUE, '{}'::text[], '{"CPU": "AMD Ryzen 5 7520U", "RAM": "8GB DDR5 ON BOARD", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\"FHD", "VGA": "AMD Radeon 610M", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ABYSS BLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO V15 G5 IRL 83GW0076UE', 'lenovo-v15-g5-irl-83gw0076ue', 'CPU: Core I3-1315U, RAM: 8GB DDR5, Storage: 256GB NVME',
  565.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83GW0076UE', TRUE, '{}'::text[], '{"CPU": "Core I3-1315U", "RAM": "8GB DDR5", "Storage": "256GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK / LAN"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO V15 G5 IRL 83GW0076GP', 'lenovo-v15-g5-irl-83gw0076gp', 'CPU: Core I3-1315U, RAM: 8GB DDR5, Storage: 256GB NVME',
  565.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '83GW0076GP', TRUE, '{}'::text[], '{"CPU": "Core I3-1315U", "RAM": "8GB DDR5", "Storage": "256GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BUSINESS BLACK / LAN"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD SLIM 3 14IRU8 82X60062IN', 'lenovo-ideapad-slim-3-14iru8-82x60062in', 'CPU: Core I3-1315U, RAM: 8GB DDR5 ON BOARD, Storage: 512GB NVME',
  565.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '82X60062IN', TRUE, '{}'::text[], '{"CPU": "Core I3-1315U", "RAM": "8GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11 + OFFICE 2024", "Color": "INTEL / ARCTIC GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD SLIM 3 15IRU8 82X700DFDP', 'lenovo-ideapad-slim-3-15iru8-82x700dfdp', 'CPU: Core I3-1315U, RAM: 8GB DDR5 ON BOARD, Storage: 512GB NVME',
  565.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '82X700DFDP', TRUE, '{}'::text[], '{"CPU": "Core I3-1315U", "RAM": "8GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / ARCTIC GREY/ LENOVO CASUAL 15.6\" TOPLOADER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO IDEAPAD SLIM 3 15IAN8 82XB00G3DP', 'lenovo-ideapad-slim-3-15ian8-82xb00g3dp', 'CPU: INTEL N100 4 CORES, RAM: 8GB DDR5 ON BOARD, Storage: 256GB NVME',
  455.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '82XB00G3DP', TRUE, '{}'::text[], '{"CPU": "INTEL N100 4 CORES", "RAM": "8GB DDR5 ON BOARD", "Storage": "256GB NVME", "Language": "EN/AR", "Screen": "15.6\" FHD", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / ABYSS BLUE / LENOVO CASUAL 15.6\" TOPLOADER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'DELL LDB04250-7137BLU- PUS', 'dell-ldb04250-7137blu-pus', 'CPU: CORE ULTRA 7 256V, RAM: 16GB DDR5 ON BOARD, Storage: 1TB NVME',
  1250.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'LDB04250-7137BLU', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 256V", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\"FHD+ TOUCHSCREEN X360", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "ICE BLUE / USB HUB"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'DELL INSPIRON I5640-7609BLU-PUS', 'dell-inspiron-i5640-7609blu-pus', 'CPU: INTEL CORE 7 SERIES 1 150U, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1250.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'I5640-7609BLU-PUS', TRUE, '{}'::text[], '{"CPU": "INTEL CORE 7 SERIES 1 150U", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\"FHD+ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / ICE BLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'DELL PLUS LD15260-7140BLK-PUS', 'dell-plus-ld15260-7140blk-pus', 'CPU: CORE ULTRA 7 255U, RAM: 16GB DDR5 ON BOARD, Storage: 1TB NVME',
  1430.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'LD15260-7140BLK-PUS', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255U", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "15.6\"FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'DELL INSPIRON I7440-5647BLU-PUS', 'dell-inspiron-i7440-5647blu-pus', 'CPU: CORE 5 120U, RAM: 16GB DDR5 ON BOARD, Storage: 512GB NVME',
  915.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'I7440-5647BLU-PUS', TRUE, '{}'::text[], '{"CPU": "CORE 5 120U", "RAM": "16GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "14\" 2K X360 TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / ICE BLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS VIVOBOOK S16 S5606CA-SB92', 'asus-vivobook-s16-s5606ca-sb92', 'CPU: CORE ULTRA 9 285H, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1550.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'S5606CA-SB92', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 9 285H", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WQXGA+ 3K (2880 x 1800) OLED 120HZ", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL ARC / MIST BLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS VIVOBOOK FLIP 14 TP3407SA-DS74T', 'asus-vivobook-flip-14-tp3407sa-ds74t', 'CPU: CORE ULTRA 7 256V, RAM: 16GB DDR5 ON BOARD, Storage: 1TB NVME',
  1250.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'TP3407SA-DS74T', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 256V", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\" WUXGA OLED X360 TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL ARC / GRAY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS VIVOBOOK F1605VA-BS74', 'asus-vivobook-f1605va-bs74', 'CPU: CORE I7-13620H, RAM: 16GB DDR4 ON BOARD, Storage: 512GB NVME',
  870.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'F1605VA-BS74', TRUE, '{}'::text[], '{"CPU": "CORE I7-13620H", "RAM": "16GB DDR4 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "16\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / COOL SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS VIVOBOOK X1404VA-I712512', 'asus-vivobook-x1404va-i712512', 'CPU: CORE I7-1355U, RAM: 12GB DDR4, Storage: 512GB NVME',
  815.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'X1404VA-I712512', TRUE, '{}'::text[], '{"CPU": "CORE I7-1355U", "RAM": "12GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / QUIET BLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ASUS VIVOBOOK 14 X1404VAP-V14.C58256', 'asus-vivobook-14-x1404vap-v14-c58256', 'CPU: CORE 5 120U, RAM: 8GB DDR4, Storage: 256GB NVME',
  715.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'C58256', TRUE, '{}'::text[], '{"CPU": "CORE 5 120U", "RAM": "8GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / QUIET BLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP OMNIBOOK 7 FLIP 16-AU0773CL', 'hp-omnibook-7-flip-16-au0773cl', 'CPU: Core Ultra 7 258V, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1495.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'AU0773CL', TRUE, '{}'::text[], '{"CPU": "Core Ultra 7 258V", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" FHD TOUCHSCREEN X360", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "GLACIER SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP OMNIBOOK 7 16-AZ0595CL', 'hp-omnibook-7-16-az0595cl', 'CPU: Core 9 270H, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1495.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'AZ0595CL', TRUE, '{}'::text[], '{"CPU": "Core 9 270H", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K OLED 120HZ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / GLACIER SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP OMNIBOOK X NGAI 17-DD0047NR', 'hp-omnibook-x-ngai-17-dd0047nr', 'CPU: Core Ultra 7 256V, RAM: 16GB DDR5 ON BOARD, Storage: 512GB NVME',
  1295.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'DD0047NR', TRUE, '{}'::text[], '{"CPU": "Core Ultra 7 256V", "RAM": "16GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "17\" FHD TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "GLACIER SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP OMNIBOOK 5 16-AG1075CL', 'hp-omnibook-5-16-ag1075cl', 'CPU: AMD RYZEN AI 7 350, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1295.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'AG1075CL', TRUE, '{}'::text[], '{"CPU": "AMD RYZEN AI 7 350", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K TOUCHSCREEN", "VGA": "AMD RADEON 860M", "OS": "WIN 11", "Color": "INTEL / GLACIER SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP OMNIBOOK 5 16-AF1017WM', 'hp-omnibook-5-16-af1017wm', 'CPU: CORE ULTRA 7 255U, RAM: 16GB DDR5 ON BOARD, Storage: 1TB NVME',
  1075.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'AF1017WM', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255U", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\"FHD+ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / GLACIER SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP OMNIBOOK 5 16-AG1175CL', 'hp-omnibook-5-16-ag1175cl', 'CPU: AMD RYZEN AI 7 350, RAM: 16GB DDR5 ON BOARD, Storage: 1TB NVME',
  1075.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'AG1175CL', TRUE, '{}'::text[], '{"CPU": "AMD RYZEN AI 7 350", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K TOUCHSCREEN", "VGA": "AMD RADEON 860M", "OS": "WIN 11", "Color": "INTEL / GLACIER SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP OMNIBOOK 5 16-AF1055CL', 'hp-omnibook-5-16-af1055cl', 'CPU: CORE ULTRA 5 225U, RAM: 16GB DDR5 ON BOARD, Storage: 1TB NVME',
  1025.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'AF1055CL', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 5 225U", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" 2K TOUCHSCREEN", "OS": "WIN 11", "Color": "INTEL / INTEL / GLACIER SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP PROBOOK 4 G1I 16 AT7K5AV', 'hp-probook-4-g1i-16-at7k5av', 'CPU: Core Ultra 7-255U, RAM: 16GB DDR5, Storage: 512GB NVME',
  1145.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'AT7K5AV', TRUE, '{}'::text[], '{"CPU": "Core Ultra 7-255U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "16\" WUXGA", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / PIKE SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 17-CN5085CL', 'hp-17-cn5085cl', 'CPU: Core Ultra 7-255U, RAM: 16GB DDR5, Storage: 1TB NVME',
  1045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'CN5085CL', TRUE, '{}'::text[], '{"CPU": "Core Ultra 7-255U", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "17.3\" HD+ TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / BLUR"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 15-FD0127DX', 'hp-15-fd0127dx', 'CPU: CORE I7-1355U, RAM: 16GB DDR4, Storage: 512GB NVME',
  895.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'FD0127DX', TRUE, '{}'::text[], '{"CPU": "CORE I7-1355U", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD TOUCHSCREEN", "VGA": "INTEL IRIS XE", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "NATURAL SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 15-FD1899NR', 'hp-15-fd1899nr', 'CPU: Core 7-150U, RAM: 16GB DDR4, Storage: 512GB NVME',
  895.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'FD1899NR', TRUE, '{}'::text[], '{"CPU": "Core 7-150U", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 15-FD0215DX', 'hp-15-fd0215dx', 'CPU: CORE I5-1334U, RAM: 16GB DDR4, Storage: 512GB NVME',
  795.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'FD0215DX', TRUE, '{}'::text[], '{"CPU": "CORE I5-1334U", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / NATURAL SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 17-CP2025DX', 'hp-17-cp2025dx', 'CPU: AMD RYZEN 5 7520U, RAM: 8GB DDR5 ON BOARD, Storage: 512GB NVME',
  715.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'CP2025DX', TRUE, '{}'::text[], '{"CPU": "AMD RYZEN 5 7520U", "RAM": "8GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "17.3\" FHD", "VGA": "AMD RADEON", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "NATURAL SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 250R G9 B39ZCAT', 'hp-250r-g9-b39zcat', 'CPU: Core 5 120U, RAM: 8GB DDR4, Storage: 512GB NVME',
  725.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'B39ZCAT', TRUE, '{}'::text[], '{"CPU": "Core 5 120U", "RAM": "8GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / Dark ash silver / LAN"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 14-EP2035CL', 'hp-14-ep2035cl', 'CPU: CORE 3-N355, RAM: 16GB DDR4, Storage: 512GB NVME',
  575.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'EP2035CL', TRUE, '{}'::text[], '{"CPU": "CORE 3-N355", "RAM": "16GB DDR4", "Storage": "512GB NVME", "Language": "EN", "Screen": "14\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / NATURAL SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 15-FD0130WM', 'hp-15-fd0130wm', 'CPU: CORE I3-N305, RAM: 8GB DDR4, Storage: 256GB NVME',
  575.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'FD0130WM', TRUE, '{}'::text[], '{"CPU": "CORE I3-N305", "RAM": "8GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / MOONLIGHT BLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 15-FD0153DX', 'hp-15-fd0153dx', 'CPU: CORE I3-1315U, RAM: 8GB DDR4, Storage: 256GB NVME',
  545.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'FD0153DX', TRUE, '{}'::text[], '{"CPU": "CORE I3-1315U", "RAM": "8GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\" (1366 x 768) TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / NATURAL SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 15-FD0133WM', 'hp-15-fd0133wm', 'CPU: CORE I3-N305, RAM: 8GB DDR4, Storage: 256GB NVME',
  545.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'FD0133WM', TRUE, '{}'::text[], '{"CPU": "CORE I3-N305", "RAM": "8GB DDR4", "Storage": "256GB NVME", "Language": "EN", "Screen": "15.6\" FHD", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / NATURAL SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ACER ASPIRE 14 AI A14-52MT-94H5', 'acer-aspire-14-ai-a14-52mt-94h5', 'CPU: CORE ULTRA 9 288V, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1235.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '52MT-94H5', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 9 288V", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\" FHD TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "IRON"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ACER ASPIRE 14 AI A14-52M-72FH', 'acer-aspire-14-ai-a14-52m-72fh', 'CPU: CORE ULTRA 7 256V, RAM: 16GB DDR5 ON BOARD, Storage: 1TB NVME',
  965.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '72FH', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 256V", "RAM": "16GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "14\" FHD", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "IRON"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MICROSOFT SURFACE LAPTOP ZHI-00001', 'microsoft-surface-laptop-zhi-00001', 'CPU: Snapdragon X Elite ; X1E-80-100 12-core, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1995.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '00001', TRUE, '{}'::text[], '{"CPU": "Snapdragon X Elite ; X1E-80-100 12-core", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN", "Screen": "15\" PIXELSENSE (2496 x 1664) TOUCHSCREEN 120HZ", "Warranty": "1 YEAR", "OS": "WIN 11 HOME", "Color": "SNAPDRAGON QUALCOM ADRENO / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD X1 GEN 10 AURA EDITION 2 IN 1', 'lenovo-thinkpad-x1-gen-10-aura-edition-2-in-1', 'CPU: CORE ULTRA 7 255U, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  2595.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255U", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200) TOUCHSCREEN X360", "Warranty": "3 YEARS", "OS": "DOS", "Color": "INTEL / GRAY/LENOVO YOGA PEN"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD X9-15 GEN 1 AURA EDITION 21Q6006RUS', 'lenovo-thinkpad-x9-15-gen-1-aura-edition-21q6006rus', 'CPU: CORE ULTRA 7 258V, RAM: 32GB DDR5 ON BOARD, Storage: 512GB NVME',
  2195.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21Q6006RUS', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 258V", "RAM": "32GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "15.3\" 2.8K (2880x1800) OLED TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11 PRO", "Color": "GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD X9-14 GEN 1 AURA EDITION 21QA0036US', 'lenovo-thinkpad-x9-14-gen-1-aura-edition-21qa0036us', 'CPU: CORE ULTRA 7 268V VPRO, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  2095.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21QA0036US', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 268V VPRO", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" 2.8K (2880x1800) OLED TOUCHSCREEN", "VGA": "INTEL ARC 140V", "Warranty": "1 YEAR", "OS": "WIN 11 PRO", "Color": "GREY"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD T14S G6', 'lenovo-thinkpad-t14s-g6', 'CPU: CORE ULTRA 7 255U, RAM: 32GB DDR5, Storage: 1TB NVME',
  2045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'T14S', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255U", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "3 YEARS", "OS": "DOS", "Color": "INTEL / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD T14 G6', 'lenovo-thinkpad-t14-g6', 'CPU: CORE ULTRA 7 265H, RAM: 32GB DDR5, Storage: 1TB NVME',
  1945.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 265H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "3 YEARS", "OS": "DOS", "Color": "INTEL / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD T14 G6 21QG00APED', 'lenovo-thinkpad-t14-g6-21qg00aped', 'CPU: CORE ULTRA 7 258V, RAM: 32GB DDR5 ON BOARD, Storage: 1TB NVME',
  1845.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21QG00APED', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 258V", "RAM": "32GB DDR5 ON BOARD", "Storage": "1TB NVME", "Language": "EN/AR/BL", "Screen": "14\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140V", "Warranty": "3 YEARS", "OS": "DOS", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD T14 G6', 'lenovo-thinkpad-t14-g6-2', 'CPU: CORE ULTRA 7 255U, RAM: 32GB DDR5, Storage: 1TB NVME',
  1845.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255U", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "3 YEARS", "OS": "DOS", "Color": "INTEL / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD E16 GEN 3', 'lenovo-thinkpad-e16-gen-3', 'CPU: CORE ULTRA 7 255H, RAM: 32GB DDR5, Storage: 1TB NVME',
  1525.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "32GB DDR5", "Storage": "1TB NVME", "Language": "EN", "Screen": "16\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140T GPU", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD T14 GEN 6 21QDS3SL00', 'lenovo-thinkpad-t14-gen-6-21qds3sl00', 'CPU: CORE ULTRA 5 225U, RAM: 16GB DDR5, Storage: 512GB NVME',
  1495.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21QDS3SL00', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 5 225U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD L14 GEN 6 21S6003PUS', 'lenovo-thinkpad-l14-gen-6-21s6003pus', 'CPU: CORE ULTRA 7 255U, RAM: 16GB DDR5, Storage: 512GB NVME',
  1465.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21S6003PUS', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200) TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11 HOME", "Color": "INTEL / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD E16 GEN 3', 'lenovo-thinkpad-e16-gen-3-2', 'CPU: CORE ULTRA 7 255H, RAM: 16GB DDR5, Storage: 512GB NVME',
  1295.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Screen": "16\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140T GPU", "Warranty": "1 YEAR", "OS": "DOS", "Color": "ENBL / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD E14 GEN 7 21SX0070ED', 'lenovo-thinkpad-e14-gen-7-21sx0070ed', 'CPU: CORE ULTRA 7 255H, RAM: 16GB DDR5, Storage: 1TB NVME',
  1295.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21SX0070ED', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "1TB NVME", "Language": "EN/AR/BL", "Screen": "14\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140T GPU", "Warranty": "2 YEARS", "OS": "DOS", "Color": "BLACK/LENOVO CASE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD E14 GEN 7 21SX001TGQ', 'lenovo-thinkpad-e14-gen-7-21sx001tgq', 'CPU: CORE ULTRA 7 255H, RAM: 16GB DDR5, Storage: 512GB NVME',
  1295.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21SX001TGQ', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "VGA": "INTEL ARC 140T GPU", "Warranty": "1YEAR", "OS": "DOS", "Color": "BLACK/LENOVO CASE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD E14 GEN 7 21T90053ED', 'lenovo-thinkpad-e14-gen-7-21t90053ed', 'CPU: CORE 7 240H, RAM: 16GB DDR5, Storage: 512GB NVME',
  1095.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21T90053ED', TRUE, '{}'::text[], '{"CPU": "CORE 7 240H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/LENOVO CASE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD E16 GEN 3 21ST0014ED', 'lenovo-thinkpad-e16-gen-3-21st0014ed', 'CPU: AMD Ryzen 7 250, RAM: 16GB DDR5, Storage: 512GB NVME',
  1095.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21ST0014ED', TRUE, '{}'::text[], '{"CPU": "AMD Ryzen 7 250", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR/BL", "Screen": "16\" WUXGA (1920 x 1200)", "VGA": "AMD Radeon 780M", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD E16 GEN 3 21TF005BED', 'lenovo-thinkpad-e16-gen-3-21tf005bed', 'CPU: CORE 5-210H, RAM: 16GB DDR5, Storage: 512GB NVME',
  1075.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21TF005BED', TRUE, '{}'::text[], '{"CPU": "CORE 5-210H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR/BL", "Screen": "16\" WUXGA (1920 x 1200)", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/LENOVO CASE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD E16 GEN 3', 'lenovo-thinkpad-e16-gen-3-3', 'CPU: CORE ULTRA 5 225H, RAM: 8GB DDR5, Storage: 512GB NVME',
  1045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 5 225H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "16\" WUXGA (1920 x 1200)", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKPAD E14 GEN 7', 'lenovo-thinkpad-e14-gen-7', 'CPU: CORE ULTRA 5 225H, RAM: 8GB DDR5, Storage: 512GB NVME',
  1045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, NULL, TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 5 225H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA (1920 x 1200)", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKBOOK 16 G8 IAL 21SK0030GP', 'lenovo-thinkbook-16-g8-ial-21sk0030gp', 'CPU: CORE ULTRA 7 255H, RAM: 16GB DDR5, Storage: 512GB NVME',
  1145.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21SK0030GP', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "16\" WUXGA", "VGA": "INTEL ARC 140T GPU", "Warranty": "1 YEAR", "OS": "DOS", "Color": "ARCTIC GREY/LENOVO CASE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKBOOK 14 G8 IAL 21SJ0001GQ', 'lenovo-thinkbook-14-g8-ial-21sj0001gq', 'CPU: CORE ULTRA 7 255H, RAM: 8GB DDR5, Storage: 512GB NVME',
  1075.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21SJ0001GQ', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 7 255H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "14\" WUXGA", "VGA": "INTEL ARC 140T GPU", "Warranty": "1 YEAR", "OS": "DOS", "Color": "ARCTIC GREY/LENOVO CASE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKBOOK 16 G8 IAL 21SK0027GP', 'lenovo-thinkbook-16-g8-ial-21sk0027gp', 'CPU: CORE ULTRA 5 225U, RAM: 16GB DDR5, Storage: 512GB NVME',
  1045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21SK0027GP', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 5 225U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN/BL", "Screen": "16\" WUXGA", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / ARCTIC GREY/LENOVO CASE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKBOOK 16 G9 IRL 21US002XED', 'lenovo-thinkbook-16-g9-irl-21us002xed', 'RAM: 16GB DDR5, Storage: 512GB NVME, Language: EN',
  945.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, '21US002XED', TRUE, '{}'::text[], '{"RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "16\" WUXGA", "CPU": "INTEL", "Warranty": "2 YEARS", "OS": "DOS", "Color": "COR 5-210H / ARCTIC GREY/Topload Case"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKCENTER M70T GEN 5 12U60046GP', 'lenovo-thinkcenter-m70t-gen-5-12u60046gp', 'CPU: Core I7-14700, RAM: 8GB DDR5, Storage: 512GB NVME',
  999.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '12U60046GP', TRUE, '{}'::text[], '{"CPU": "Core I7-14700", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN", "VGA": "Intel UHD Graphics 770", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK/WIRED KEYBOARD AND MOUSE /WIFI+BLUETOOTH"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TINY THINKCENTER Neo 50q 13B9004UEX', 'lenovo-tiny-thinkcenter-neo-50q-13b9004uex', 'CPU: Core 7-240H, RAM: 8GB DDR5, Storage: 512GB NVME',
  975.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '13B9004UEX', TRUE, '{}'::text[], '{"CPU": "Core 7-240H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE / VESA MOUNT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKCENTER Neo 50T 13BD001WEX', 'lenovo-thinkcenter-neo-50t-13bd001wex', 'CPU: Core ULTRA 5-225U, RAM: 16GB DDR5, Storage: 512GB NVME',
  975.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '13BD001WEX', TRUE, '{}'::text[], '{"CPU": "Core ULTRA 5-225U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKCENTER Neo 50T 13BD002WEX', 'lenovo-thinkcenter-neo-50t-13bd002wex', 'CPU: Core ULTRA 5-225U, RAM: 8GB DDR5, Storage: 512GB NVME',
  915.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '13BD002WEX', TRUE, '{}'::text[], '{"CPU": "Core ULTRA 5-225U", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TINY THINKCENTER Neo 50q 13HR000PEX', 'lenovo-tiny-thinkcenter-neo-50q-13hr000pex', 'CPU: Core ULTRA 5-226V, RAM: 16GB DDR5, Storage: 512GB NVME',
  910.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '13HR000PEX', TRUE, '{}'::text[], '{"CPU": "Core ULTRA 5-226V", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE / VESA MOUNT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TINY THINKCENTER Neo 50q 13B9004SEX', 'lenovo-tiny-thinkcenter-neo-50q-13b9004sex', 'CPU: CORE 5-210H, RAM: 8GB DDR5, Storage: 512GB NVME',
  815.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '13B9004SEX', TRUE, '{}'::text[], '{"CPU": "CORE 5-210H", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Warranty": "2 YEARS", "OS": "DOS", "Color": "INTEL / BLACK/USB KEYB AND MOUSE / VESA MOUNT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'THINKCENTER NEO 50T GEN 5 12UD00C2GP', 'lenovo-thinkcenter-neo-50t-gen-5-12ud00c2gp', 'CPU: Core I3-14100, RAM: 8GB DDR5, Storage: 512GB NVME',
  685.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '12UD00C2GP', TRUE, '{}'::text[], '{"CPU": "Core I3-14100", "RAM": "8GB DDR5", "Storage": "512GB NVME", "Language": "EN/AR", "VGA": "Intel UHD Graphics 730", "Warranty": "1 YEAR", "OS": "DOS", "Color": "BLACK/WIRED KEYBOARD AND MOUSE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'TINY THINKCENTER M80Q GEN 4 12EAS2KN00', 'lenovo-tiny-thinkcenter-m80q-gen-4-12eas2kn00', 'CPU: Core I3-13100T, RAM: 8GB DDR5, Storage: 256GB NVME',
  615.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '12EAS2KN00', TRUE, '{}'::text[], '{"CPU": "Core I3-13100T", "RAM": "8GB DDR5", "Storage": "256GB NVME", "Language": "EN", "VGA": "Intel UHD Graphics 730", "Warranty": "2 YEARS", "OS": "DOS", "Color": "BLACK /WIRED KEYBOARD AND MOUSE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'MSI AIO AM242TP 1M-839US', 'msi-aio-am242tp-1m-839us', 'CPU: Core 7-150U, RAM: 16GB DDR5, Storage: 1TB NVME + 1TB HDD',
  1575.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '839US', TRUE, '{}'::text[], '{"CPU": "Core 7-150U", "RAM": "16GB DDR5", "Storage": "1TB NVME + 1TB HDD", "Language": "EN", "Screen": "23.8\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / BLACK/WIRELESS KEYBOARD AND MOUSE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'DELL AIO 24 DEC24250-7482WHT-PUS', 'dell-aio-24-dec24250-7482wht-pus', 'CPU: Core 7-150U, RAM: 16GB DDR5, Storage: 512GB NVME',
  1425.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, 'DEC24250-7482WHT-PUS', TRUE, '{}'::text[], '{"CPU": "Core 7-150U", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "23.8\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "WIN 11", "Color": "INTEL / WHITE/DELL PRO KEYBOARD AND MOUSE KM5221W WHITE (COPILOT)"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Lenovo ThinkCentre AiO Neo 50a-24 G6 13QG0016EX', 'lenovo-thinkcentre-aio-neo-50a-24-g6-13qg0016ex', 'CPU: CORE ULTRA 5-226V, RAM: 16GB DDR5 ON BOARD, Storage: 512GB NVME',
  1125.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '13QG0016EX', TRUE, '{}'::text[], '{"CPU": "CORE ULTRA 5-226V", "RAM": "16GB DDR5 ON BOARD", "Storage": "512GB NVME", "Language": "EN", "Screen": "23.8\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY/ WIRED KEYBOARD AND MOUSE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Lenovo ThinkCentre AiO Neo 50a-24 G5 12SC00ANEX', 'lenovo-thinkcentre-aio-neo-50a-24-g5-12sc00anex', 'CPU: CORE 5-210H, RAM: 16GB DDR5, Storage: 512GB NVME',
  1075.0, (SELECT id FROM categories WHERE slug = 'desktops'), 5, '12SC00ANEX', TRUE, '{}'::text[], '{"CPU": "CORE 5-210H", "RAM": "16GB DDR5", "Storage": "512GB NVME", "Language": "EN", "Screen": "23.8\" FHD TOUCHSCREEN", "Warranty": "1 YEAR", "OS": "DOS", "Color": "INTEL / LUNA GREY/ WIRED KEYBOARD AND MOUSE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 16" M5 MAX 48GB/2TB SSD — SPACE BLACK', 'apple-macbook-pro-16-m5-max-48gb-2tb-ssd-space-black', 'CPU: Apple M5 MAX 18-Core Chip, RAM: 48GB, Storage: 2TB SSD',
  4850.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MGEE4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 MAX 18-Core Chip", "RAM": "48GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "40-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 16" M5 MAX 36GB/2TB SSD — SPACE BLACK', 'apple-macbook-pro-16-m5-max-36gb-2tb-ssd-space-black', 'CPU: Apple M5 MAX 18-Core Chip, RAM: 36GB, Storage: 2TB SSD',
  4350.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MGED4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 MAX 18-Core Chip", "RAM": "36GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "32-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 MAX 36GB/2TB SSD — SPACE BLACK', 'apple-macbook-pro-14-m5-max-36gb-2tb-ssd-space-black', 'CPU: Apple M5 MAX 18-Core Chip, RAM: 36GB, Storage: 2TB SSD',
  4100.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MGDU4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 MAX 18-Core Chip", "RAM": "36GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "32-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 MAX 36GB/2TB SSD — SILVER', 'apple-macbook-pro-14-m5-max-36gb-2tb-ssd-silver', 'CPU: Apple M5 MAX 18-Core Chip, RAM: 36GB, Storage: 2TB SSD',
  4075.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MGDQ4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 MAX 18-Core Chip", "RAM": "36GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "32-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 16" M5 PRO 48GB/1TB SSD — SPACE BLACK', 'apple-macbook-pro-16-m5-pro-48gb-1tb-ssd-space-black', 'CPU: Apple M5 PRO 18-Core Chip, RAM: 48GB, Storage: 1TB SSD',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, 'MGEC4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 PRO 18-Core Chip", "RAM": "48GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "20-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 16" M5 PRO 48GB/1TB SSD — SILVER', 'apple-macbook-pro-16-m5-pro-48gb-1tb-ssd-silver', 'CPU: Apple M5 PRO 18-Core Chip, RAM: 48GB, Storage: 1TB SSD',
  3650.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MGE64LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 PRO 18-Core Chip", "RAM": "48GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "20-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 16" M5 PRO 24GB/1TB SSD — SPACE BLACK', 'apple-macbook-pro-16-m5-pro-24gb-1tb-ssd-space-black', 'CPU: Apple M5 PRO 18-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  3200.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MGEA4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 PRO 18-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "16\" 3456 x 2234 Liquid Retina XDR Screen", "VGA": "20-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 PRO 24GB/2TB SSD — SPACE BLACK', 'apple-macbook-pro-14-m5-pro-24gb-2tb-ssd-space-black', 'CPU: Apple M5 PRO 15-Core Chip, RAM: 24GB, Storage: 2TB SSD',
  3150.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MJLW4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 PRO 15-Core Chip", "RAM": "24GB", "Storage": "2TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "16-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 PRO 24GB/1TB SSD — SILVER', 'apple-macbook-pro-14-m5-pro-24gb-1tb-ssd-silver', 'CPU: Apple M5 PRO 15-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  2650.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MGDN4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 PRO 15-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "16-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 PRO 24GB/1TB SSD — SPACE BLACK', 'apple-macbook-pro-14-m5-pro-24gb-1tb-ssd-space-black', 'CPU: Apple M5 PRO 15-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  2650.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MGDR4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 PRO 15-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "16-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 32GB/1TB SSD — SPACE BLACK', 'apple-macbook-pro-14-m5-32gb-1tb-ssd-space-black', 'CPU: Apple M5 10-Core Chip, RAM: 32GB, Storage: 1TB SSD',
  2650.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MJ3D4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "32GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 32GB/1TB SSD — SILVER', 'apple-macbook-pro-14-m5-32gb-1tb-ssd-silver', 'CPU: Apple M5 10-Core Chip, RAM: 32GB, Storage: 1TB SSD',
  2650.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MJ3E4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "32GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 24GB/1TB SSD — SILVER', 'apple-macbook-pro-14-m5-24gb-1tb-ssd-silver', 'CPU: Apple M5 10-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  2325.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDE64LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 24GB/1TB SSD — SPACE BLACK', 'apple-macbook-pro-14-m5-24gb-1tb-ssd-space-black', 'CPU: Apple M5 10-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  2325.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDE34LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 16GB/1TB SSD — SPACE BLACK', 'apple-macbook-pro-14-m5-16gb-1tb-ssd-space-black', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 1TB SSD',
  2125.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDE14LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SPACE BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Pro 14" M5 16GB/1TB SSD — SILVER', 'apple-macbook-pro-14-m5-16gb-1tb-ssd-silver', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 1TB SSD',
  2125.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDE54LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "14\" 3024 x 1964 Liquid Retina XDR Screen", "VGA": "10-Core GPU | 16-Core Neural Accelerators", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 24GB/1TB SSD — MIDNIGHT', 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-midnight', 'CPU: Apple M5 10-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  2125.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVN4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 24GB/1TB SSD — SILVER', 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-silver', 'CPU: Apple M5 10-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  2125.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVC4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 24GB/1TB SSD — STARLIGHT', 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-starlight', 'CPU: Apple M5 10-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  2125.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVF4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "STARLIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 24GB/1TB SSD — SKYBLUE', 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-skyblue', 'CPU: Apple M5 10-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  2125.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVU4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 16GB/1TB SSD — SKYBLUE', 'apple-macbook-air-15-3-m5-16gb-1tb-ssd-skyblue', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 1TB SSD',
  1925.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVT4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 16GB/1TB SSD — SILVER', 'apple-macbook-air-15-3-m5-16gb-1tb-ssd-silver', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 1TB SSD',
  1925.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVA4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 16GB/1TB SSD — MIDNIGHT', 'apple-macbook-air-15-3-m5-16gb-1tb-ssd-midnight', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 1TB SSD',
  1925.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVK4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 24GB/1TB SSD — SILVER', 'apple-macbook-air-13-6-m5-24gb-1tb-ssd-silver', 'CPU: Apple M5 10-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  1850.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDH94LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 24GB/1TB SSD — MIDNIGHT', 'apple-macbook-air-13-6-m5-24gb-1tb-ssd-midnight', 'CPU: Apple M5 10-Core Chip, RAM: 24GB, Storage: 1TB SSD',
  1850.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDHG4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "24GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 16GB/1TB SSD — MIDNIGHT', 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-midnight', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 1TB SSD',
  1650.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDHF4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 16GB/1TB SSD — SILVER', 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-silver', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 1TB SSD',
  1650.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDH84LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 16GB/1TB SSD — SKYBLUE', 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-skyblue', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 1TB SSD',
  1650.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDHJ4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 16GB/1TB SSD — STARLIGHT', 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-starlight', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 1TB SSD',
  1650.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDHC4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "1TB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "STARLIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 16GB/512GB SSD — STARLIGHT', 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-starlight', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 512GB SSD',
  1685.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVD4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "STARLIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 16GB/512GB SSD — SKYBLUE', 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-skyblue', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 512GB SSD',
  1685.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVQ4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 16GB/512GB SSD — SILVER', 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-silver', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 512GB SSD',
  1685.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDV94LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 15.3" M5 16GB/512GB SSD — MIDNIGHT', 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-midnight', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 512GB SSD',
  1685.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDVH4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "15.3\" 2880x1864", "VGA": "10-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 16GB/512GB SSD — SKYBLUE', 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-skyblue', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 512GB SSD',
  1425.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDHH4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "8-CORE GPU", "OS": "MAC OS", "Color": "SKYBLUE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 16GB/512GB SSD — STARLIGHT', 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-starlight', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 512GB SSD',
  1425.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDHA4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "8-CORE GPU", "OS": "MAC OS", "Color": "STARLIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 16GB/512GB SSD — MIDNIGHT', 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-midnight', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 512GB SSD',
  1425.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDHE4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "8-CORE GPU", "OS": "MAC OS", "Color": "MIDNIGHT"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air 13.6" M5 16GB/512GB SSD — SILVER', 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-silver', 'CPU: Apple M5 10-Core Chip, RAM: 16GB, Storage: 512GB SSD',
  1425.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MDH74LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M5 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13.6\" 2560x1664", "VGA": "8-CORE GPU", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Neo 13" A18 PRO 8GB/512GB SSD — CITRUS', 'apple-macbook-neo-13-a18-pro-8gb-512gb-ssd-citrus', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB, Storage: 512GB SSD',
  1045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MHFE4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13\" 2408x1506", "VGA": "5-CORE GPU", "OS": "MAC OS", "Color": "CITRUS"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Neo 13" A18 PRO 8GB/512GB SSD — SILVER', 'apple-macbook-neo-13-a18-pro-8gb-512gb-ssd-silver', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB, Storage: 512GB SSD',
  0.0, (SELECT id FROM categories WHERE slug = 'laptops'), 0, 'MHFC4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13\" 2408x1506", "VGA": "5-CORE GPU", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Neo 13" A18 PRO 8GB/512GB SSD — INDIGO', 'apple-macbook-neo-13-a18-pro-8gb-512gb-ssd-indigo', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB, Storage: 512GB SSD',
  1045.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MHFG4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB", "Storage": "512GB SSD", "Language": "EN", "Screen": "13\" 2408x1506", "VGA": "5-CORE GPU", "OS": "MAC OS", "Color": "INDIGO"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Neo 13" A18 PRO 8GB/256GB SSD — INDIGO', 'apple-macbook-neo-13-a18-pro-8gb-256gb-ssd-indigo', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB, Storage: 256GB SSD',
  915.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MHFF4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB", "Storage": "256GB SSD", "Language": "EN", "Screen": "13\" 2408x1506", "VGA": "5-CORE GPU", "OS": "MAC OS", "Color": "INDIGO"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Neo 13" A18 PRO 8GB/256GB SSD — CITRUS', 'apple-macbook-neo-13-a18-pro-8gb-256gb-ssd-citrus', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB, Storage: 256GB SSD',
  915.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MHFD4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB", "Storage": "256GB SSD", "Language": "EN", "Screen": "13\" 2408x1506", "VGA": "5-CORE GPU", "OS": "MAC OS", "Color": "CITRUS"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Neo 13" A18 PRO 8GB/256GB SSD — BLUSH', 'apple-macbook-neo-13-a18-pro-8gb-256gb-ssd-blush', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB, Storage: 256GB SSD',
  945.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MHFH4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB", "Storage": "256GB SSD", "Language": "EN", "Screen": "13\" 2408x1506", "VGA": "5-CORE GPU", "OS": "MAC OS", "Color": "BLUSH"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Neo 13" A18 PRO 8GB/256GB SSD — SILVER', 'apple-macbook-neo-13-a18-pro-8gb-256gb-ssd-silver', 'CPU: Apple A18 Pro 6-Core Chip, RAM: 8GB, Storage: 256GB SSD',
  915.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MHFA4LL/A', TRUE, '{}'::text[], '{"CPU": "Apple A18 Pro 6-Core Chip", "RAM": "8GB", "Storage": "256GB SSD", "Language": "EN", "Screen": "13\" 2408x1506", "VGA": "5-CORE GPU", "OS": "MAC OS", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air M4 16GB/512GB SSD — SILVER', 'apple-macbook-air-m4-16gb-512gb-ssd-silver', 'CPU: Apple M4 10-Core Chip, RAM: 16GB, Storage: 512GB SSD',
  1165.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MU9E3LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M4 10-Core Chip", "RAM": "16GB", "Storage": "512GB SSD", "VGA": "10-CORE GPU", "OS": "MACOS WITH APPLE INTELLIGENCE", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple MacBook Air M4 16GB/256GB SSD — SILVER', 'apple-macbook-air-m4-16gb-256gb-ssd-silver', 'CPU: Apple M4 10-Core Chip, RAM: 16GB, Storage: 256GB SSD',
  995.0, (SELECT id FROM categories WHERE slug = 'laptops'), 5, 'MU9D3LL/A', TRUE, '{}'::text[], '{"CPU": "Apple M4 10-Core Chip", "RAM": "16GB", "Storage": "256GB SSD", "VGA": "10-CORE GPU", "OS": "MACOS WITH APPLE INTELLIGENCE", "Color": "SILVER"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple AirPods Max 2,Over-ear wireless,Up to 20 hours with Active Noise Cancellation enabled', 'apple-airpods-max-2-over-ear-wireless-up-to-20-hours-with-active-noise-cancellat', 'Color: BLACK',
  585.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, 'MHWK4LL/A', TRUE, '{}'::text[], '{"Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple Magic Mouse Multi-Touch Surface/Usb-C Charge Cable', 'apple-magic-mouse-multi-touch-surface-usb-c-charge-cable', 'Color: BLACK',
  145.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, 'MXK63ZA/A', TRUE, '{}'::text[], '{"Color": "BLACK"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Apple Magic Mouse Multi-Touch Surface/Usb-C Charge Cable', 'apple-magic-mouse-multi-touch-surface-usb-c-charge-cable-2', 'Color: WHITE',
  115.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, 'MXK53ZA/A', TRUE, '{}'::text[], '{"Color": "WHITE"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Seagate ONE TOUCH HUB 20TB External Hard Drive', 'seagate-one-touch-hub-20tb-external-hard-drive', NULL,
  950.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Seagate ONE TOUCH HUB 16TB External Hard Drive', 'seagate-one-touch-hub-16tb-external-hard-drive', NULL,
  770.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Seagate ONE TOUCH HUB 12TB External Hard Drive', 'seagate-one-touch-hub-12tb-external-hard-drive', NULL,
  645.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Seagate ONE TOUCH HUB 8TB External Hard Drive', 'seagate-one-touch-hub-8tb-external-hard-drive', NULL,
  555.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Seagate 4TB Expansion Portable USB 3.0 External Hard Drive', 'seagate-4tb-expansion-portable-usb-3-0-external-hard-drive', NULL,
  215.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Seagate 2TB Expansion Portable USB 3.0 External Hard Drive', 'seagate-2tb-expansion-portable-usb-3-0-external-hard-drive', NULL,
  165.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '96000 MAH', 'seagate-96000-mah', 'Power Bank',
  165.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '30000 MAH', 'seagate-30000-mah', 'Power Bank',
  65.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '24000 MAH', 'seagate-24000-mah', 'Power Bank',
  45.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 3J122AA PEN RECHARGEABLE TYPE C', 'hp-3j122aa-pen-rechargeable-type-c', NULL,
  100.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP 410 SLIM SILVER BLUETOOTH MOUSE', 'hp-410-slim-silver-bluetooth-mouse', NULL,
  58.0, (SELECT id FROM categories WHERE slug = 'storage'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Lenovo Legion 15.6" Recon Gaming Backpack', 'lenovo-legion-15-6-recon-gaming-backpack', NULL,
  88.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, 'GX40S69333', TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Lenovo Legion Active Gaming Backpack', 'lenovo-legion-active-gaming-backpack', NULL,
  88.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, 'GX41C86982', TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CN600GL-70 Targus Backpack 15.6" CN600 Classic Black', 'lenovo-cn600gl-70-targus-backpack-15-6-cn600-classic-black', NULL,
  58.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, 'CN600GL-70', TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Lenovo 15.6-Inch Laptop Urban Sleeve Case', 'lenovo-15-6-inch-laptop-urban-sleeve-case', NULL,
  48.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, 'GX40Z50942', TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Lenovo 65W Standard AC Adapter (USB Type-C)- UK Plug', 'lenovo-65w-standard-ac-adapter-usb-type-c-uk-plug', NULL,
  58.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, '4X20M26276', TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Lenovo 510 WIRELESS COMBO KEYBOARD AND MOUSE', 'lenovo-510-wireless-combo-keyboard-and-mouse', NULL,
  58.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, 'GX30N81779', TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'LENOVO 150 WIRELESS MOUSE WITH BATTERY', 'lenovo-150-wireless-mouse-with-battery', NULL,
  20.0, (SELECT id FROM categories WHERE slug = 'peripherals'), 5, '4Y51M70369', TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'EPSON TM-T20X (051) Thermal Receipt Printer', 'epson-tm-t20x-051-thermal-receipt-printer', 'USB+Serial, speed 200mm/sec (C31CH26051)',
  210.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'EPSON TM-T20X (052) Thermal Receipt Printer', 'epson-tm-t20x-052-thermal-receipt-printer', 'LAN, speed 200mm/sec (C31CH26052)',
  210.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'EPSON TM-T20III (011) Thermal Receipt Printer', 'epson-tm-t20iii-011-thermal-receipt-printer', 'USB+Serial, speed 250mm/sec (C31CH51011)',
  220.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'EPSON TM-T20III (012) Thermal Receipt Printer', 'epson-tm-t20iii-012-thermal-receipt-printer', 'LAN, speed 250mm/sec (C31CH51012)',
  265.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'EPSON TM-M30II (122) Thermal Receipt Printer', 'epson-tm-m30ii-122-thermal-receipt-printer', 'USB+LAN+NES, speed 250mm/sec (C31CJ27122)',
  295.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'EPSON TM-M30II (112) Thermal Receipt Printer', 'epson-tm-m30ii-112-thermal-receipt-printer', 'USB+LAN+Bluetooth, speed 250mm/sec (C31CJ27112)',
  325.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'EPSON PRINTER LQ 350 Dot Matrix(A4) 24 pins', 'epson-printer-lq-350-dot-matrix-a4-24-pins', '80 col, Original + 3 copies, 300 cps HSD (10 cpi), Connectivity: Parallel, USB and Serial interface.',
  265.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{"Connectivity": "Parallel, USB and Serial interface."}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'EPSON PRINTER LQ 690II Dot Matrix (A4) 24 pins Flat-Bed', 'epson-printer-lq-690ii-dot-matrix-a4-24-pins-flat-bed', '106 columns, Original + 6 copies, 487 cps in HSD, Connectivity : Parallel and USB 2.0 interface.',
  635.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{"Connectivity": "Parallel and USB 2.0 interface."}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '22" SAMSUNG Monitor S3 100Hz D-Sub', 'samsung-22-samsung-monitor-s3-100hz-d-sub', 'HDMI FHD |LS22D300GAMXUE',
  100.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '24" LG IPS Borderless 120Hz D-Sub', 'lg-24-lg-ips-borderless-120hz-d-sub', 'HDMI FHD |24U411A-B',
  109.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '24" ASUS IPS Monitor 120Hz 1ms', 'asus-24-asus-ips-monitor-120hz-1ms', 'HDMI,D-SUB FHD |VA249HG',
  119.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '24" MSI IPS Monitor PIVOT MP245PG 100Hz 1ms Multimedia DP', 'msi-24-msi-ips-monitor-pivot-mp245pg-100hz-1ms-multimedia-dp', 'HDMI,D-SUB,Tilt and Swivel',
  132.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '24" MSI IPS Monitor PIVOT MP245PG E2 144Hz 1ms Multimedia DP', 'msi-24-msi-ips-monitor-pivot-mp245pg-e2-144hz-1ms-multimedia-dp', 'HDMI,D-SUB,Tilt and Swivel',
  135.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '25" MSI IPS Gaming Monitor G255PF E2 180Hz 1ms Multimedia 2*HDMI', 'msi-25-msi-ips-gaming-monitor-g255pf-e2-180hz-1ms-multimedia-2-hdmi', 'DP FHD',
  158.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '25" MSI IPS Gaming Monitor 255XF AI Vision 300Hz 0.5ms 2*HDMI', 'msi-25-msi-ips-gaming-monitor-255xf-ai-vision-300hz-0-5ms-2-hdmi', 'DP FHD',
  178.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '27" Samsung Monitor S3 100Hz D-Sub', 'samsung-27-samsung-monitor-s3-100hz-d-sub', 'HDMI FHD |LS27D300GAMXUE',
  122.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '27" Samsung Curved Monitor S3 100Hz D-Sub', 'samsung-27-samsung-curved-monitor-s3-100hz-d-sub', 'HDMI FHD |LS27D362GAMXUE',
  133.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '27" LG IPS Borderless 120Hz D-Sub', 'lg-27-lg-ips-borderless-120hz-d-sub', 'HDMI FHD |27U411A-B',
  127.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '27" MSI IPS Gaming FHD 144Hz 1ms Multimedia USB-C', 'msi-27-msi-ips-gaming-fhd-144hz-1ms-multimedia-usb-c', 'HDMI|PRO MP272 E14C',
  158.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '27" MSI Curved Gaming WQHD 180Hz 0.5ms 2*HDMI', 'msi-27-msi-curved-gaming-wqhd-180hz-0-5ms-2-hdmi', 'DP|MAG 275CQF E18',
  245.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  '32" LG UltraGear 2K QHD CURVED Gaming 180Hz', 'lg-32-lg-ultragear-2k-qhd-curved-gaming-180hz', '2HDMI,DP|32GS60QC-B',
  315.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'OPTOMA Projector 4000 Lumns XGA', 'optoma-projector-4000-lumns-xga', 'HDMI,10W speaker| X400LVE',
  369.0, (SELECT id FROM categories WHERE slug = 'monitors'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-T3-G4', 'appostars-ap-t3-g4', 'Plastic Case + L2 Metal Stand ; . 15.6" Capacitive True Flat Touch Screen | Resolution: 1366*768 ; . Second Display: N/A ; . CPU: Intel Core i5 (4th Generation) ; . Hard Disk Driver: 128GB SSD ; . Memory: 8GB DDR3 RAM ; . Operating System: Win 10 ; . Power Supply: DC 8A ; . Color: Full Black ; . OPTIONAL: AP-VFD 40 Digits Customer Display VFD 2 Lines @ 40$',
  425.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-T3-G4', TRUE, '{}'::text[], '{"Resolution": "1366*768", "Second Display": "N/A", "CPU": "Intel Core i5 (4th Generation)", "Hard Disk Driver": "128GB SSD", "Memory": "8GB DDR3 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black", "Optional": "AP-VFD 40 Digits Customer Display VFD 2 Lines @ 40$"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-T3-G6', 'appostars-ap-t3-g6', 'Plastic Case + L2 Metal Stand , . 15.6" Capacitive True Flat Touch Screen | Resolution: 1366*768 ; . Second Display: N/A ; . CPU: Intel Core i5 (6th Generation) ; . Hard Disk Driver: 256GB SSD ; . Memory: 8GB DDR4 RAM ; . Operating System: Win 10 ; . Power Supply: DC 8A ; . Color: Full Black',
  570.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-T3-G6', TRUE, '{}'::text[], '{"Resolution": "1366*768", "Second Display": "N/A", "CPU": "Intel Core i5 (6th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-T3-G6.VFD', 'appostars-ap-t3-g6-vfd', 'Plastic Case + L2 Metal Stand , . 15.6" Capacitive True Flat Touch Screen | Resolution: 1366*768 ; . Second Display: VFD 2 lines ; . CPU: Intel Core i5 (6th Generation) ; . Hard Disk Driver: 256GB SSD ; . Memory: 8GB DDR4 RAM ; . Operating System: Win 10 ; . Power Supply: DC 8A ; . Color: Full Black',
  588.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-T3-G6.VFD', TRUE, '{}'::text[], '{"Resolution": "1366*768", "Second Display": "VFD 2 lines", "CPU": "Intel Core i5 (6th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Optional ; AP-11.6T , POS System Part ; 11.6" TOUCH LCD ; Resolution: 1366*768 ; For AP-T3 / AP-A6 Models', 'appostars-optional-ap-11-6t-pos-system-part-11-6-touch-lcd-resolution-1366-768-f', 'Resolution: 1366*768',
  115.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, '{}'::text[], '{"Resolution": "1366*768"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-A3-G5', 'appostars-ap-a3-g5', 'Metal Stand (L3) & Metal Case , . 15.0" Capacitive True Flat Touch Screen | Resolution: 1024*768 ; . Second Display: N/A ; . CPU: Intel Core i5 (5th Generation) ; . Hard Disk Driver: 256GB SSD ; . Memory: 8GB DDR3 RAM ; . Operating System: Win 10 ; . Power Supply: DC 8A ; . Color: Full Black',
  477.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-A3-G5', TRUE, '{}'::text[], '{"Resolution": "1024*768", "Second Display": "N/A", "CPU": "Intel Core i5 (5th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR3 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-A3-G5.VFD', 'appostars-ap-a3-g5-vfd', 'Metal Stand (L3) & Metal Case , . 15.0" Capacitive True Flat Touch Screen | Resolution: 1024*768 ; . Second Display: VFD 2 lines ; . CPU: Intel Core i5 (5th Generation) ; . Hard Disk Driver: 256GB SSD ; . Memory: 8GB DDR3 RAM ; . Operating System: Win 10 ; . Power Supply: DC 8A ; . Color: Full Black',
  515.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-A3-G5.VFD', TRUE, '{}'::text[], '{"Resolution": "1024*768", "Second Display": "VFD 2 lines", "CPU": "Intel Core i5 (5th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR3 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-A3-G8', 'appostars-ap-a3-g8', 'Metal Stand (L3) & Metal Case , . 15.0" Capacitive True Flat Touch Screen | Resolution: 1024*768 ; . Second Display: VFD 2 lines ; . CPU: Intel Core i5 (8th Generation) ; . Hard Disk Driver: 128GB SSD ; . Memory: 8GB DDR4 RAM ; . Operating System: Win 10 ; . Power Supply: DC 6A ; . Color: Full Black',
  765.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-A3-G8', TRUE, '{}'::text[], '{"Resolution": "1024*768", "Second Display": "VFD 2 lines", "CPU": "Intel Core i5 (8th Generation)", "Hard Disk Driver": "128GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 10", "Power Supply": "DC 6A", "Color": "Full Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AP-F7-G10 ; NEW , Metal Case + L6-B Foldable Metal Stand , . 15.6" Capacitive Foldable Touch Screen | Resolution: 1366*768 ; . Second Display: 11.6" non-touch LCD | Resolution: 1366*768 ; . CPU: Intel Core i7 (10th Generation) ; . Hard Disk Driver: 256GB SSD ; . Memory: 8GB DDR4 RAM ; . Wi-Fi , Speaker built-in ; . Operating System: Win 11 ; . 1*LAN+1*COM+6*USB ; . Power Supply: DC 8A ; . Color: Full Black', 'appostars-ap-f7-g10-new-metal-case-l6-b-foldable-metal-stand-15-6-capacitive-fol', 'Resolution: 1366*768, Second Display: 11.6" non-touch LCD | Resolution: 1366*768, CPU: Intel Core i7 (10th Generation)',
  985.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, '{}'::text[], '{"Resolution": "1366*768", "Second Display": "11.6\" non-touch LCD | Resolution: 1366*768", "CPU": "Intel Core i7 (10th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 11", "Power Supply": "DC 8A", "Color": "Full Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AP-A6-G6-256 ; NEW , ; Metal Stand (L4) & Metal Case , . 18.5" Capacitive True Flat Touch Screen | Resolution: 1920*1080 ; . Second Display: 11.6" non-touch LCD | Resolution: 1366*768 ; . CPU: Intel Core i5 (6th Generation) ; . Hard Disk Driver: 256GB SSD ; . Memory: 8GB DDR4 RAM ; . Wi-Fi , Speaker ; . Operating System: Win 10 ; . Power Supply: DC 8A ; . Color: Full Black', 'appostars-ap-a6-g6-256-new-metal-stand-l4-metal-case-18-5-capacitive-true-flat-t', 'Resolution: 1920*1080, Second Display: 11.6" non-touch LCD | Resolution: 1366*768, CPU: Intel Core i5 (6th Generation)',
  745.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, '{}'::text[], '{"Resolution": "1920*1080", "Second Display": "11.6\" non-touch LCD | Resolution: 1366*768", "CPU": "Intel Core i5 (6th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 10", "Power Supply": "DC 8A", "Color": "Full Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AP-A6-G8-256 NEW , ; Metal Stand (L4) & Metal Case ; . 18.5" Capacitive True Flat Touch Screen | Resolution: 1920*1080 ; . Second Display: 11.6" non-touch LCD | Resolution: 1366*768 ; . CPU: Intel Core i5 (8th Generation) ; . Hard Disk Driver: 256GB SSD ; . Memory: 8GB DDR4 RAM ; . Wi-Fi , Speaker built-in ; . Operating System: Win 11 ; . Power Supply: DC 8A ; . Color: Full Black', 'appostars-ap-a6-g8-256-new-metal-stand-l4-metal-case-18-5-capacitive-true-flat-t', 'Resolution: 1920*1080, Second Display: 11.6" non-touch LCD | Resolution: 1366*768, CPU: Intel Core i5 (8th Generation)',
  815.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, '{}'::text[], '{"Resolution": "1920*1080", "Second Display": "11.6\" non-touch LCD | Resolution: 1366*768", "CPU": "Intel Core i5 (8th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 11", "Power Supply": "DC 8A", "Color": "Full Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AP-3069-G8 ; NEW , ; Metal Stand (L10) & Plastic Case , . 21.5" Capacitive True Flat Touch Screen | Resolution: 1920*1080 ; . Second Display: N/A ; . CPU: Intel Core i5 (8th Generation) ; . Hard Disk Driver: 256GB SSD ; . Memory: 8GB DDR4 RAM ; . Wi-Fi , Speaker built-in ; . Operating System: Win 11 ; . Power Supply: DC 8A ; . Color: Full Black', 'appostars-ap-3069-g8-new-metal-stand-l10-plastic-case-21-5-capacitive-true-flat-', 'Resolution: 1920*1080, Second Display: N/A, CPU: Intel Core i5 (8th Generation)',
  825.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, '{}'::text[], '{"Resolution": "1920*1080", "Second Display": "N/A", "CPU": "Intel Core i5 (8th Generation)", "Hard Disk Driver": "256GB SSD", "Memory": "8GB DDR4 RAM", "Operating System": "Win 11", "Power Supply": "DC 8A", "Color": "Full Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AP-X4-I3 ; NEW , . Price Checker 11.6" Capacitive Touch LED Screen | Resolution: 1366*768 ; .With 2D Scanner + Bluetooth + WiFi ; . CPU: Intel Core i3 (3rd Generation) ; . Storage: 128GB SSD ; . Memory: 4GB DDR3 RAM ; . Operating System: Win 10 ; . Power Supply: DC 6A ; . Wall-mounted Bracket', 'appostars-ap-x4-i3-new-price-checker-11-6-capacitive-touch-led-screen-resolution', 'Resolution: 1366*768, CPU: Intel Core i3 (3rd Generation), Storage: 128GB SSD',
  465.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, NULL, TRUE, '{}'::text[], '{"Resolution": "1366*768", "CPU": "Intel Core i3 (3rd Generation)", "Storage": "128GB SSD", "Memory": "4GB DDR3 RAM", "Operating System": "Win 10", "Power Supply": "DC 6A"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-8360', 'appostars-ap-8360', '. Thermal Receipt Printer with auto cutter ; . Width: 80mm ; . Printing Speed: 220mm/sec ; . Interface: USB + LAN ; . Color: Black with Orange',
  65.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-8360', TRUE, '{}'::text[], '{"Width": "80mm", "Printing Speed": "220mm/sec", "Interface": "USB + LAN", "Color": "Black with Orange"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-8256', 'appostars-ap-8256', '. Thermal Receipt Printer with auto cutter ; . Printing Speed: 250mm/sec ; . Width: 80mm ; . Life of printing head: 100km ; . Interface: USB + LAN ; . Color: Black',
  90.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-8256', TRUE, '{}'::text[], '{"Printing Speed": "250mm/sec", "Width": "80mm", "Life Of Printing Head": "100km", "Interface": "USB + LAN", "Color": "Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-8258', 'appostars-ap-8258', '. Thermal Receipt Printer with auto cutter ; . Printing Speed: 260mm/sec ; . Width: 80mm ; . Life of printing head: 100km ; . Interface: USB + LAN ; . Color: Grey',
  95.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-8258', TRUE, '{}'::text[], '{"Printing Speed": "260mm/sec", "Width": "80mm", "Life Of Printing Head": "100km", "Interface": "USB + LAN", "Color": "Grey"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-8060', 'appostars-ap-8060', '. Portable Bluetooth 2.0 Thermal Receipt Printer, lithium 1500mAh Battery ; . Width: 80mm ; . Printing Speed: 3-5 IN/sec ; . Power Supply: DC 9V/1A ; . Support Android & iOS ; . Interface: USB ; . Color: Black',
  95.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-8060', TRUE, '{}'::text[], '{"Width": "80mm", "Printing Speed": "3-5 IN/sec", "Power Supply": "DC 9V/1A", "Interface": "USB", "Color": "Black"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-9210', 'appostars-ap-9210', '. Direct Line Thermal Label Printer ; . Effective Print Width: 100mm (Max 800 points) ; . Pirnting Speed: 160mm/sec (MAX) ; . Resolution: 203DPI (8dot/mm) ; . Interface: USB ; . Color: Grey',
  95.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-9210', TRUE, '{}'::text[], '{"Effective Print Width": "100mm (Max 800 points)", "Pirnting Speed": "160mm/sec (MAX)", "Resolution": "203DPI (8dot/mm)", "Interface": "USB", "Color": "Grey"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-405A', 'appostars-ap-405a', '. 4B5C Cash Drawer (RJ11) , 6.0kgs ; . 2 Check Slots | 3 Position Lock ; . Black Color ; . Pulse Amplitude: 12V DC ; . Size: 405(W)×420(L)×100(H)mm ; Buy 10x Get One FREE!',
  49.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-405A', TRUE, '{}'::text[], '{"Pulse Amplitude": "12V DC", "Size": "405(W)×420(L)×100(H)mm"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-460', 'appostars-ap-460', '. 5B5C Heavy Duty Cash Drawer (RJ11) , 11kgs ; . 2 Check Slots | 3 Position Lock ; . Bill Width: 74/86/70/86/76mm(Adjustble) ; . Bill Length: 185mm ; . Coin size: 69/85/69/85/74mm(Adjustble) ; . Coin Length: 112mm ; . Size: 460(W)×460(L)×115(H)mm ; . Black Color',
  90.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-460', TRUE, '{}'::text[], '{"Bill Width": "74/86/70/86/76mm(Adjustble)", "Bill Length": "185mm", "Coin Size": "69/85/69/85/74mm(Adjustble)", "Coin Length": "112mm", "Size": "460(W)×460(L)×115(H)mm"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-9400', 'appostars-ap-9400', '. Barcode Scanner 2D Wired ; . Support 2D & 1D ; . Image:800*600 pixels ; . 1.2G CPU ; . Resolution(maximum): 3mils ; . USB port (Support Virtual COM Port) | With Stand ; . Depth of Field : EAN-13 (13.34mil) 20mm—190mm',
  52.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-9400', TRUE, '{}'::text[], '{"Image": "800*600 pixels", "Depth Of Field": "EAN-13 (13.34mil) 20mm—190mm"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-9520SR', 'appostars-ap-9520sr', '. Barcode Scanner 2D Wired ; . Support 2D & 1D ; . Image: 1280*800 pixels ; . 1.2G Dual Core CPU ; . Resolution(maximum): 4mils ; . USB port (Support Virtual COM Port) | With Stand ; . Depth of Field: UPC-A (13mil) 40mm—450mm',
  72.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-9520SR', TRUE, '{}'::text[], '{"Image": "1280*800 pixels", "Depth Of Field": "UPC-A (13mil) 40mm—450mm"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-A80', 'appostars-ap-a80', '. Orbit Barcode Scanner 2D Desktop ; . Resolution: ≧50.102mm / 4 mils ; . Image: 640*480 pixels Global Shutter ; . 1G CPU ; . USB Port ; . Depth of Field : UPC-A (13mil) 0mm - 150mm',
  92.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-A80', TRUE, '{}'::text[], '{"Resolution": "≧50.102mm / 4 mils", "Image": "640*480 pixels Global Shutter", "Depth Of Field": "UPC-A (13mil) 0mm - 150mm"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-9519', 'appostars-ap-9519', '. Barcode Scanner 2D Wireless ; . Support 2D & 1D ; . Image: 800*600 pixels ; . 1.2G Dual Core CPU ; . Resolution(maximum): 3mils ; . USB port (Support Virtual COM Port | With Stand ; . Depth of field 23cm',
  85.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-9519', TRUE, '{}'::text[], '{"Image": "800*600 pixels"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-9555HD', 'appostars-ap-9555hd', '. Barcode Scanner 2D Wireless ; . Support 2D & 1D ; . Image: 640*480 pixels Global Shutter ; . 1.2G Dual Core CPU ; . Resolution(maximum): 3mils ; . USB port (Support Virtual COM Port) | With Stand ; . Depth of Field : 23cm',
  95.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-9555HD', TRUE, '{}'::text[], '{"Image": "640*480 pixels Global Shutter", "Depth Of Field": "23cm"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-9533HD', 'appostars-ap-9533hd', '. Barcode Scanner 2D Wireless ; . LED White with stand ; . Support 2D & 1D ; . Image: 640*480 pixels Global Shutter ; . 1.2G Dual Core CPU ; . Resolution(maximum): 3mils ; . USB port (Support Virtual COM Port) | With Stand ; . Depth of Field : EAN-13 (13.34mil) 30mm—290mm ; . Base with one Key Pairing | One Key Searching Factory Default ; Settings Functions',
  135.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-9533HD', TRUE, '{}'::text[], '{"Image": "640*480 pixels Global Shutter", "Depth Of Field": "EAN-13 (13.34mil) 30mm—290mm"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-LED8N', 'appostars-ap-led8n', '. 8 Digits Customer Display With Pole and Stand ; . Interface: Serial + USB ; . Power Supply: USB ; . Communication Interface: Serial port',
  62.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-LED8N', TRUE, '{}'::text[], '{"Interface": "Serial + USB", "Power Supply": "USB", "Communication Interface": "Serial port"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-210CE', 'appostars-ap-210ce', '. Vacuum Fluorescent Customer Display With Pole and Stand ; . Interface: PS2 or USB ; . 40 (2 lines * 20 Columns) ; . 12 VDC / Approx. 6W ; . 226 (W) x 45 (D) x 85 (H) mm ; . Power Supply: USB & Serial port or USB only',
  85.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-210CE', TRUE, '{}'::text[], '{"Interface": "PS2 or USB", "Power Supply": "USB & Serial port or USB only"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-MSR-3', 'appostars-ap-msr-3', '. Magnetic Card Reader ; . Track 1 & 2 & 3 ; . USB port',
  65.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-MSR-3', TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-1536-FHD', 'appostars-ap-1536-fhd', '. 18.5" Capacitive TOUCH Monitor ; . Resolution: FHD 1920*1080 ; . Input Interface: HDMI, VGA, DC power adapter ; . Input Power: 12V, 3.0A ; . Screen Ratio: 16:9',
  238.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-1536-FHD', TRUE, '{}'::text[], '{"Resolution": "FHD 1920*1080", "Input Interface": "HDMI, VGA, DC power adapter", "Input Power": "12V, 3.0A", "Screen Ratio": "16:9"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-1533', 'appostars-ap-1533', '. 21.5" Capacitive TOUCH Monitor ; . Resolution: FHD 1920*1080 ; . Input Interface: HDMI, VGA, DC power adapter ; . Input Power: 12V, 3.0A ; . Screen Ratio: 16:9',
  285.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-1533', TRUE, '{}'::text[], '{"Resolution": "FHD 1920*1080", "Input Interface": "HDMI, VGA, DC power adapter", "Input Power": "12V, 3.0A", "Screen Ratio": "16:9"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'AppoStars AP-1561', 'appostars-ap-1561', '. 24.0" Capacitive TOUCH Monitor ; . Resolution: FHD 1920*1080 ; . Input Interface: HDMI, VGA, DC power adapter ; . Input Power: 12V, 3.0A ; . Screen Ratio: 16:9',
  329.0, (SELECT id FROM categories WHERE slug = 'pos-systems'), 5, 'AP-1561', TRUE, '{}'::text[], '{"Resolution": "FHD 1920*1080", "Input Interface": "HDMI, VGA, DC power adapter", "Input Power": "12V, 3.0A", "Screen Ratio": "16:9"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP PSC D2320 ; (Supplies: 305 Black,305 Color)', 'hp-psc-d2320-supplies-305-black-305-color', '3in1 Print, Scan, Copy, Speed 20ppm Black | 16ppm color, Res 1200x1200dpi Black/ 4800x1200dpi color, Scan Res 1200dpi, USB2.0, duty cycle 1000pages',
  65.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP PSC Ink Advantage 2875 ; (Supplies: 653 Black,653 Color)', 'hp-psc-ink-advantage-2875-supplies-653-black-653-color', '3in1, Print, Scan, Copy, speed 20ppm Black/16ppm color, Res 1200x1200dpi Black/ 4800x1200dpi color, Scan Res 1200dpi, Memory 86MB, Wireless, Airprint, USB2.0, duty cycle 1000pages',
  85.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'Deskjet Plus Ink Advantage 4276 ; (Supplies: 653 Black,653 Color)', 'hp-deskjet-plus-ink-advantage-4276-supplies-653-black-653-color', '4in1, Print, Scan, Copy, Mobile fax, speed 20ppm Black/16ppm color, Res 1200x1200dpi Black/ 4800x1200dpi color, Scan Res 1200dpi, ADF, Memory 64MB, Wireless, Airprint, USB2.0, duty cycle 1000pages',
  105.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP PSC 581 Smart Tank ; (Supplies: GT53 , GT52)', 'hp-psc-581-smart-tank-supplies-gt53-gt52', '3in1, Print, Scan, Copy, speed 22ppm Black/16ppm color, Res 1200x1200dpi Black / 4800x1200dpi Color, Scan Res 1200dpi, Flatbed, Wireless, Apple AirPrint; Mopria Print Service; HP Smart app; Wi-Fi Direct Printing, duty cycle 3000pages',
  185.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP PSC 530 Smart Tank ; (Supplies: GT53 , GT52)', 'hp-psc-530-smart-tank-supplies-gt53-gt52', '3in1, Print, Scan, Copy, speed 22ppm Black/16ppm color, Res 1200x1200dpi Black / 4800x1200dpi Color, Scan Res 1200dpi, Flatbed,ADF, Wireless, Bluetooth, Airprint, Memory 256MB; Wi-Fi Direct Printing, duty cycle 1000pages, 3 Black ink bottles in the box i.e. 18,000 pages , 3 years warranty upon registration',
  287.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Officejet 9730 A3 All in one ; (Supplies : 938 Black , 938 Color)', 'hp-officejet-9730-a3-all-in-one-supplies-938-black-938-color', '3in1 Print, Scan, Copy, Speed 34ppm Black / 34ppm Color, Res 1200x1200dpi Black/ 4800x1200dpi Color, Scan Res 1200dpi, A3 scanning Flatbed, A4 ADF Scanning, LCD touchscreen, Wireless, Network, Host USB, USB2.0, Airprint, 512MB Memory, duplex Print & Scan, 2 paper trays, Duty Cycle 30,000 pages',
  315.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Scanjet Pro 2600f1', 'hp-scanjet-pro-2600f1', 'Archiving Flatbed scanner, Res 600dpi ADF/1200 Flatbed, 25ppm/50 IPM, ; 60 Sheets ADF, Duplex, , 64MB Memory, USB2.0, Daily duty cycle 1500pages',
  295.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Scanjet Pro 3600f1', 'hp-scanjet-pro-3600f1', 'Archiving Flatbed Scanner,Res 600dpi ADF/1200 Flatbed, 30 ppm/60 IPM, ; 60 Sheet ADF, Duplex, Multifeed detection, 256MB Memory,USB3, ; Daily duty cycle 3,000pages',
  475.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Scanjet Pro 3000s4', 'hp-scanjet-pro-3000s4', 'Sheet-feed Scanner, Res 600dpi Optical, 40ppm/80 IMP, 50 Sheet ADF, ; Duplex, Multifeed detection, 256MB Memory, USB3 ,Daily duty cycle 4000pages',
  492.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ScanJet Enterprise Flow 5000s5', 'hp-scanjet-enterprise-flow-5000s5', 'Enterprise Flow Scanner, Res 600dpi Optical, 65 ppm/130 IPM, 80 Sheet ADF, Sheetfed, Duplex, USB3 , Daily duty cycle 7500pages',
  865.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'ScanJet Enterprise Flow 7000s3', 'hp-scanjet-enterprise-flow-7000s3', 'Enterprise Flow Scanner, Res 600dpi Optical, 75 ppm/150 IPM, 80 Sheet ADF, Sheetfed, Duplex, USB3 , Daily duty cycle 7500pages',
  985.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet M111a ; (Supplies : W1500A)', 'hp-laserjet-m111a-supplies-w1500a', '20ppm 600*600dpi, 16MB Memory ,Duty cycle 8,000 Pages, USB',
  148.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet M111w ; (Supplies : W1500A)', 'hp-laserjet-m111w-supplies-w1500a', '20ppm 600*600dpi, Wireless, 32MB Memory ,Duty cycle 8,000 Pages, USB ; HP Smart App; Apple AirPrint; Wi-Fi Direct printing; Mopria Certified',
  168.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet Pro 4003n ; (Supplies : W1510A)', 'hp-laserjet-pro-4003n-supplies-w1510a', '40ppm, Res 1200dpi, 1200MHz processor, 256MB Memory, Network, Airprint, ; Host USB, USB2.0, Duty Cycle 80,000 pages',
  265.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet Pro 4003dn ; (Supplies : W1510A)', 'hp-laserjet-pro-4003dn-supplies-w1510a', '40ppm, Res 1200dpi, 1200MHz processor, 256MB Memory, Duplex, Network, Airprint, Host USB, USB2.0, Duty Cycle 80,000 pages',
  278.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet Pro 4003dW ; (Supplies : W1510A)', 'hp-laserjet-pro-4003dw-supplies-w1510a', '40ppm, Res 1200dpi, 1200MHz processor, 256MB Memory, Duplex, WI-FI, Network, Airprint, Host USB, USB2.0, Duty Cycle 80,000 pages',
  288.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet Pro 501dn ; (Supplies : CF287A)', 'hp-laserjet-pro-501dn-supplies-cf287a', '45ppm, Res 600dpi, 1500MHz processor, 256MB Memory, Duplex, Network, E-print, Airprint, Host USB, USB2.0, 2-line LCD, Duty Cycle 100,000 pages',
  415.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ 150NW ; Supplies:W2070A', 'hp-clj-150nw-supplies-w2070a', 'W2071A,W2072A,W2073A , 18ppm Black & 4ppm Color, Res 600x600dpi, 64MB Memory, 400MHz processor, USB2.0, Airprint, Wi-Fi Direct ,Wireless, Network, Duty Cycle 20,000 pages',
  398.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ Pro 3203dw ; Supplies:W2220A', 'hp-clj-pro-3203dw-supplies-w2220a', 'W2221A,W2222A,W2223A , 25ppm Black/Color, Res 600x600dpi, 256MB Memory, Network, Duplex, Wireless, Airprint, 2" MGD display, USB2.0, Duty Cycle 40,000 pages',
  348.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ Pro 4203dw ; Supplies:W2300A', 'hp-clj-pro-4203dw-supplies-w2300a', 'W2301A,W2302A,W2303A , 33ppm Black/Color, Res 600x600dpi, 1.2GHz Processor , 512MB Memory,4-line LCD, Duplex, Network, Dual-band WiFi, Bluetooth LE, WiFi Direct, ; Duty Cycle 50,000pages',
  392.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ 5225N A3 ; Supplies : CE740A', 'hp-clj-5225n-a3-supplies-ce740a', 'CE741A, CE742A, CE743A , 20ppm Black & Color, Res 600x600dpi, 192MB Memory, 540MHz processor, USB2.0, Network, Paper Format: A3, Duty Cycle 75,000 pages',
  1275.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{"Paper Format": "A3, Duty Cycle 75,000 pages"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ 5225DN A3 ; Supplies : CE740A', 'hp-clj-5225dn-a3-supplies-ce740a', 'CE741A, CE742A, CE743A , 20ppm Black & Color, Res 600x600dpi, 192MB Memory, 540MHz processor, USB2.0, Duplex, Network, Paper Format: A3, Duty Cycle 75,000 pages',
  1345.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{"Paper Format": "A3, Duty Cycle 75,000 pages"}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet MFP M141a ; (Supplies : W1500A)', 'hp-laserjet-mfp-m141a-supplies-w1500a', '3in1, print, scan, copy, speed 20ppm, Res 600dpi, 64MB Memory, Flatbed, USB2.0, Duty Cycle 8,000pages',
  178.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet MFP M141W ; (Supplies : W1500A)', 'hp-laserjet-mfp-m141w-supplies-w1500a', '3in1, print, scan, copy, speed 20ppm, Res 600dpi, 64MB Memory, Flatbed, USB2.0, Wireless, Apple AirPrint, Duty Cycle 8,000pages',
  198.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet M137fnw mfp ; (Supplies : W1106A)', 'hp-laserjet-m137fnw-mfp-supplies-w1106a', '4in1,printer-scanner-copier -Fax -20 ppm-600dpi-ADF-128MB-Flatbed- ; Wireless , Network,Apple AirPrint, Google Cloud Print, Mobile Apps; Wi-Fi Direct Printing, -10,000 pages per month',
  272.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet M236SDW mfp ; (Supplies : W1360A)', 'hp-laserjet-m236sdw-mfp-supplies-w1360a', '3in1, print, scan, copy, Speed 29ppm, Res 600dpi, 500MHz processor, 64MB Memory, ADF, Apple AirPrint; HP Smart App; Mopria Certified; Wi-Fi Direct Printing Wireless, duplex Print, Network, USB2.0, Duty Cycle 20,000 pages',
  288.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet 4103dw mfp ; (Supplies : W1510A)', 'hp-laserjet-4103dw-mfp-supplies-w1510a', '3in1, print, scan, copy, Speed 40ppm, Res 1200dpi, 1.2GHz processor, 512MB Memory, ADF, HP Smart App; Apple AirPrint; Mopria Certified; Wi-Fi Direct Printing Wireless, duplex Print & Scan, Network, host USB, USB2.0, Duty Cycle 80,000 pages',
  432.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP Laserjet M4103fdw mfp ; (Supplies : W1510A)', 'hp-laserjet-m4103fdw-mfp-supplies-w1510a', '4in1, print, scan, copy, Fax Speed 40ppm, Res 1200dpi, 1.2GHz processor, 512MB Memory, ADF, HP Smart App; Apple AirPrint; Mopria Certified; Wi-Fi Direct Printing Wireless, duplex Print & Scan, Network, host USB, USB2.0, Duty Cycle 80,000 pages',
  480.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ Pro MFP M178nw ; Supplies:W2070A', 'hp-clj-pro-mfp-m178nw-supplies-w2070a', 'W2071A,W2072A,W2073A , 3in1 Print, Scan ,Copy, speed 18ppm Black & 4ppm Color, Res 600dpi, ; Scan Res 4800dpi, 800MHz Processor, 128MB Memory , USB2.0, Flatbed, ; Wireless ,Network, Smart App, Airprint, WIFI Direct , Duty Cycle 20,000 pages',
  380.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ Pro MFP M179fnw ; Supplies:W2070A', 'hp-clj-pro-mfp-m179fnw-supplies-w2070a', 'W2071A,W2072A,W2073A , 4in1 Print, Scan ,Copy, Fax speed 18ppm Black & 4ppm Color, Res 600dpi, ; Scan Res 4800dpi, 800MHz Processor, 128MB Memory , USB2.0, Flatbed, ADF ; Wireless ,Network, Smart App, Airprint, WIFI Direct , Duty Cycle 20,000 pages',
  398.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ Pro MFP 3303sdw ; Supplies:W2220A', 'hp-clj-pro-mfp-3303sdw-supplies-w2220a', 'W2221A,W2222A,W2223A , 3in1, Print, scan, copy, Speed 25ppm Black & Color,Print Res 600dpi,scan Res 1200dpi, 1.2GHz processor, 512MB Memory, Flatbed, ADF, Wireless, Network ; Duplex Print, Airprint, USB2.0, Duty Cycle 40,000 pages',
  498.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ Pro MFP 3303fdw ; Supplies:W2220A', 'hp-clj-pro-mfp-3303fdw-supplies-w2220a', 'W2221A,W2222A,W2223A , 4in1, Print, scan, copy,FAX Speed 25ppm Black & Color,Print Res 600dpi,scan Res 1200dpi, 1.2GHz processor, 512MB Memory, Flatbed, ADF, Wireless, Network ; Duplex Print & Scann , Airprint, USB2.0, Duty Cycle 40,000 pages',
  525.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ Pro MFP 4303DW ; Supplies: W2300A', 'hp-clj-pro-mfp-4303dw-supplies-w2300a', 'W2301A,W2302A,W2303A , 3in1, print, scan, copy, Speed 33ppm Black & Color, Print res 600dpi, Scan res 1200dpi, 1200MHz processor, 512MB Memory, 4.3” diagonal WLED-backlit anti-glare, Flatbed, Duplex Print, ADF,Network, dual-band Wi-Fi (Wi-Fi 5), HP Smart App; Apple AirPrint; Mopria Certified; Wi-Fi Direct Printing; HP Smart App and other mobile Apps, USB2.0, Duty Cycle 50,000 pages',
  528.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'HP CLJ Pro MFP 4303FDW ; Supplies: W2300A', 'hp-clj-pro-mfp-4303fdw-supplies-w2300a', 'W2301A,W2302A,W2303A , 4in1, print, scan, copy,FAX Speed 33ppm Black & Color, Print res 600dpi, Scan res 1200dpi, 1200MHz processor, 512MB Memory, 4.3” diagonal WLED-backlit anti-glare, Flatbed, Duplex Print & SCAN , ADF,WIFI, Network, Apple AirPrint; HP app and other mobile Apps; Mopria certified; , USB2.0, Duty Cycle 50,000 pages',
  578.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON Pixma MG2541S ; (INK 445BK - 446 CLR)', 'canon-pixma-mg2541s-ink-445bk-446-clr', '3in1 Inkjet, print, scan, copy, Speed 8 ipm Black | 4.0 ipm color, Res. 4800dpi',
  65.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON Pixma G3410 Ink Tank ; (INK GI-490 BK|C|M|Y)', 'canon-pixma-g3410-ink-tank-ink-gi-490-bk-c-m-y', '3in1, print, scan, copy, Speed 8.8 ipm black | 5.0 ipm color, Res. 4800dpi ; WiFi, Flatbed, Cloud Link',
  178.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON Pixma G4470 Ink Tank ; (INK GI-41 PGBK|C|M|Y)', 'canon-pixma-g4470-ink-tank-ink-gi-41-pgbk-c-m-y', '4in1 print, scan, copy, fax, Speed 110.0 ipm black | 6.0 ipm color, Res. 4800dpi ; WiFi, ADF, Flatbed, Cloud Link, Apple AirPrint, Mopria (Android)',
  315.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON LJ LBP 6030 ; (Toner Canon 725 or HP CE285A)', 'canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a', 'imageCLASS Mono Laserjet A4, Speed 18ppm, Res. 600dpi White Color ; Duty Cycle 5,000 pages/month',
  158.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON LJ LBP 6030 ; (Toner Canon 725 or HP CE285A)', 'canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a-2', 'i-SENSYS Mono Laserjet A4, Speed 18ppm, Res. 600dpi Black Color ; Duty Cycle 5,000 pages/month',
  165.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON LJ LBP236DW ; (Toner Canon 057)', 'canon-lj-lbp236dw-toner-canon-057', 'i-SENSYS Mono Laserjet A4, Speed 38ppm, Res. 1200dpi ; WiFi, Duplex, Network, Duty Cycle 80,000 pages/month',
  260.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON MFP MF3010 ; (Toner Canon 725 or HP CE285A)', 'canon-mfp-mf3010-toner-canon-725-or-hp-ce285a', 'i-SENSYS 3in1 print, scan, copy, Mono Laserjet A4, Speed 18ppm, Res. 600dpi ; Flatbed, Duty Cycle 8,000 pages/month',
  260.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON MFP MF275DW ; (Toner Canon 071)', 'canon-mfp-mf275dw-toner-canon-071', 'i-SENSYS 4in1 print, scan, copy, fax, Mono Laserjet A4, Speed 29ppm, Res. 2400dpi ; Flatbed, ADF, Duplex, WiFi, Duty Cycle 20,000 pages/month',
  355.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON CLJ LBP646CDW ; (Toner Canon 075 BK|C|M|Y)', 'canon-clj-lbp646cdw-toner-canon-075-bk-c-m-y', 'Color Laserjet A4, Speed 25PM, Res. 1200dpi, 5 Line LCD, 1GB Mem,Duplex,Secure PIN print,WiFi, Network, Wireless Direct Connection, Apple AirPrint, Mopria (Android), Print from USB memory key , Duty Cycle 30,000 pages/month',
  315.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON CLJ MF657CDW ; (Toner Canon 067 BK|C|M|Y)', 'canon-clj-mf657cdw-toner-canon-067-bk-c-m-y', '4in1 print, scan, copy,fax Color Laserjet A4, Speed 21ppm, Res. 1200dpi ; WiFi, Duplex, ADF, Flatbed, Cloud Link, Apple AirPrint, Mopria (Android) ; Duty Cycle 30,000 pages/month, Memory 1GB',
  475.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON CLJ MF752CDW ; (Toner Canon 069 BK|C|M|Y)', 'canon-clj-mf752cdw-toner-canon-069-bk-c-m-y', '3in1 print, scan, copy, Color Laserjet A4, Speed 33ppm, Res. 1200dpi ; WiFi, Duplex, ADF, Flatbed, Cloud Link, Apple AirPrint, Mopria (Android) ; Duty Cycle 50,000 pages/month, Memory 1GB',
  545.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON Scanner LIDE 300', 'canon-scanner-lide-300', 'Scan 2400dpi, Speed 10 seconds Scan-to-cloud, USB Powered (1 YR.W)',
  105.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;
INSERT INTO products (name, slug, description, price, primary_category_id, stock, sku, is_active, images, specs) VALUES (
  'CANON Scanner LIDE 400', 'canon-scanner-lide-400', 'Scan 4800dpi, Speed 8 seconds Scan-to-cloud, USB Powered (1 YR.W)',
  128.0, (SELECT id FROM categories WHERE slug = 'printing'), 5, NULL, TRUE, '{}'::text[], '{}'::jsonb
) ON CONFLICT (slug) DO UPDATE SET is_active = TRUE, price = EXCLUDED.price, stock = EXCLUDED.stock;

-- Product <-> brand tag links
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-rog-strix-scar-edition-18-g835lx-s9113' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-285h-rtx-5090-24gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5080-16gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070ti-12gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070ti-12gb-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-ai-max-395-amd-radeon-8060s' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-ai-max-395-amd-radeon-8060s-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-7-260-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-snapdragon-x-plus-x1p-42-100-3-4-ghz' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-285h-rtx5070-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-9-365-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-7-255h-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5080-16gb-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i9-14900hx-rtx-5070-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i7-13650hx-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i7-14700hx-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i7-13650hx-rtx-5050-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i7-13650hx-rtx-5050-8gb-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-7-250-8-cores-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i7-13650hx-rtx-3050-6gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-5-7235hs-rtx-4050-6gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-z1-extreme-8-cores-amd-radeon' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i5-13450hx-rtx-3050-6gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-285hx-rtx-5070ti-ddr7-12gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070ti-ddr7-12gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i7-14650hx-rtx-5060-ddr7-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i7-14650hx-rtx-5050-ddr7-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-7-240h-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-9-270h' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-amd-ryzen-5-7535hs-rtx-4050-6gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-gaming-laptop-core-ultra-7-155u' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-7-series-2-240h-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb-3' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-gaming-laptop-core-i9-13900h-rtx-5060-8gb' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-yoga-7-aura-edition-15ill9-83hm002wus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-5-2-in-1-16-83ks001bus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-yoga-7-16ahp9-83dm0006us' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim-3-15iph11-83ur0042dp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v14-g5-irl-83hda06jus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-g5-irl-83hfa08gus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim-3-15irh10-83k100e7dp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-g5-irl-83hf00emig' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim-3-15iph11-83ur007rdp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-5-2-in-1-14ial10-14ial10-83kr0047us' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim-3-15abr8-82xm00lmus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim-3-15irh10-83k100c1dp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ip1-15iru7-83b40001us' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-g5-irl-83gw006aeq' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-g5-irl-83hf00e6ig' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-g5-irl-83gw006xue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-g5-irl-83gw006xgp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ip1-15iru7-83b40008us' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim-3-15irh10-83k100e9ax' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ip1-15amn7-82vg00wxus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-g5-irl-83gw0076ue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-v15-g5-irl-83gw0076gp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim-3-14iru8-82x60062in' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim-3-15iru8-82x700dfdp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-ideapad-slim-3-15ian8-82xb00g3dp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('dell') WHERE p.slug = 'dell-ldb04250-7137blu-pus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('dell') WHERE p.slug = 'dell-inspiron-i5640-7609blu-pus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('dell') WHERE p.slug = 'dell-plus-ld15260-7140blk-pus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('dell') WHERE p.slug = 'dell-inspiron-i7440-5647blu-pus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-vivobook-s16-s5606ca-sb92' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-vivobook-flip-14-tp3407sa-ds74t' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-vivobook-f1605va-bs74' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-vivobook-x1404va-i712512' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-vivobook-14-x1404vap-v14-c58256' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-omnibook-7-flip-16-au0773cl' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-omnibook-7-16-az0595cl' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-omnibook-x-ngai-17-dd0047nr' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-omnibook-5-16-ag1075cl' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-omnibook-5-16-af1017wm' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-omnibook-5-16-ag1175cl' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-omnibook-5-16-af1055cl' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-probook-4-g1i-16-at7k5av' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-17-cn5085cl' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0127dx' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd1899nr' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0215dx' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-17-cp2025dx' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-250r-g9-b39zcat' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-14-ep2035cl' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0130wm' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0153dx' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-15-fd0133wm' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('acer') WHERE p.slug = 'acer-aspire-14-ai-a14-52mt-94h5' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('acer') WHERE p.slug = 'acer-aspire-14-ai-a14-52m-72fh' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('microsoft') WHERE p.slug = 'microsoft-surface-laptop-zhi-00001' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-x1-gen-10-aura-edition-2-in-1' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-x9-15-gen-1-aura-edition-21q6006rus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-x9-14-gen-1-aura-edition-21qa0036us' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-t14s-g6' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-t14-g6' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-t14-g6-21qg00aped' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-t14-g6-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-e16-gen-3' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-t14-gen-6-21qds3sl00' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-l14-gen-6-21s6003pus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-e16-gen-3-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-e14-gen-7-21sx0070ed' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-e14-gen-7-21sx001tgq' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-e14-gen-7-21t90053ed' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-e16-gen-3-21st0014ed' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-e16-gen-3-21tf005bed' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-e16-gen-3-3' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkpad-e14-gen-7' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkbook-16-g8-ial-21sk0030gp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkbook-14-g8-ial-21sj0001gq' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkbook-16-g8-ial-21sk0027gp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkbook-16-g9-irl-21us002xed' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkcenter-m70t-gen-5-12u60046gp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-tiny-thinkcenter-neo-50q-13b9004uex' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkcenter-neo-50t-13bd001wex' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkcenter-neo-50t-13bd002wex' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-tiny-thinkcenter-neo-50q-13hr000pex' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-tiny-thinkcenter-neo-50q-13b9004sex' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkcenter-neo-50t-gen-5-12ud00c2gp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-tiny-thinkcenter-m80q-gen-4-12eas2kn00' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-aio-am242tp-1m-839us' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('dell') WHERE p.slug = 'dell-aio-24-dec24250-7482wht-pus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkcentre-aio-neo-50a-24-g6-13qg0016ex' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-thinkcentre-aio-neo-50a-24-g5-12sc00anex' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-16-m5-max-48gb-2tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-16-m5-max-36gb-2tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-max-36gb-2tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-max-36gb-2tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-16-m5-pro-48gb-1tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-16-m5-pro-48gb-1tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-16-m5-pro-24gb-1tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-pro-24gb-2tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-pro-24gb-1tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-pro-24gb-1tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-32gb-1tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-32gb-1tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-24gb-1tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-24gb-1tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-16gb-1tb-ssd-space-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-pro-14-m5-16gb-1tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-midnight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-starlight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-24gb-1tb-ssd-skyblue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-16gb-1tb-ssd-skyblue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-16gb-1tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-16gb-1tb-ssd-midnight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-24gb-1tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-24gb-1tb-ssd-midnight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-midnight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-skyblue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-16gb-1tb-ssd-starlight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-starlight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-skyblue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-15-3-m5-16gb-512gb-ssd-midnight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-skyblue' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-starlight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-midnight' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-13-6-m5-16gb-512gb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-neo-13-a18-pro-8gb-512gb-ssd-citrus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-neo-13-a18-pro-8gb-512gb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-neo-13-a18-pro-8gb-512gb-ssd-indigo' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-neo-13-a18-pro-8gb-256gb-ssd-indigo' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-neo-13-a18-pro-8gb-256gb-ssd-citrus' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-neo-13-a18-pro-8gb-256gb-ssd-blush' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-neo-13-a18-pro-8gb-256gb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-m4-16gb-512gb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-macbook-air-m4-16gb-256gb-ssd-silver' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-airpods-max-2-over-ear-wireless-up-to-20-hours-with-active-noise-cancellat' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-magic-mouse-multi-touch-surface-usb-c-charge-cable' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('apple') WHERE p.slug = 'apple-magic-mouse-multi-touch-surface-usb-c-charge-cable-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('seagate') WHERE p.slug = 'seagate-one-touch-hub-20tb-external-hard-drive' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('seagate') WHERE p.slug = 'seagate-one-touch-hub-16tb-external-hard-drive' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('seagate') WHERE p.slug = 'seagate-one-touch-hub-12tb-external-hard-drive' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('seagate') WHERE p.slug = 'seagate-one-touch-hub-8tb-external-hard-drive' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('seagate') WHERE p.slug = 'seagate-4tb-expansion-portable-usb-3-0-external-hard-drive' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('seagate') WHERE p.slug = 'seagate-2tb-expansion-portable-usb-3-0-external-hard-drive' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('seagate') WHERE p.slug = 'seagate-96000-mah' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('seagate') WHERE p.slug = 'seagate-30000-mah' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('seagate') WHERE p.slug = 'seagate-24000-mah' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-3j122aa-pen-rechargeable-type-c' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-410-slim-silver-bluetooth-mouse' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-legion-15-6-recon-gaming-backpack' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-legion-active-gaming-backpack' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-cn600gl-70-targus-backpack-15-6-cn600-classic-black' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-15-6-inch-laptop-urban-sleeve-case' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-65w-standard-ac-adapter-usb-type-c-uk-plug' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-510-wireless-combo-keyboard-and-mouse' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lenovo') WHERE p.slug = 'lenovo-150-wireless-mouse-with-battery' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('epson') WHERE p.slug = 'epson-tm-t20x-051-thermal-receipt-printer' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('epson') WHERE p.slug = 'epson-tm-t20x-052-thermal-receipt-printer' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('epson') WHERE p.slug = 'epson-tm-t20iii-011-thermal-receipt-printer' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('epson') WHERE p.slug = 'epson-tm-t20iii-012-thermal-receipt-printer' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('epson') WHERE p.slug = 'epson-tm-m30ii-122-thermal-receipt-printer' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('epson') WHERE p.slug = 'epson-tm-m30ii-112-thermal-receipt-printer' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('epson') WHERE p.slug = 'epson-printer-lq-350-dot-matrix-a4-24-pins' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('epson') WHERE p.slug = 'epson-printer-lq-690ii-dot-matrix-a4-24-pins-flat-bed' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('samsung') WHERE p.slug = 'samsung-22-samsung-monitor-s3-100hz-d-sub' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lg') WHERE p.slug = 'lg-24-lg-ips-borderless-120hz-d-sub' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('asus') WHERE p.slug = 'asus-24-asus-ips-monitor-120hz-1ms' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-24-msi-ips-monitor-pivot-mp245pg-100hz-1ms-multimedia-dp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-24-msi-ips-monitor-pivot-mp245pg-e2-144hz-1ms-multimedia-dp' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-25-msi-ips-gaming-monitor-g255pf-e2-180hz-1ms-multimedia-2-hdmi' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-25-msi-ips-gaming-monitor-255xf-ai-vision-300hz-0-5ms-2-hdmi' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('samsung') WHERE p.slug = 'samsung-27-samsung-monitor-s3-100hz-d-sub' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('samsung') WHERE p.slug = 'samsung-27-samsung-curved-monitor-s3-100hz-d-sub' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lg') WHERE p.slug = 'lg-27-lg-ips-borderless-120hz-d-sub' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-27-msi-ips-gaming-fhd-144hz-1ms-multimedia-usb-c' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('msi') WHERE p.slug = 'msi-27-msi-curved-gaming-wqhd-180hz-0-5ms-2-hdmi' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('lg') WHERE p.slug = 'lg-32-lg-ultragear-2k-qhd-curved-gaming-180hz' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('optoma') WHERE p.slug = 'optoma-projector-4000-lumns-xga' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-t3-g4' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-t3-g6' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-t3-g6-vfd' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-optional-ap-11-6t-pos-system-part-11-6-touch-lcd-resolution-1366-768-f' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-a3-g5' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-a3-g5-vfd' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-a3-g8' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-f7-g10-new-metal-case-l6-b-foldable-metal-stand-15-6-capacitive-fol' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-a6-g6-256-new-metal-stand-l4-metal-case-18-5-capacitive-true-flat-t' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-a6-g8-256-new-metal-stand-l4-metal-case-18-5-capacitive-true-flat-t' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-3069-g8-new-metal-stand-l10-plastic-case-21-5-capacitive-true-flat-' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-x4-i3-new-price-checker-11-6-capacitive-touch-led-screen-resolution' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-8360' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-8256' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-8258' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-8060' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-9210' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-405a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-460' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-9400' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-9520sr' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-a80' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-9519' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-9555hd' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-9533hd' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-led8n' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-210ce' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-msr-3' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-1536-fhd' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-1533' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('appostars') WHERE p.slug = 'appostars-ap-1561' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-psc-d2320-supplies-305-black-305-color' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-psc-ink-advantage-2875-supplies-653-black-653-color' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-deskjet-plus-ink-advantage-4276-supplies-653-black-653-color' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-psc-581-smart-tank-supplies-gt53-gt52' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-psc-530-smart-tank-supplies-gt53-gt52' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-officejet-9730-a3-all-in-one-supplies-938-black-938-color' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-scanjet-pro-2600f1' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-scanjet-pro-3600f1' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-scanjet-pro-3000s4' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-scanjet-enterprise-flow-5000s5' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-scanjet-enterprise-flow-7000s3' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-m111a-supplies-w1500a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-m111w-supplies-w1500a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-pro-4003n-supplies-w1510a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-pro-4003dn-supplies-w1510a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-pro-4003dw-supplies-w1510a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-pro-501dn-supplies-cf287a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-150nw-supplies-w2070a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-pro-3203dw-supplies-w2220a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-pro-4203dw-supplies-w2300a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-5225n-a3-supplies-ce740a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-5225dn-a3-supplies-ce740a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-mfp-m141a-supplies-w1500a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-mfp-m141w-supplies-w1500a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-m137fnw-mfp-supplies-w1106a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-m236sdw-mfp-supplies-w1360a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-4103dw-mfp-supplies-w1510a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-laserjet-m4103fdw-mfp-supplies-w1510a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-pro-mfp-m178nw-supplies-w2070a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-pro-mfp-m179fnw-supplies-w2070a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-pro-mfp-3303sdw-supplies-w2220a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-pro-mfp-3303fdw-supplies-w2220a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-pro-mfp-4303dw-supplies-w2300a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('hp') WHERE p.slug = 'hp-clj-pro-mfp-4303fdw-supplies-w2300a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-pixma-mg2541s-ink-445bk-446-clr' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-pixma-g3410-ink-tank-ink-gi-490-bk-c-m-y' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-pixma-g4470-ink-tank-ink-gi-41-pgbk-c-m-y' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-lj-lbp-6030-toner-canon-725-or-hp-ce285a-2' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-lj-lbp236dw-toner-canon-057' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-mfp-mf3010-toner-canon-725-or-hp-ce285a' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-mfp-mf275dw-toner-canon-071' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-clj-lbp646cdw-toner-canon-075-bk-c-m-y' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-clj-mf657cdw-toner-canon-067-bk-c-m-y' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-clj-mf752cdw-toner-canon-069-bk-c-m-y' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-scanner-lide-300' ON CONFLICT DO NOTHING;
INSERT INTO product_tags (product_id, tag_id) SELECT p.id, t.id FROM products p JOIN tags t ON t.slug IN ('canon') WHERE p.slug = 'canon-scanner-lide-400' ON CONFLICT DO NOTHING;
