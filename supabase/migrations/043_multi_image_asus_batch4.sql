UPDATE products SET images = ARRAY[
  '/products/asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb.jpg',
  '/products/asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb-rear.jpg',
  '/products/asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb-lid.jpg'
] WHERE slug = 'asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb';

-- TUF A16 chassis (2 SKUs sharing the same base photo)
UPDATE products SET images = ARRAY[images[1], '/products/asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070-8gb-front.png', '/products/asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070-8gb-angle.png']
WHERE slug IN ('asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070-8gb', 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070ti-ddr7-12gb');

UPDATE products SET images = ARRAY[
  '/products/asus-gaming-laptop-amd-ryzen-7-260-rtx-5060-8gb.jpg',
  '/products/asus-gaming-laptop-amd-ryzen-7-260-rtx-5060-8gb-angle.jpg',
  '/products/asus-gaming-laptop-amd-ryzen-7-260-rtx-5060-8gb-open.jpg'
] WHERE slug = 'asus-gaming-laptop-amd-ryzen-7-260-rtx-5060-8gb';
