-- Epson TM-T20X (051/052) thermal receipt printer (same chassis, USB/LAN variants)
UPDATE products SET images = ARRAY['/products/epson-tm-t20x-051-thermal-receipt-printer.jpg', '/products/epson-tm-t20x-front.webp', '/products/epson-tm-t20x-angle.jpg']
WHERE slug = 'epson-tm-t20x-051-thermal-receipt-printer';

UPDATE products SET images = ARRAY['/products/epson-tm-t20x-052-thermal-receipt-printer.jpg', '/products/epson-tm-t20x-front.webp', '/products/epson-tm-t20x-angle.jpg']
WHERE slug = 'epson-tm-t20x-052-thermal-receipt-printer';

-- Epson TM-T20III (011/012) thermal receipt printer (same chassis, USB/LAN variants)
UPDATE products SET images = ARRAY['/products/epson-tm-t20iii-011-thermal-receipt-printer.jpg', '/products/epson-tm-t20iii-front.jpg', '/products/epson-tm-t20iii-front2.jpg']
WHERE slug = 'epson-tm-t20iii-011-thermal-receipt-printer';

UPDATE products SET images = ARRAY['/products/epson-tm-t20iii-012-thermal-receipt-printer.jpg', '/products/epson-tm-t20iii-front.jpg', '/products/epson-tm-t20iii-front2.jpg']
WHERE slug = 'epson-tm-t20iii-012-thermal-receipt-printer';

-- Epson TM-M30II (122/112) thermal receipt printer (same chassis, connectivity variants)
UPDATE products SET images = ARRAY['/products/epson-tm-m30ii-122-thermal-receipt-printer.jpg', '/products/epson-tm-m30ii-lifestyle.jpg']
WHERE slug = 'epson-tm-m30ii-122-thermal-receipt-printer';

UPDATE products SET images = ARRAY['/products/epson-tm-m30ii-112-thermal-receipt-printer.jpg', '/products/epson-tm-m30ii-lifestyle.jpg']
WHERE slug = 'epson-tm-m30ii-112-thermal-receipt-printer';

-- Epson LQ-350 dot matrix printer (exact match)
UPDATE products SET images = ARRAY['/products/epson-printer-lq-350-dot-matrix-a4-24-pins.jpg', '/products/epson-lq-350-front.jpg']
WHERE slug = 'epson-printer-lq-350-dot-matrix-a4-24-pins';

-- Epson LQ-690II dot matrix flatbed printer (exact match)
UPDATE products SET images = ARRAY['/products/epson-printer-lq-690ii-dot-matrix-a4-24-pins-flat-bed.jpg', '/products/epson-lq-690ii-front.jpg']
WHERE slug = 'epson-printer-lq-690ii-dot-matrix-a4-24-pins-flat-bed';
