if (alarm[1] < 0) {
    hp -= other.damage;
    image_blend = c_red;
    
    kb_x = sign(x - other.x);
    kb_y = sign(y - other.y);
    alarm[1] = 20; // knockback invul frames
    
    if (hp <= 0) {
        create_dialog([
        {name: "Congrats",
            msg: "You Won... or did you?"
            }
        ])
        global.boss_defeated = true;
        instance_destroy();
        if (instance_exists(obj_player)) obj_player.add_xp(xp);
    }
}