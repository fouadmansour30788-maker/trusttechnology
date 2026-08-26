UPDATE products SET images = ARRAY[
  '/products/lenovo-yoga-7-aura-edition-15ill9-83hm002wus.jpg',
  '/products/lenovo-yoga-7-aura-edition-15ill9-83hm002wus-angle.jpg',
  '/products/lenovo-yoga-7-aura-edition-15ill9-83hm002wus-rear.jpg'
] WHERE slug = 'lenovo-yoga-7-aura-edition-15ill9-83hm002wus';

UPDATE products SET images = ARRAY[
  '/products/lenovo-yoga-7-16ahp9-83dm0006us.jpg',
  '/products/lenovo-yoga-7-16ahp9-83dm0006us-front.png',
  '/products/lenovo-yoga-7-16ahp9-83dm0006us-tent.png'
] WHERE slug = 'lenovo-yoga-7-16ahp9-83dm0006us';

-- IdeaPad Slim 3 15IPH11 family (2 SKUs, same Luna Grey chassis)
UPDATE products SET images = ARRAY[images[1], '/products/lenovo-ideapad-slim-3-15iph11-rear.jpg']
WHERE slug IN ('lenovo-ideapad-slim-3-15iph11-83ur0042dp', 'lenovo-ideapad-slim-3-15iph11-83ur007rdp');

UPDATE products SET images = ARRAY[
  '/products/lenovo-ip1-15iru7-83b40001us.jpg',
  '/products/lenovo-ip1-15iru7-front.png',
  '/products/lenovo-ip1-15iru7-angle.png'
] WHERE slug = 'lenovo-ip1-15iru7-83b40001us';
