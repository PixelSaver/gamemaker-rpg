draw_self();

// Bar settings
var bar_w = 80;
var bar_h = 8;

// Position above boss
var bar_x1 = x - bar_w/2;
var bar_y1 = y - sprite_height/2 - 16;

var hp_percent = clamp(hp / max_hp, 0, 1);

// Background
draw_set_color(c_black);
draw_rectangle(bar_x1 - 1, bar_y1 - 1, bar_x1 + bar_w + 1, bar_y1 + bar_h + 1, false);

// Health
draw_set_color(c_red);
draw_rectangle(bar_x1, bar_y1, bar_x1 + bar_w * hp_percent, bar_y1 + bar_h, false);

// Border
draw_set_color(c_white);
draw_rectangle(bar_x1 - 1, bar_y1 - 1, bar_x1 + bar_w + 1, bar_y1 + bar_h + 1, true);