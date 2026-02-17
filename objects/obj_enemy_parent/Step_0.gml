//hey
var _horiz = clamp(target_x - x, -1, 1);
var _verti = clamp(target_y - y, -1, 1);

move_and_collide(_horiz * move_speed, _verti * move_speed, [tilemap, obj_enemy_parent]);