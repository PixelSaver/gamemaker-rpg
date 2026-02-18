if (!self.is_dashing){
    hp -= other.damage;
    image_blend = c_red; 
    
    
    if (hp <= 0) {
        room_restart();
    }
}