#region Input
var deadzoneSize = 0.7;
gamepad_set_axis_deadzone(0, deadzoneSize);
gamepad_set_axis_deadzone(1, deadzoneSize);
gamepad_set_axis_deadzone(2, deadzoneSize);
gamepad_set_axis_deadzone(3, deadzoneSize);

kLeft1			= keyboard_check(ord("A")) || keyboard_check(vk_left)	|| (gamepad_axis_value(3, gp_axislh) < 0)	|| gamepad_button_check_pressed(3, gp_padl);
kRight1			= keyboard_check(ord("D")) || keyboard_check(vk_right)	|| (gamepad_axis_value(3, gp_axislh) > 0)	|| gamepad_button_check_pressed(3, gp_padr);
kUp1			= keyboard_check(ord("W")) || keyboard_check(vk_up)		|| (gamepad_axis_value(3, gp_axislv) < 0)	|| gamepad_button_check_pressed(3, gp_padu);
kDown1			= keyboard_check(ord("S")) || keyboard_check(vk_down)	|| (gamepad_axis_value(3, gp_axislv) > 0)	|| gamepad_button_check_pressed(3, gp_padd);
kJump1			= keyboard_check_pressed(ord("J"))	|| keyboard_check_pressed(ord("X"))		|| gamepad_button_check_pressed(3, gp_face1);
kJumpRelease1	= keyboard_check_released(ord("J"))	|| keyboard_check_released(ord("X"))	|| gamepad_button_check_released(3, gp_face1);
kPickup1		= keyboard_check_pressed(ord("K"))	|| keyboard_check_pressed(ord("C"))		|| gamepad_button_check_pressed(3, gp_face3);
kSacrifice1		= keyboard_check_pressed(ord("L"))	|| keyboard_check_pressed(ord("Z"))		|| gamepad_button_check_pressed(3, gp_face2)	|| gamepad_button_check_pressed(3, gp_face4);
kEnter1			= keyboard_check_pressed(vk_enter)	|| gamepad_button_check_pressed(3, gp_start);
kExit1			= keyboard_check_pressed(vk_escape)	|| gamepad_button_check_pressed(3, gp_select);

kLeft2			= keyboard_check(ord("E")) || (gamepad_axis_value(0, gp_axislh) < 0)	|| gamepad_button_check_pressed(0, gp_padl);
kRight2			= keyboard_check(ord("R")) || (gamepad_axis_value(0, gp_axislh) > 0)	|| gamepad_button_check_pressed(0, gp_padr);
kUp2			= keyboard_check(ord("T")) || (gamepad_axis_value(0, gp_axislv) < 0)	|| gamepad_button_check_pressed(0, gp_padu);
kDown2			= keyboard_check(ord("Y")) || (gamepad_axis_value(0, gp_axislv) > 0)	|| gamepad_button_check_pressed(0, gp_padd);
kJump2			= keyboard_check_pressed(ord("U"))		|| gamepad_button_check_pressed(0, gp_face1);
kJumpRelease2	= keyboard_check_released(ord("U"))		|| gamepad_button_check_released(0, gp_face1);
kPickup2		= keyboard_check_pressed(ord("I"))		|| gamepad_button_check_pressed(0, gp_face3);
kSacrifice2		= keyboard_check_pressed(ord("O"))		|| gamepad_button_check_pressed(0, gp_face2)	|| gamepad_button_check_pressed(0, gp_face4);
kEnter2			= gamepad_button_check_pressed(0, gp_start);
kExit2			= gamepad_button_check_pressed(0, gp_select);

kLeft3			= keyboard_check(ord("F"))	|| (gamepad_axis_value(1, gp_axislh) < 0)	|| gamepad_button_check_pressed(1, gp_padl);
kRight3			= keyboard_check(ord("G")) 	|| (gamepad_axis_value(1, gp_axislh) > 0)	|| gamepad_button_check_pressed(1, gp_padr);
kUp3			= keyboard_check(ord("H")) 	|| (gamepad_axis_value(1, gp_axislv) < 0)	|| gamepad_button_check_pressed(1, gp_padu);
kDown3			= keyboard_check(ord("V")) 	|| (gamepad_axis_value(1, gp_axislv) > 0)	|| gamepad_button_check_pressed(1, gp_padd);
kJump3			= keyboard_check_pressed(ord("B"))		|| gamepad_button_check_pressed(1, gp_face1);
kJumpRelease3	= keyboard_check_released(ord("B"))		|| gamepad_button_check_released(1, gp_face1);
kPickup3		= keyboard_check_pressed(ord("N"))		|| gamepad_button_check_pressed(1, gp_face3);
kSacrifice3		= keyboard_check_pressed(ord("M"))		|| gamepad_button_check_pressed(1, gp_face2)	|| gamepad_button_check_pressed(1, gp_face4);
kEnter3			= gamepad_button_check_pressed(1, gp_start);
kExit3			= gamepad_button_check_pressed(1, gp_select);

kLeft4			= keyboard_check(vk_numpad0)	|| (gamepad_axis_value(2, gp_axislh) < 0)	|| gamepad_button_check_pressed(2, gp_padl);
kRight4			= keyboard_check(vk_numpad1) 	|| (gamepad_axis_value(2, gp_axislh) > 0)	|| gamepad_button_check_pressed(2, gp_padr);
kUp4			= keyboard_check(vk_numpad2) 	|| (gamepad_axis_value(2, gp_axislv) < 0)	|| gamepad_button_check_pressed(2, gp_padu);
kDown4			= keyboard_check(vk_numpad3) 	|| (gamepad_axis_value(2, gp_axislv) > 0)	|| gamepad_button_check_pressed(2, gp_padd);
kJump4			= keyboard_check_pressed(vk_numpad4)		|| gamepad_button_check_pressed(2, gp_face1);
kJumpRelease4	= keyboard_check_released(vk_numpad4)		|| gamepad_button_check_released(2, gp_face1);
kPickup4		= keyboard_check_pressed(vk_numpad5)		|| gamepad_button_check_pressed(2, gp_face3);
kSacrifice4		= keyboard_check_pressed(vk_numpad6)		|| gamepad_button_check_pressed(2, gp_face2)	|| gamepad_button_check_pressed(2, gp_face4);
kEnter4			= gamepad_button_check_pressed(2, gp_start);
kExit4			= gamepad_button_check_pressed(2, gp_select);
#endregion

if (kEnter1)
	if (p1in == in.CPU)
		p1in = in.CONTROLLER;
	else if (p1in == in.CONTROLLER)
		p1in = in.SELECT;

if (kEnter2)
	if (p2in == in.CPU)
		p2in = in.CONTROLLER;
	
if (kEnter3)
	if (p3in == in.CPU)
		p3in = in.CONTROLLER;

if (kEnter4)
	if (p4in == in.CPU)
		p4in = in.CONTROLLER;
		
if (kRight1)
	p1val++;
if (kLeft1)
	p1val--;
		
if (!gamepad_is_connected(0))
	p2in = in.CPU;
	
if (!gamepad_is_connected(1))
	p3in = in.CPU;
	
if (!gamepad_is_connected(2))
	p4in = in.CPU;