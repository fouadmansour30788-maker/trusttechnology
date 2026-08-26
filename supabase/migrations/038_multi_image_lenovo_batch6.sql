-- Reuse T14 G6 photos (from migration 026) for the two other T14 G6
-- SKUs -- identical Black chassis, only CPU/RAM differs.
UPDATE products SET images = ARRAY[images[1], '/products/lenovo-thinkpad-t14-g6-angle.jpg', '/products/lenovo-thinkpad-t14-g6-top.jpg']
WHERE slug IN ('lenovo-thinkpad-t14-g6-21qg00aped', 'lenovo-thinkpad-t14-g6-2');

UPDATE products SET images = ARRAY[
  '/products/lenovo-thinkpad-x1-gen-10-aura-edition-2-in-1.jpg',
  '/products/lenovo-thinkpad-x1-gen-10-aura-edition-2-in-1-front.jpg',
  '/products/lenovo-thinkpad-x1-gen-10-aura-edition-2-in-1-angle.jpg'
] WHERE slug = 'lenovo-thinkpad-x1-gen-10-aura-edition-2-in-1';

UPDATE products SET images = ARRAY[
  '/products/lenovo-thinkpad-x9-15-gen-1-aura-edition-21q6006rus.jpg',
  '/products/lenovo-thinkpad-x9-15-gen-1-aura-edition-top.jpg',
  '/products/lenovo-thinkpad-x9-15-gen-1-aura-edition-angle.jpg'
] WHERE slug = 'lenovo-thinkpad-x9-15-gen-1-aura-edition-21q6006rus';

UPDATE products SET images = ARRAY[
  '/products/lenovo-thinkpad-x9-14-gen-1-aura-edition-21qa0036us.jpg',
  '/products/lenovo-thinkpad-x9-14-gen-1-aura-edition-top.png',
  '/products/lenovo-thinkpad-x9-14-gen-1-aura-edition-front.png'
] WHERE slug = 'lenovo-thinkpad-x9-14-gen-1-aura-edition-21qa0036us';

UPDATE products SET images = ARRAY[
  '/products/lenovo-thinkpad-t14s-g6.jpg',
  '/products/lenovo-thinkpad-t14s-g6-angle.jpg',
  '/products/lenovo-thinkpad-t14s-g6-front.jpg'
] WHERE slug = 'lenovo-thinkpad-t14s-g6';

UPDATE products SET images = ARRAY[
  '/products/lenovo-thinkpad-l14-gen-6-21s6003pus.jpg',
  '/products/lenovo-thinkpad-l14-gen-6-angle.jpg'
] WHERE slug = 'lenovo-thinkpad-l14-gen-6-21s6003pus';

UPDATE products SET images = ARRAY[images[1], '/products/lenovo-thinkbook-16-g8-ial-front.png', '/products/lenovo-thinkbook-16-g8-ial-top.png']
WHERE slug IN ('lenovo-thinkbook-16-g8-ial-21sk0030gp', 'lenovo-thinkbook-16-g8-ial-21sk0027gp');

UPDATE products SET images = ARRAY[
  '/products/lenovo-thinkbook-14-g8-ial-21sj0001gq.jpg',
  '/products/lenovo-thinkbook-14-g8-ial-angle1.jpg',
  '/products/lenovo-thinkbook-14-g8-ial-angle2.jpg'
] WHERE slug = 'lenovo-thinkbook-14-g8-ial-21sj0001gq';

UPDATE products SET images = ARRAY[
  '/products/lenovo-thinkbook-16-g9-irl-21us002xed.jpg',
  '/products/lenovo-thinkbook-16-g9-irl-front.jpg'
] WHERE slug = 'lenovo-thinkbook-16-g9-irl-21us002xed';
