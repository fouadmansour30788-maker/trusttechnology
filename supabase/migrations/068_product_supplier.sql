-- Supplier on products: supplier_id links to the existing suppliers table
-- (used elsewhere for purchase orders) when the supplier is a known/formal
-- one; supplier_name is free text for a quick note or a supplier that
-- doesn't warrant a full Suppliers record.
alter table products add column if not exists supplier_id uuid references suppliers(id) on delete set null;
alter table products add column if not exists supplier_name text;

create index if not exists products_supplier_id_idx on products (supplier_id) where supplier_id is not null;
