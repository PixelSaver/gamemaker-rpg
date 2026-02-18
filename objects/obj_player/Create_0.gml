// comment
move_speed = 1;

tilemap = layer_tilemap_get_id(("Col"));

hp = 10;
max_hp = hp;
damage = 1;

facing = 0;

level = 1;
xp = 0;
xp_require = 100;

function add_xp(_xp_to_add) {
    xp += _xp_to_add;
    if (xp >= xp_require) {
        level += 1;
        xp -= xp_require;
        xp_require *= 1.4;
        
        max_hp += 5;
        hp = max_hp;
        damage += 0.8;
        
        create_dialog([{
            name: "Congrats",
            msg: $"You leveled up! Your new stats are:\nLV {level}\nHP {hp_total}\nDMG {damage}"
        }])
    }
}