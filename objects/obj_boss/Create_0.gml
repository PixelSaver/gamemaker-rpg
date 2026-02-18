// Inherit the parent event
event_inherited();

max_hp = hp;

// Phase system
phase = 1;          // phase 1 = basic chase
phase_changed = false;

dash_duration = 20;
dash_cooldown_timer = 0;
dash_timer = 0;
is_dashing = false;
dash_h = 0;
dash_v = 0;
dash_speed = 6;

phase3_angle = 0;       // starting angle in degrees
phase3_radius = 120;    // distance from player
phase3_speed = 2;       // movement speed while circling
phase3_rotate_speed = 3; // degrees per step around player


// Attack cooldowns
alarm[0] = 60; // movement target update
alarm[1] = -1; // knockback invul
alarm[2] = 90; // projectile attack cooldown
alarm[3] = -1; // dash attack cooldown
