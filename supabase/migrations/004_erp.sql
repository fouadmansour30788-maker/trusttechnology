-- Trust Technology — ERP modules
-- Suppliers · Purchasing · Inventory ledger · Customers · Sales · Finance
-- Run AFTER 001–003. All tables are staff-only (is_staff() from 003).

-- ── Reference number sequences ──────────────────────────────────────────
CREATE SEQUENCE IF NOT EXISTS po_seq;
CREATE SEQUENCE IF NOT EXISTS so_seq;

-- ── Suppliers ───────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS suppliers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  contact_name TEXT,
  email TEXT,
  phone TEXT,
  address TEXT,
  notes TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ── Customers ───────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS customers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  email TEXT,
  phone TEXT,
  address TEXT,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ── Purchase orders ─────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS purchase_orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  reference TEXT UNIQUE DEFAULT ('PO-' || lpad(nextval('po_seq')::text, 4, '0')),
  supplier_id UUID REFERENCES suppliers(id) ON DELETE SET NULL,
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','ordered','received','cancelled')),
  order_date DATE DEFAULT CURRENT_DATE,
  expected_date DATE,
  notes TEXT,
  total DECIMAL(12,2) DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS purchase_order_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  po_id UUID REFERENCES purchase_orders(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id) ON DELETE SET NULL,
  quantity INTEGER NOT NULL DEFAULT 1,
  unit_cost DECIMAL(12,2) NOT NULL DEFAULT 0,
  received_qty INTEGER NOT NULL DEFAULT 0
);

-- ── Sales orders ────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS sales_orders (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  reference TEXT UNIQUE DEFAULT ('SO-' || lpad(nextval('so_seq')::text, 4, '0')),
  customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft','confirmed','fulfilled','cancelled')),
  order_date DATE DEFAULT CURRENT_DATE,
  subtotal DECIMAL(12,2) DEFAULT 0,
  discount DECIMAL(12,2) DEFAULT 0,
  total DECIMAL(12,2) DEFAULT 0,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS sales_order_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  so_id UUID REFERENCES sales_orders(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id) ON DELETE SET NULL,
  quantity INTEGER NOT NULL DEFAULT 1,
  unit_price DECIMAL(12,2) NOT NULL DEFAULT 0
);

-- ── Inventory movement ledger (single source of truth for stock changes) ─
CREATE TABLE IF NOT EXISTS stock_movements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  delta INTEGER NOT NULL,  -- +in, -out
  reason TEXT NOT NULL CHECK (reason IN ('purchase','sale','adjustment','return','initial')),
  reference TEXT,
  note TEXT,
  created_by UUID REFERENCES auth.users(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Every movement adjusts products.stock so stock stays consistent.
CREATE OR REPLACE FUNCTION apply_stock_movement()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE products SET stock = GREATEST(0, stock + NEW.delta) WHERE id = NEW.product_id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_stock_movement ON stock_movements;
CREATE TRIGGER trg_stock_movement
  AFTER INSERT ON stock_movements
  FOR EACH ROW EXECUTE FUNCTION apply_stock_movement();

-- ── Finance ─────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS payments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  direction TEXT NOT NULL CHECK (direction IN ('incoming','outgoing')),
  amount DECIMAL(12,2) NOT NULL,
  method TEXT,
  reference TEXT,
  note TEXT,
  sales_order_id UUID REFERENCES sales_orders(id) ON DELETE SET NULL,
  purchase_order_id UUID REFERENCES purchase_orders(id) ON DELETE SET NULL,
  paid_at DATE DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS expenses (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  category TEXT,
  amount DECIMAL(12,2) NOT NULL,
  note TEXT,
  spent_at DATE DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ── Row Level Security: staff-only across all ERP tables ────────────────
DO $$
DECLARE t TEXT;
BEGIN
  FOREACH t IN ARRAY ARRAY[
    'suppliers','customers','purchase_orders','purchase_order_items',
    'sales_orders','sales_order_items','stock_movements','payments','expenses'
  ] LOOP
    EXECUTE format('ALTER TABLE %I ENABLE ROW LEVEL SECURITY', t);
    EXECUTE format('DROP POLICY IF EXISTS staff_all_%I ON %I', t, t);
    EXECUTE format('CREATE POLICY staff_all_%I ON %I FOR ALL USING (is_staff()) WITH CHECK (is_staff())', t, t);
  END LOOP;
END $$;

-- Helpful indexes
CREATE INDEX IF NOT EXISTS idx_stock_movements_product ON stock_movements(product_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_po_items_po ON purchase_order_items(po_id);
CREATE INDEX IF NOT EXISTS idx_so_items_so ON sales_order_items(so_id);
