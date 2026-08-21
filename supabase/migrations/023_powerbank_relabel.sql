-- Seagate does not make power banks. These 3 products were tagged as
-- Seagate but their real photos show Anker, Techsmarter, and (newly
-- sourced) Voltra. Relabels name + image + brand tag to match reality.

INSERT INTO tags (name, slug, type) VALUES
  ('Anker', 'anker', 'brand'),
  ('Techsmarter', 'techsmarter', 'brand'),
  ('Voltra', 'voltra', 'brand')
ON CONFLICT (slug) DO NOTHING;

UPDATE products SET name = 'Anker 24000 MAH Power Bank'
WHERE slug = 'seagate-24000-mah';

UPDATE products SET name = 'Techsmarter 30000 MAH Power Bank'
WHERE slug = 'seagate-30000-mah';

UPDATE products SET name = 'Voltra 96000 MAH Power Bank', images = ARRAY['/products/voltra-fpb96k-c60-96000mah-powerbank.webp']
WHERE slug = 'seagate-96000-mah';

DELETE FROM product_tags
WHERE tag_id = (SELECT id FROM tags WHERE slug = 'seagate')
  AND product_id IN (SELECT id FROM products WHERE slug IN ('seagate-24000-mah', 'seagate-30000-mah', 'seagate-96000-mah'));

INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p JOIN tags t ON t.slug = 'anker' WHERE p.slug = 'seagate-24000-mah'
ON CONFLICT DO NOTHING;

INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p JOIN tags t ON t.slug = 'techsmarter' WHERE p.slug = 'seagate-30000-mah'
ON CONFLICT DO NOTHING;

INSERT INTO product_tags (product_id, tag_id)
SELECT p.id, t.id FROM products p JOIN tags t ON t.slug = 'voltra' WHERE p.slug = 'seagate-96000-mah'
ON CONFLICT DO NOTHING;
