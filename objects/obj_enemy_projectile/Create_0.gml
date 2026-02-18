// Projectile properties
speed = 1;
damage = 10;        // how much HP it removes
lifetime = 180;     // projectile disappears after 180 steps
direction = point_direction(x, y, obj_player.x, obj_player.y);
image_angle = direction - 90; // rotate sprite to face movement