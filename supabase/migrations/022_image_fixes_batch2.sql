-- Image-audit fixes (batch 2): a competitor's watermark baked into a
-- product photo. (The HP pen fix in this same pass reused the existing
-- filename, so no DB update is needed for that one.)

UPDATE products SET images = ARRAY['/products/lenovo-510-wireless-combo-clean.webp']
WHERE slug = 'lenovo-510-wireless-combo-keyboard-and-mouse';
