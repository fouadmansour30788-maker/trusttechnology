-- ROG Strix G16 chassis (reusing already-sourced photos)
UPDATE products SET images = ARRAY[images[1], '/products/asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb-rear.jpg', '/products/asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb-lid.jpg']
WHERE slug = 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5060-8gb';

UPDATE products SET images = ARRAY[images[1], '/products/asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-front.png', '/products/asus-gaming-laptop-core-ultra-9-275hx-rtx-5090-24gb-top.png']
WHERE slug = 'asus-gaming-laptop-core-i9-14900hx-rtx-5070-8gb';

-- ROG Ally X handheld
UPDATE products SET images = ARRAY[images[1], '/products/asus-rog-ally-white-rear.jpg']
WHERE slug = 'asus-gaming-laptop-amd-ryzen-z1-extreme-8-cores-amd-radeon';

-- TUF F15 chassis (reusing already-sourced photo)
UPDATE products SET images = ARRAY[images[1], '/products/asus-tuf-f15-graphite-black-top.jpg']
WHERE slug = 'asus-gaming-laptop-core-i9-13900h-rtx-5060-8gb';

-- Previously zero-image row -- best-effort ROG Strix G16 match (same CPU
-- family, Eclipse colour naming), since it had no photo at all
UPDATE products SET images = ARRAY['/products/asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb-rear.jpg', '/products/asus-gaming-laptop-amd-ryzen-9-9955hx-rtx-5070ti-12gb-lid.jpg']
WHERE slug = 'asus-gaming-laptop-core-i7-13650hx-rtx-5050-8gb-2';
