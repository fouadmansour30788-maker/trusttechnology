-- ROG Flow Z13 (13.4" detachable, Ryzen AI Max+ 395)
UPDATE products SET images = ARRAY[images[1], '/products/asus-rog-flow-z13-front.png', '/products/asus-rog-flow-z13-kickstand.png']
WHERE slug IN ('asus-gaming-laptop-amd-ryzen-ai-max-395-amd-radeon-8060s', 'asus-gaming-laptop-amd-ryzen-ai-max-395-amd-radeon-8060s-2');

-- TUF Gaming F16 (2025) chassis group
UPDATE products SET images = ARRAY[images[1], '/products/asus-tuf-f16-2025-angle.jpg']
WHERE slug IN (
  'asus-gaming-laptop-core-7-240h-rtx-5060-8gb', 'asus-gaming-laptop-core-i7-14650hx-rtx-5050-ddr7-8gb',
  'asus-gaming-laptop-core-i7-14650hx-rtx-5060-ddr7-8gb', 'asus-gaming-laptop-core-i7-14700hx-rtx-5060-8gb'
);

-- TUF Gaming F15 chassis (reusing migration 041 photo)
UPDATE products SET images = ARRAY[images[1], '/products/asus-tuf-f15-graphite-black-top.jpg']
WHERE slug IN ('asus-gaming-laptop-core-i7-13650hx-rtx-5050-8gb', 'asus-gaming-laptop-core-i7-13650hx-rtx-5060-8gb');

-- ROG Strix G16 chassis (reusing migration 040/041 photos)
UPDATE products SET images = ARRAY[images[1], '/products/asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-front.png', '/products/asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-top.png']
WHERE slug IN ('asus-gaming-laptop-core-ultra-7-255h-rtx-5060-8gb', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5060-8gb-2', 'asus-gaming-laptop-core-ultra-9-275hx-rtx-5070ti-12gb-2');
