function create_dialog(_messages){
    if (instance_exists(obj_dialog)) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
    
}

char_colors = {
    "Congrats": c_yellow,
    "Cross": c_yellow,
    "Cam": c_orange,
    "Player": c_aqua,
}

welcome_dialog = [
    {
    name: "Cross",
    msg: "Welcome to the game!"
    },
    {
        name: "Player",
        msg: "Thanks!"
    },
    {
        name: "Cross",
        msg: "Well, it's not going to be easy to get out..."
    },
    {
        name: "Player",
        msg: "What? I'm stuck here?"
    },
    {
        name: "Cross",
        msg: "You're stuck here!"
    },
    {
        name: "Player",
        msg: "NOOOOO! MY DOG!!! "
    },
    {
        name: "Player",
        msg: "and my wife and kids... I guess..."
    },
    {
        name: "Cross",
        msg: "So... space to attack, shift to dash/dodge, wasd to move, and space to interact!"
    },
    {
        name: "Player",
        msg: "What...? I'm stuck and you make jokes like this?? I'm leaving."
    },
    
]
fear_dialog = [
    {
    name: "Cross",
    msg: "Wha... what have you done?!?!?!"
    },
    {
        name: "Player",
        msg: "I saved us all!"
    },
    {
        name: "Cross",
        msg: "I told you... THERES NO WAY OUT!!"
    },
    {
        name: "Player",
        msg: "Well, the boss is dead, so there's definitely a way out right?"
    },
    {
        name: "Cross",
        msg: "The monster still roams. . ."
    },
    {
        name: "Player",
        msg: "Huh? Yeah whatever. Bye!! I'm off to freedomland, suckers!"
    },
]

cam_dialog = [
    {
        name: "Cam",
        msg: "Whats up my dude!!"
    }
]