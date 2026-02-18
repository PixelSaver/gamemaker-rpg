// Inherit the parent event
event_inherited();

max_hp = hp;

// Phase system
phase = 1;          // phase 1 = basic chase
phase_changed = false;


// Attack cooldowns
alarm[0] = 60; // movement target update
alarm[1] = -1; // knockback invul
alarm[2] = 90; // projectile attack cooldown
alarm[3] = -1; // dash attack cooldown
