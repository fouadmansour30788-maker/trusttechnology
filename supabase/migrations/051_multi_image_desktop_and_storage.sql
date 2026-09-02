-- MSI AIO AM242TP 1M-839US (exact model match)
UPDATE products SET images = ARRAY['/products/msi-aio-am242tp-1m-839us.webp', '/products/msi-aio-am242tp-1m-839us-angle.png', '/products/msi-aio-am242tp-1m-839us-rear.jpg']
WHERE slug = 'msi-aio-am242tp-1m-839us';

-- Seagate ONE TOUCH HUB drives (same chassis, different capacities)
UPDATE products SET images = ARRAY['/products/seagate-one-touch-hub-20tb-external-hard-drive.webp', '/products/seagate-one-touch-hub-angle.jpg', '/products/seagate-one-touch-hub-box.jpg']
WHERE slug = 'seagate-one-touch-hub-20tb-external-hard-drive';

UPDATE products SET images = ARRAY['/products/seagate-one-touch-hub-16tb-external-hard-drive.webp', '/products/seagate-one-touch-hub-angle.jpg', '/products/seagate-one-touch-hub-box.jpg']
WHERE slug = 'seagate-one-touch-hub-16tb-external-hard-drive';

UPDATE products SET images = ARRAY['/products/seagate-one-touch-hub-12tb-external-hard-drive.webp', '/products/seagate-one-touch-hub-angle.jpg', '/products/seagate-one-touch-hub-box.jpg']
WHERE slug = 'seagate-one-touch-hub-12tb-external-hard-drive';

UPDATE products SET images = ARRAY['/products/seagate-one-touch-hub-8tb-external-hard-drive.webp', '/products/seagate-one-touch-hub-angle.jpg', '/products/seagate-one-touch-hub-box.jpg']
WHERE slug = 'seagate-one-touch-hub-8tb-external-hard-drive';

-- Seagate Expansion Portable drives (same chassis, different capacities)
UPDATE products SET images = ARRAY['/products/seagate-4tb-expansion-portable-usb-3-0-external-hard-drive.webp', '/products/seagate-expansion-portable-box.jpg', '/products/seagate-expansion-portable-front.jpg']
WHERE slug = 'seagate-4tb-expansion-portable-usb-3-0-external-hard-drive';

UPDATE products SET images = ARRAY['/products/seagate-2tb-expansion-portable-usb-3-0-external-hard-drive.webp', '/products/seagate-expansion-portable-box.jpg', '/products/seagate-expansion-portable-front.jpg']
WHERE slug = 'seagate-2tb-expansion-portable-usb-3-0-external-hard-drive';

-- Voltra FPB96K-C60 96000mAh power bank (best-effort match, niche brand)
UPDATE products SET images = ARRAY['/products/voltra-fpb96k-c60-96000mah-powerbank.webp', '/products/voltra-fpb96k-c60-96000mah-powerbank-angle.jpg']
WHERE slug = 'seagate-96000-mah';

-- Techsmarter 30000mAh power bank (exact match)
UPDATE products SET images = ARRAY['/products/seagate-30000-mah.webp', '/products/techsmarter-30000mah-powerbank-set.jpg']
WHERE slug = 'seagate-30000-mah';

-- HP 3J122AA Pen Rechargeable Type-C (exact SKU match)
UPDATE products SET images = ARRAY['/products/hp-3j122aa-pen-rechargeable-type-c.jpg', '/products/hp-3j122aa-pen-rechargeable-type-c-front.jpg', '/products/hp-3j122aa-pen-rechargeable-type-c-side.jpg']
WHERE slug = 'hp-3j122aa-pen-rechargeable-type-c';

-- HP 410 Slim Bluetooth Mouse Silver (exact color match, official HP CDN)
UPDATE products SET images = ARRAY['/products/hp-410-slim-silver-bluetooth-mouse.jpg', '/products/hp-410-slim-silver-bluetooth-mouse-top.png']
WHERE slug = 'hp-410-slim-silver-bluetooth-mouse';
