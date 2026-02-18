boss_defeated = false;


move_speed = 1;

tilemap = layer_tilemap_get_id(("Col"));

hp = 10;
max_hp = hp;
damage = 1;

facing = 0;

level = 1;
xp = 0;
xp_require = 100;

dash_speed = 8;
// frames the dash lasts
dash_time = 10;
// cooldown in frames before next dash
dash_cooldown = 30;  
// counts down dash duration
dash_timer = 0;     
// counts down cooldown
dash_cooldown_timer = 0; 
is_dashing = false;

function add_xp(_xp_to_add) {
    xp += _xp_to_add;
    var lvl_up = false;
    while (xp >= xp_require) {
        level += 1;
        xp -= xp_require;
        xp_require *= 1.4;
        
        max_hp += 5;
        hp = max_hp;
        damage += 0.8;
        lvl_up = true;
    }
    if (lvl_up) {
        create_dialog([{
            name: "Congrats",
            msg: $"You leveled up! Your new stats are:\nLV {level}\nHP {max_hp}\nDMG {damage}"
        }])
    }
}