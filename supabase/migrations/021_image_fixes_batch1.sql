-- Image-audit fixes (batch 1 of an ongoing pass): wrong-business branding and
-- a badly-cropped stock photo shared across two SKUs. Sourced real, correctly
-- cropped/branded replacements — see conversation for detail.

-- Was showing a Lenovo-branded device on an ASUS Snapdragon detachable listing.
UPDATE products SET images = ARRAY['/products/asus-proart-pz13-snapdragon-x-plus-nano-black.png']
WHERE slug = 'asus-gaming-laptop-snapdragon-x-plus-x1p-42-100-3-4-ghz';

-- Both were using the same tightly-cropped marketing photo that cut off the
-- laptop's edges and full keyboard. Replaced with a full top-down view.
UPDATE products SET images = ARRAY['/products/asus-tuf-a16-ryzen9-rtx5070-full-view.jpg']
WHERE slug = 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070-8gb';

UPDATE products SET images = ARRAY['/products/asus-tuf-a16-ryzen9-rtx5070-full-view.jpg']
WHERE slug = 'asus-gaming-laptop-amd-ryzen-9-8940hx-rtx-5070ti-ddr7-12gb';
