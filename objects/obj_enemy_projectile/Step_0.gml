
// Reduce lifetime
lifetime -= 1;
if (lifetime <= 0) {
    instance_destroy();
}

if (tilemap_get_at_pixel(layer_tilemap_get_id("Col"), x, y)) {
    instance_destroy();
}