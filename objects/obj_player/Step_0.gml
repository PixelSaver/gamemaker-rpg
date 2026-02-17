var _horiz = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _verti = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Smooth the camera
// Vec the movement to make diag work

move_and_collide(_horiz * move_speed, _verti * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);

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