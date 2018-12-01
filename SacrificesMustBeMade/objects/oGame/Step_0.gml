// input variables for debug room traversal
var kRestart, kExit, kPrev, kNext;

kRestart = keyboard_check_pressed(ord("R"));
kExit    = keyboard_check_pressed(vk_escape);
kPrev    = keyboard_check_pressed(vk_subtract);
kNext    = keyboard_check_pressed(vk_add);

if (kRestart)
    room_restart();
if (kExit)
    game_end();
    
// Iterate through rooms backward
if (kPrev) {
    if (room == room_first)
        room_goto(room_last);
    else
        room_goto_previous();
}

// Iterate through rooms forwards
if (kNext) {
    if (room == room_last)
        room_goto(room_first);
    else
        room_goto_next();
}

// Fullscreen
if (keyboard_check_pressed(vk_enter)) {
	window_set_fullscreen(!window_get_fullscreen());
}

#region Update Player Properties
var right = keyboard_check_pressed(vk_right);
var left  = keyboard_check_pressed(vk_left);
var up    = keyboard_check_pressed(vk_up);
var down  = keyboard_check_pressed(vk_down);
var shift = keyboard_check(vk_shift);

#region Navigate
if (down) {
	if (propIndex < numberOfProperties - 1) {
		propIndex++;
	}
	else {
		propIndex = 0;	
	}
}
if (up) {
	if (propIndex > 0) {
		propIndex--;
	}
	else {
		propIndex = numberOfProperties - 1;	
	}
}
#endregion

#region Modify Values
switch(propIndex) {
	case 0:
		oPlayer.groundAccel += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.groundAccel -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
	case 1:
		oPlayer.groundFric += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.groundFric -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
	case 2:
		oPlayer.airAccel += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.airAccel -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
	case 3:
		oPlayer.airFric += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.airFric -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
	case 4:
		oPlayer.vxMax += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.vxMax -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
	case 5:
		oPlayer.vyMax += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.vyMax -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
	case 6:
		oPlayer.jumpHeight += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.jumpHeight -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
	case 7:
		oPlayer.gravNorm += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.gravNorm -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
	case 8:
		oPlayer.gravSlide += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.gravSlide -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
	case 9:
		oPlayer.clingTime += ((0.1 * right * shift) + (1 * right * !shift));
		oPlayer.clingTime -= ((0.1 * left  * shift) + (1 * left  * !shift));
		break;
}
#endregion 
#endregion