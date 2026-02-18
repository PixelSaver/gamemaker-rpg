if (instance_exists(obj_player) && object_exists(obj_enemy_projectile) && phase == 3) {
    var _proj = instance_create_depth(x, y, depth, obj_enemy_projectile);
    _proj.direction = point_direction(x, y, obj_player.x, obj_player.y);
}
alarm[2] = 90; // projectile cooldown