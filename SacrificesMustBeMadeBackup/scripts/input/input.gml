var deadzoneSize = 0.7;
gamepad_set_axis_deadzone(0, deadzoneSize);
gamepad_set_axis_deadzone(1, deadzoneSize);
gamepad_set_axis_deadzone(2, deadzoneSize);
gamepad_set_axis_deadzone(3, deadzoneSize);

// Player 1
if (player == 1) {
	kLeft			= keyboard_check(ord("A")) || keyboard_check(vk_left)	|| (gamepad_axis_value(3, gp_axislh) < 0)	|| gamepad_button_check_pressed(3, gp_padl);
	kRight			= keyboard_check(ord("D")) || keyboard_check(vk_right)	|| (gamepad_axis_value(3, gp_axislh) > 0)	|| gamepad_button_check_pressed(3, gp_padr);
	kUp			    = keyboard_check(ord("W")) || keyboard_check(vk_up)		|| (gamepad_axis_value(3, gp_axislv) < 0)	|| gamepad_button_check_pressed(3, gp_padu);
	kDown			= keyboard_check(ord("S")) || keyboard_check(vk_down)	|| (gamepad_axis_value(3, gp_axislv) > 0)	|| gamepad_button_check_pressed(3, gp_padd);
	kJump			= keyboard_check_pressed(ord("J"))	|| keyboard_check_pressed(ord("X"))		|| gamepad_button_check_pressed(3, gp_face1);
	kJumpRelease	= keyboard_check_released(ord("J"))	|| keyboard_check_released(ord("X"))	|| gamepad_button_check_released(3, gp_face1);
	kPickup			= keyboard_check_pressed(ord("K"))	|| keyboard_check_pressed(ord("C"))		|| gamepad_button_check_pressed(3, gp_face3);
	kSacrifice		= keyboard_check_pressed(ord("L"))	|| keyboard_check_pressed(ord("Z"))		|| gamepad_button_check_pressed(3, gp_face2)	|| gamepad_button_check_pressed(3, gp_face4);
	kEnter			= keyboard_check_pressed(vk_enter)	|| gamepad_button_check_pressed(3, gp_start);
	kExit			= keyboard_check_pressed(vk_escape);
	kShift			= keyboard_check_pressed(vk_shift)  || gamepad_button_check_pressed(3, gp_select);
}
// Player 2
else if (player == 2) {
	kLeft			= keyboard_check(ord("E")) || (gamepad_axis_value(0, gp_axislh) < 0)	|| gamepad_button_check_pressed(0, gp_padl);
	kRight			= keyboard_check(ord("R")) || (gamepad_axis_value(0, gp_axislh) > 0)	|| gamepad_button_check_pressed(0, gp_padr);
	kUp			    = keyboard_check(ord("T")) || (gamepad_axis_value(0, gp_axislv) < 0)	|| gamepad_button_check_pressed(0, gp_padu);
	kDown			= keyboard_check(ord("Y")) || (gamepad_axis_value(0, gp_axislv) > 0)	|| gamepad_button_check_pressed(0, gp_padd);
	kJump			= keyboard_check_pressed(ord("U"))		|| gamepad_button_check_pressed(0, gp_face1);
	kJumpRelease	= keyboard_check_released(ord("U"))		|| gamepad_button_check_released(0, gp_face1);
	kPickup			= keyboard_check_pressed(ord("I"))		|| gamepad_button_check_pressed(0, gp_face3);
	kSacrifice		= keyboard_check_pressed(ord("O"))		|| gamepad_button_check_pressed(0, gp_face2)	|| gamepad_button_check_pressed(0, gp_face4);
	kEnter			= gamepad_button_check_pressed(0, gp_start);
	kShift			= gamepad_button_check_pressed(0, gp_select);
}
// Player 3
else if (player == 3) {
	kLeft			= keyboard_check(ord("F"))	|| (gamepad_axis_value(1, gp_axislh) < 0)	|| gamepad_button_check_pressed(1, gp_padl);
	kRight			= keyboard_check(ord("G")) 	|| (gamepad_axis_value(1, gp_axislh) > 0)	|| gamepad_button_check_pressed(1, gp_padr);
	kUp			    = keyboard_check(ord("H")) 	|| (gamepad_axis_value(1, gp_axislv) < 0)	|| gamepad_button_check_pressed(1, gp_padu);
	kDown			= keyboard_check(ord("V")) 	|| (gamepad_axis_value(1, gp_axislv) > 0)	|| gamepad_button_check_pressed(1, gp_padd);
	kJump			= keyboard_check_pressed(ord("B"))		|| gamepad_button_check_pressed(1, gp_face1);
	kJumpRelease	= keyboard_check_released(ord("B"))		|| gamepad_button_check_released(1, gp_face1);
	kPickup			= keyboard_check_pressed(ord("N"))		|| gamepad_button_check_pressed(1, gp_face3);
	kSacrifice		= keyboard_check_pressed(ord("M"))		|| gamepad_button_check_pressed(1, gp_face2)	|| gamepad_button_check_pressed(1, gp_face4);
	kEnter			= gamepad_button_check_pressed(1, gp_start);
	kShift			= gamepad_button_check_pressed(1, gp_select);
}
// Player 4
else if (player == 4) {
	kLeft			= keyboard_check(vk_numpad0)	|| (gamepad_axis_value(2, gp_axislh) < 0)	|| gamepad_button_check_pressed(2, gp_padl);
	kRight			= keyboard_check(vk_numpad1) 	|| (gamepad_axis_value(2, gp_axislh) > 0)	|| gamepad_button_check_pressed(2, gp_padr);
	kUp			    = keyboard_check(vk_numpad2) 	|| (gamepad_axis_value(2, gp_axislv) < 0)	|| gamepad_button_check_pressed(2, gp_padu);
	kDown			= keyboard_check(vk_numpad3) 	|| (gamepad_axis_value(2, gp_axislv) > 0)	|| gamepad_button_check_pressed(2, gp_padd);
	kJump			= keyboard_check_pressed(vk_numpad4)		|| gamepad_button_check_pressed(2, gp_face1);
	kJumpRelease	= keyboard_check_released(vk_numpad4)		|| gamepad_button_check_released(2, gp_face1);
	kPickup			= keyboard_check_pressed(vk_numpad5)		|| gamepad_button_check_pressed(2, gp_face3);
	kSacrifice		= keyboard_check_pressed(vk_numpad6)		|| gamepad_button_check_pressed(2, gp_face2)	|| gamepad_button_check_pressed(2, gp_face4);
	kEnter			= gamepad_button_check_pressed(2, gp_start);
	kShift			= gamepad_button_check_pressed(2, gp_select);
}