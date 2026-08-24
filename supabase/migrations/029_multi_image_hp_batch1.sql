-- HP laptops, batch 1 of the HP lineup. Ayoub Computers exact-SKU match
-- for FD0215DX and CP2025DX; verified exact-SKU real photos from other
-- retailers (manufacturer syndication feed, retailer CDNs) for the rest.
UPDATE products SET images = ARRAY[
  '/products/hp-15-fd0215dx.jpg',
  '/products/hp-15-fd0215dx-front.png',
  '/products/hp-15-fd0215dx-side.png'
] WHERE slug = 'hp-15-fd0215dx';

UPDATE products SET images = ARRAY[
  '/products/hp-15-fd0127dx.jpg',
  '/products/hp-15-fd0127dx-angle1.jpg',
  '/products/hp-15-fd0127dx-angle2.jpg'
] WHERE slug = 'hp-15-fd0127dx';

UPDATE products SET images = ARRAY[
  '/products/hp-15-fd1899nr.jpg',
  '/products/hp-15-fd1899nr-front.jpg'
] WHERE slug = 'hp-15-fd1899nr';

UPDATE products SET images = ARRAY[
  '/products/hp-17-cp2025dx.jpg',
  '/products/hp-17-cp2025dx-front.png',
  '/products/hp-17-cp2025dx-angle.png'
] WHERE slug = 'hp-17-cp2025dx';

UPDATE products SET images = ARRAY[
  '/products/hp-14-ep2035cl.jpg',
  '/products/hp-14-ep2035cl-front.jpg',
  '/products/hp-14-ep2035cl-angle.jpg'
] WHERE slug = 'hp-14-ep2035cl';
