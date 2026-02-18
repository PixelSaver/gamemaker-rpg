var bar_w = 300;
var bar_h = 20;
var cam_x = camera_get_view_x(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);

var bar_x = cam_x + cam_w/2 - bar_w/2;
var bar_y = 20;

// background
draw_set_colour(c_black);
draw_rectangle(bar_x-2, bar_y-2, bar_x + bar_w + 2, bar_y + bar_h + 2, false);

// health
draw_set_colour(c_red);
draw_rectangle(bar_x, bar_y, bar_x + (hp / max_hp) * bar_w, bar_y + bar_h, false);

// border
draw_set_colour(c_white);
draw_rectangle(bar_x-2, bar_y-2, bar_x + bar_w+2, bar_y + bar_h+2, true);