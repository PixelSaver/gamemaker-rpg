if (instance_exists(obj_dialog)) exit;

// Apply knockback if active
if (alarm[1] >= 0) {
    target_x += kb_x;
    target_y += kb_y;
}

var _speed = move_speed;
// Move toward target
var _horiz = clamp(target_x - x, -1, 1);
var _verti = clamp(target_y - y, -1, 1);

// Phase-based movement and behavior
switch (phase) {
    case 1:
    // Phase 1: chase player
    if (instance_exists(obj_player)) {
        if (distance_to_object(obj_player) < dist_player) {
            target_x = obj_player.x;
            target_y = obj_player.y;
        } else {
            // random patrol around start
            target_x = random_range(xstart - 100, xstart + 100);
            target_y = random_range(ystart - 100, ystart + 100);
        }
    }
    break;

    case 2:
    // Reduce cooldown
    if (dash_cooldown_timer > 0) dash_cooldown_timer -= 1;

    // Start dash if not dashing and cooldown ready
    if (
        !is_dashing &&
        dash_cooldown_timer <= 0 &&
        instance_exists(obj_player)
    ) {
        is_dashing = true;
        dash_timer = dash_duration;

        // Compute dash vector
        var dash_angle = point_direction(x, y, obj_player.x, obj_player.y);
        dash_h = lengthdir_x(1, dash_angle); // unit vector
        dash_v = lengthdir_y(1, dash_angle);

        dash_cooldown_timer = 120;
    }

    // Apply movement
    if (is_dashing) {
        _horiz = dash_h;
        _verti = dash_v;
        _speed = dash_speed;

        dash_timer -= 1;
        if (dash_timer <= 0) is_dashing = false;
    } else {
        _speed = 0;
    }
    break;

    case 3:
    if (instance_exists(obj_player)) {
        // Increment the circling angle
        phase3_angle += phase3_rotate_speed;
        if (phase3_angle >= 360) phase3_angle -= 360;
        
        // Compute target relative to player
        target_x = obj_player.x + lengthdir_x(phase3_radius, phase3_angle);
        target_y = obj_player.y + lengthdir_y(phase3_radius, phase3_angle);
        
        // Compute direction vector for move_and_collide
        _horiz = clamp(target_x - x, -1, 1);
        _verti = clamp(target_y - y, -1, 1);
        _speed = phase3_speed;
    }
    break;
}

var _col = move_and_collide(_horiz * _speed, _verti * _speed, [tilemap, obj_enemy_parent]);
if (_col == noone) is_dashing = false;

// Update phase based on HP
if (hp <= max_hp * 0.66 && phase == 1) {
    phase = 2;
    move_speed = 3;
}
if (hp <= max_hp * 0.33 && phase == 2) {
    phase = 3;
    move_speed = 2;
}
