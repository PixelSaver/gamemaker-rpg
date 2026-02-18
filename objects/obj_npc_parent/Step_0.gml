if (instance_exists(obj_dialog)) exit;
    
if (instance_exists(obj_player) && distance_to_object(obj_player) < 8) {
    can_talk = true;
    if (keyboard_check_pressed(input_key)) {
        if (global.boss_defeated) {
            create_dialog(alt_dialog);
            room_restart();
        }
        else create_dialog(dialog);
    }
}
else {
    can_talk = false;
}