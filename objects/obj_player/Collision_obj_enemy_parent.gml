if (alarm[0] < 0 && !self.is_dashing) {
    hp -= other.damage;
    alarm[0] = 60;
    image_blend = c_red;
    
    if (hp <= 0) {
        room_restart();
    }
}