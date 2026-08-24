-- Dell laptop/desktop lineup: multi-image galleries. Sourced from Ayoub
-- Computers where they carry the exact SKU (dell-inspiron-i5640-7609blu-pus);
-- fell back to other verified real retailers (Best Buy, Amazon, and two
-- other Lebanese retailers) for the rest, where Ayoub doesn't stock that
-- exact model. Marketing-banner/infographic images (badges, dimension
-- callouts) were skipped in favor of clean product-only shots.
UPDATE products SET images = ARRAY[
  '/products/dell-inspiron-i5640-7609blu-pus.webp',
  '/products/dell-inspiron-i5640-7609blu-pus-front.png',
  '/products/dell-inspiron-i5640-7609blu-pus-side.png'
] WHERE slug = 'dell-inspiron-i5640-7609blu-pus';

UPDATE products SET images = ARRAY[
  '/products/dell-ldb04250-7137blu-pus.webp',
  '/products/dell-ldb04250-7137blu-pus-front.jpg'
] WHERE slug = 'dell-ldb04250-7137blu-pus';

UPDATE products SET images = ARRAY[
  '/products/dell-plus-ld15260-7140blk-pus.avif',
  '/products/dell-plus-ld15260-7140blk-pus-angle.jpg'
] WHERE slug = 'dell-plus-ld15260-7140blk-pus';

UPDATE products SET images = ARRAY[
  '/products/dell-inspiron-i7440-5647blu-pus.webp',
  '/products/dell-inspiron-i7440-5647blu-pus-angle.jpg',
  '/products/dell-inspiron-i7440-5647blu-pus-tent.jpg'
] WHERE slug = 'dell-inspiron-i7440-5647blu-pus';

UPDATE products SET images = ARRAY[
  '/products/dell-aio-24-dec24250-7482wht-pus.webp',
  '/products/dell-aio-24-dec24250-7482wht-pus-front.jpg',
  '/products/dell-aio-24-dec24250-7482wht-pus-angle.jpg'
] WHERE slug = 'dell-aio-24-dec24250-7482wht-pus';
