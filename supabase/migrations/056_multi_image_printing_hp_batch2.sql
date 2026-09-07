-- HP LaserJet M111a (exact match)
UPDATE products SET images = ARRAY['/products/hp-laserjet-m111a-supplies-w1500a.png', '/products/hp-laserjet-m111a-front.png']
WHERE slug = 'hp-laserjet-m111a-supplies-w1500a';

-- HP LaserJet M111w (exact match, official HP CDN)
UPDATE products SET images = ARRAY['/products/hp-laserjet-m111w-supplies-w1500a.png', '/products/hp-laserjet-m111w-front.png']
WHERE slug = 'hp-laserjet-m111w-supplies-w1500a';

-- HP LaserJet Pro 4003n/4003dn/4003dw (same chassis family, dn variant photo)
UPDATE products SET images = ARRAY['/products/hp-laserjet-pro-4003n-supplies-w1510a.png', '/products/hp-laserjet-pro-4003-front.jpg']
WHERE slug = 'hp-laserjet-pro-4003n-supplies-w1510a';

UPDATE products SET images = ARRAY['/products/hp-laserjet-pro-4003dn-supplies-w1510a.png', '/products/hp-laserjet-pro-4003-front.jpg']
WHERE slug = 'hp-laserjet-pro-4003dn-supplies-w1510a';

UPDATE products SET images = ARRAY['/products/hp-laserjet-pro-4003dw-supplies-w1510a.png', '/products/hp-laserjet-pro-4003-front.jpg']
WHERE slug = 'hp-laserjet-pro-4003dw-supplies-w1510a';

-- HP LaserJet Pro 501dn / M501dn (exact match)
UPDATE products SET images = ARRAY['/products/hp-laserjet-pro-501dn-supplies-cf287a.png', '/products/hp-laserjet-pro-501dn-front.jpg']
WHERE slug = 'hp-laserjet-pro-501dn-supplies-cf287a';

-- HP Color LaserJet 150nw (exact match)
UPDATE products SET images = ARRAY['/products/hp-clj-150nw-supplies-w2070a.png', '/products/hp-clj-150nw-front.jpg']
WHERE slug = 'hp-clj-150nw-supplies-w2070a';
