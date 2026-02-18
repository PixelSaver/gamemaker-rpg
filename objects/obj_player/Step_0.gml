if (instance_exists(obj_dialog)) exit;

// Dash logic
if (!is_dashing && dash_cooldown_timer <= 0 && keyboard_check_pressed(vk_shift)) {
    is_dashing = true;
    dash_timer = dash_time;
    dash_cooldown_timer = dash_cooldown;
}

var _horiz = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _verti = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Determine current speed
var _speed = move_speed;
if (is_dashing) {
    _speed = dash_speed;
    dash_timer -= 1;
    if (dash_timer <= 0) {
        is_dashing = false;
    }
} else if (dash_cooldown_timer > 0) {
    dash_cooldown_timer -= 1;
}


// Smooth the camera
// Vec the movement to make diag work

move_and_collide(_horiz * _speed, _verti * _speed, tilemap, undefined, undefined, undefined, _speed, _speed);

// Animations
if (_horiz != 0 || _verti != 0)
{
    if (_verti > 0) {
        sprite_index = spr_player_walk_down;
    }
    else if (_verti < 0) {
        sprite_index = spr_player_walk_up;
    }
    else if (_horiz > 0) {
        sprite_index = spr_player_walk_right;
    }
    else if (_horiz < 0) {
        sprite_index = spr_player_walk_left; 
    }
    
    facing = point_direction(0, 0, _horiz, _verti);
}
else {
    if (sprite_index == spr_player_walk_right) {
        sprite_index = spr_player_idle_right;
    }
    else if (sprite_index == spr_player_walk_left) {
        sprite_index = spr_player_idle_left;
    }
    else if (sprite_index == spr_player_walk_up) {
        sprite_index = spr_player_idle_up;
    }
    else if (sprite_index == spr_player_walk_down) {
        sprite_index = spr_player_idle_down;
    }
}

if (keyboard_check_pressed(vk_space)) {
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = facing;
    _inst.damage *= damage
}