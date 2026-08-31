-- ROG Strix G16 chassis group (already sourced front.png/top.png)
UPDATE products SET images = ARRAY[images[1], '/products/asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-front.png', '/products/asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-top.png']
WHERE slug IN (
  'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb-3', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070-8gb',
  'asus-gaming-laptop-core-ultra-9-275hx-rtx-5080-16gb-2', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-2',
  'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070ti-12gb',
  'asus-gaming-laptop-core-ultra-9-285hx-rtx-5070ti-ddr7-12gb'
);

-- ASUS TUF Gaming A15 chassis group
UPDATE products SET images = ARRAY[images[1], '/products/asus-tuf-a15-graphite-black-front.jpg']
WHERE slug IN (
  'asus-gaming-laptop-amd-ryzen-5-7235hs-rtx-4050-6gb', 'asus-gaming-laptop-amd-ryzen-5-7535hs-rtx-4050-6gb',
  'asus-gaming-laptop-amd-ryzen-7-250-8-cores-rtx-5060-8gb'
);

-- ASUS TUF Gaming F15 chassis group
UPDATE products SET images = ARRAY[images[1], '/products/asus-tuf-f15-graphite-black-top.jpg']
WHERE slug IN ('asus-gaming-laptop-core-i5-13450hx-rtx-3050-6gb', 'asus-gaming-laptop-core-i7-13650hx-rtx-3050-6gb');
