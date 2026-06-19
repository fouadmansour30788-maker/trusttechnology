-- Trust Technology – Initial Schema

CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  parent_id UUID REFERENCES categories(id),
  description TEXT,
  image_url TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE tags (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('brand', 'use_case', 'type')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  compare_at_price DECIMAL(10,2),
  primary_category_id UUID REFERENCES categories(id),
  images TEXT[] DEFAULT '{}',
  stock INTEGER DEFAULT 0,
  sku TEXT UNIQUE,
  is_active BOOLEAN DEFAULT TRUE,
  is_featured BOOLEAN DEFAULT FALSE,
  specs JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE product_tags (
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  tag_id UUID REFERENCES tags(id) ON DELETE CASCADE,
  PRIMARY KEY (product_id, tag_id)
);

CREATE TABLE bundles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  image_url TEXT,
  discount_percentage DECIMAL(5,2) DEFAULT 0,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE bundle_items (
  bundle_id UUID REFERENCES bundles(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  quantity INTEGER DEFAULT 1,
  PRIMARY KEY (bundle_id, product_id)
);

CREATE TABLE orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending','confirmed','shipped','delivered','cancelled')),
  total DECIMAL(10,2) NOT NULL,
  customer_name TEXT,
  customer_email TEXT,
  customer_phone TEXT,
  shipping_address JSONB,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE order_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id),
  quantity INTEGER NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

-- Auto-update updated_at on products
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER products_updated_at
  BEFORE UPDATE ON products
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Row Level Security
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE bundles ENABLE ROW LEVEL SECURITY;
ALTER TABLE bundle_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public_read_products" ON products FOR SELECT USING (is_active = TRUE);
CREATE POLICY "public_read_categories" ON categories FOR SELECT USING (TRUE);
CREATE POLICY "public_read_tags" ON tags FOR SELECT USING (TRUE);
CREATE POLICY "public_read_product_tags" ON product_tags FOR SELECT USING (TRUE);
CREATE POLICY "public_read_bundles" ON bundles FOR SELECT USING (is_active = TRUE);
CREATE POLICY "public_read_bundle_items" ON bundle_items FOR SELECT USING (TRUE);
CREATE POLICY "users_read_own_orders" ON orders FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "users_create_orders" ON orders FOR INSERT WITH CHECK (auth.uid() = user_id OR user_id IS NULL);
CREATE POLICY "users_read_own_order_items" ON order_items FOR SELECT USING (
  EXISTS (SELECT 1 FROM orders WHERE orders.id = order_items.order_id AND orders.user_id = auth.uid())
);

-- Seed: parent categories
INSERT INTO categories (name, slug, sort_order) VALUES
  ('Computing', 'computing', 1),
  ('Peripherals & Accessories', 'peripherals', 2),
  ('Displays & Vision', 'displays', 3),
  ('Printing & Consumables', 'printing', 4),
  ('Professional Solutions', 'professional', 5),
  ('Apple Collection', 'apple', 6);

-- Sub-categories (Computing)
INSERT INTO categories (name, slug, parent_id, sort_order)
SELECT 'Laptops', 'laptops', id, 1 FROM categories WHERE slug = 'computing';
INSERT INTO categories (name, slug, parent_id, sort_order)
SELECT 'Desktops', 'desktops', id, 2 FROM categories WHERE slug = 'computing';
INSERT INTO categories (name, slug, parent_id, sort_order)
SELECT 'iMacs', 'imacs', id, 3 FROM categories WHERE slug = 'computing';

-- Sub-categories (Peripherals)
INSERT INTO categories (name, slug, parent_id, sort_order)
SELECT c.name, c.slug, p.id, c.so FROM (VALUES
  ('Mice','mice',1),('Keyboards','keyboards',2),('Headsets','headsets',3),
  ('Bags','bags',4),('Webcams','webcams',5)
) AS c(name, slug, so) CROSS JOIN (SELECT id FROM categories WHERE slug='peripherals') p;

-- Sub-categories (Displays)
INSERT INTO categories (name, slug, parent_id, sort_order)
SELECT c.name, c.slug, p.id, c.so FROM (VALUES
  ('Monitors','monitors',1),('POS Touch Screens','pos-touch-screens',2)
) AS c(name, slug, so) CROSS JOIN (SELECT id FROM categories WHERE slug='displays') p;

-- Sub-categories (Printing)
INSERT INTO categories (name, slug, parent_id, sort_order)
SELECT c.name, c.slug, p.id, c.so FROM (VALUES
  ('Inkjet Printers','inkjet',1),('Laser Printers','laser',2),
  ('Photocopiers','photocopiers',3),('Ink & Toner','ink-toner',4)
) AS c(name, slug, so) CROSS JOIN (SELECT id FROM categories WHERE slug='printing') p;

-- Sub-categories (Professional Solutions)
INSERT INTO categories (name, slug, parent_id, sort_order)
SELECT c.name, c.slug, p.id, c.so FROM (VALUES
  ('POS Systems','pos-systems',1),('Storage','storage',2),('Networking','networking',3)
) AS c(name, slug, so) CROSS JOIN (SELECT id FROM categories WHERE slug='professional') p;

-- Seed tags
INSERT INTO tags (name, slug, type) VALUES
  ('Apple', 'apple', 'brand'),
  ('Dell', 'dell', 'brand'),
  ('HP', 'hp', 'brand'),
  ('Lenovo', 'lenovo', 'brand'),
  ('Asus', 'asus', 'brand'),
  ('Logitech', 'logitech', 'brand'),
  ('Samsung', 'samsung', 'brand'),
  ('Epson', 'epson', 'brand'),
  ('Gaming', 'gaming', 'use_case'),
  ('Business', 'business', 'use_case'),
  ('Student', 'student', 'use_case'),
  ('Home Office', 'home-office', 'use_case'),
  ('POS', 'pos', 'use_case'),
  ('Laptop', 'laptop', 'type'),
  ('Desktop', 'desktop', 'type'),
  ('Monitor', 'monitor', 'type'),
  ('Printer', 'printer', 'type'),
  ('Accessory', 'accessory', 'type');
