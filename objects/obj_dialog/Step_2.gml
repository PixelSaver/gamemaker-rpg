if (current_message < 0) exit;

var _str = messages[current_message].msg;

// If still typing
if (current_char < string_length(_str)) {

    // Press to instantly complete
    if (keyboard_check_pressed(input_key)) {
        current_char = string_length(_str);
    }
    else {
        current_char += char_speed;
    }

    draw_message = string_copy(_str, 1, current_char);
}
else {
    // Text finished — press to continue
    if (keyboard_check_pressed(input_key)) {
        current_message++;

        if (current_message >= array_length(messages)) {
            instance_destroy();
        }
        else {
            current_char = 0;
        }
    }
}