if (alarm[1] < 0) {
    hp -= other.damage;
    image_blend = c_red;
    
    kb_x = sign(x - other.x);
    kb_y = sign(y - other.y);
    alarm[1] = 20; // knockback invul frames
    
    if (hp <= 0) {
        instance_destroy();
        if (instance_exists(obj_player)) obj_player.add_xp(xp);
    }
}