if (!self.is_dashing){
    hp -= damage;       // assumes player has hp_current
    image_blend = c_red; 
    
    var kb_strength = 4;
    kb_x = sign(x - other.x) * kb_strength;
    kb_y = sign(y - other.y) * kb_strength;
    
    if (hp <= 0) {
        room_restart();
    }
}