if (instance_exists(obj_dialog)) exit;

// Apply knockback if active
if (alarm[1] >= 0) {
    target_x += kb_x;
    target_y += kb_y;
}

// Phase-based movement and behavior
switch(phase) {
    case 1:
        // Phase 1: chase player
        if (instance_exists(obj_player)) {
            if (distance_to_object(obj_player) < dist_player) {
                target_x = obj_player.x;
                target_y = obj_player.y;
            } else {
                // random patrol around start
                target_x = random_range(xstart - 100 , xstart + 100);
                target_y = random_range(ystart - 100 , ystart + 100);
            }
        }
        break;
        
    case 2:
        // Phase 2: dash attacks toward player
        if (alarm[3] <= 0 && instance_exists(obj_player)) {
            var _dash_angle = point_direction(x, y, obj_player.x, obj_player.y);
            var _dist = 80;
            target_x = obj_player.x + lengthdir_x(_dist, _dash_angle);
            target_y = obj_player.y + lengthdir_y(_dist, _dash_angle);
            alarm[3] = 60; // dash cooldown
        }
        break;
        
    case 3:
        // Phase 3: circling + projectile attacks
        if (instance_exists(obj_player)) {
            var _angle = point_direction(x, y, obj_player.x, obj_player.y);
            target_x = obj_player.x + cos(degtorad(_angle + 90)) * 120;
            target_y = obj_player.y + sin(degtorad(_angle + 90)) * 120;
        }
        break;
}

// Move toward target
var _horiz = clamp(target_x - x, -1, 1);
var _verti = clamp(target_y - y, -1, 1);
move_and_collide(_horiz * move_speed, _verti * move_speed, [tilemap, obj_enemy_parent]);

// Update phase based on HP
if (hp <= max_hp * 0.66 && phase == 1) {
    phase = 2;
    move_speed = 3;
}
if (hp <= max_hp * 0.33 && phase == 2) {
    phase = 3;
    move_speed = 2;
}