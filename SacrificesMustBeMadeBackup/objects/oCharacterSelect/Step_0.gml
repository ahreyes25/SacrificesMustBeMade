if (room == asset_get_index("rmCharacter")) {
#region Input
var deadzoneSize = 0.7;
gamepad_set_axis_deadzone(0, deadzoneSize);
gamepad_set_axis_deadzone(1, deadzoneSize);
gamepad_set_axis_deadzone(2, deadzoneSize);
gamepad_set_axis_deadzone(3, deadzoneSize);

kLeft1			= keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)	|| (gamepad_axis_value(3, gp_axislh) < 0)	|| gamepad_button_check_pressed(3, gp_padl);
kRight1			= keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)	|| (gamepad_axis_value(3, gp_axislh) > 0)	|| gamepad_button_check_pressed(3, gp_padr);
kUp1			= keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)		|| (gamepad_axis_value(3, gp_axislv) < 0)	|| gamepad_button_check_pressed(3, gp_padu);
kDown1			= keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)	|| (gamepad_axis_value(3, gp_axislv) > 0)	|| gamepad_button_check_pressed(3, gp_padd);
kJump1			= keyboard_check_pressed(ord("J"))	|| keyboard_check_pressed(ord("X"))		|| gamepad_button_check_pressed(3, gp_face1);
kJumpRelease1	= keyboard_check_released(ord("J"))	|| keyboard_check_released(ord("X"))	|| gamepad_button_check_released(3, gp_face1);
kPickup1		= keyboard_check_pressed(ord("K"))	|| keyboard_check_pressed(ord("C"))		|| gamepad_button_check_pressed(3, gp_face3);
kSacrifice1		= keyboard_check_pressed(ord("L"))	|| keyboard_check_pressed(ord("Z"))		|| gamepad_button_check_pressed(3, gp_face2)	|| gamepad_button_check_pressed(3, gp_face4);
kEnter1			= keyboard_check_pressed(vk_enter)	|| gamepad_button_check_pressed(3, gp_start);
kExit1			= keyboard_check_pressed(vk_escape);
kShift1			= keyboard_check_pressed(vk_shift)  || gamepad_button_check_pressed(3, gp_select);

kLeft2			= keyboard_check_pressed(ord("E")) || (gamepad_axis_value(0, gp_axislh) < 0)	|| gamepad_button_check_pressed(0, gp_padl);
kRight2			= keyboard_check_pressed(ord("R")) || (gamepad_axis_value(0, gp_axislh) > 0)	|| gamepad_button_check_pressed(0, gp_padr);
kUp2			= keyboard_check_pressed(ord("T")) || (gamepad_axis_value(0, gp_axislv) < 0)	|| gamepad_button_check_pressed(0, gp_padu);
kDown2			= keyboard_check_pressed(ord("Y")) || (gamepad_axis_value(0, gp_axislv) > 0)	|| gamepad_button_check_pressed(0, gp_padd);
kJump2			= keyboard_check_pressed(ord("U"))		|| gamepad_button_check_pressed(0, gp_face1);
kJumpRelease2	= keyboard_check_released(ord("U"))		|| gamepad_button_check_released(0, gp_face1);
kPickup2		= keyboard_check_pressed(ord("I"))		|| gamepad_button_check_pressed(0, gp_face3);
kSacrifice2		= keyboard_check_pressed(ord("O"))		|| gamepad_button_check_pressed(0, gp_face2)	|| gamepad_button_check_pressed(0, gp_face4);
kEnter2			= gamepad_button_check_pressed(0, gp_start);
kShift2			= gamepad_button_check_pressed(0, gp_select);

kLeft3			= keyboard_check_pressed(ord("F"))	|| (gamepad_axis_value(1, gp_axislh) < 0)	|| gamepad_button_check_pressed(1, gp_padl);
kRight3			= keyboard_check_pressed(ord("G")) 	|| (gamepad_axis_value(1, gp_axislh) > 0)	|| gamepad_button_check_pressed(1, gp_padr);
kUp3			= keyboard_check_pressed(ord("H")) 	|| (gamepad_axis_value(1, gp_axislv) < 0)	|| gamepad_button_check_pressed(1, gp_padu);
kDown3			= keyboard_check_pressed(ord("V")) 	|| (gamepad_axis_value(1, gp_axislv) > 0)	|| gamepad_button_check_pressed(1, gp_padd);
kJump3			= keyboard_check_pressed(ord("B"))		|| gamepad_button_check_pressed(1, gp_face1);
kJumpRelease3	= keyboard_check_released(ord("B"))		|| gamepad_button_check_released(1, gp_face1);
kPickup3		= keyboard_check_pressed(ord("N"))		|| gamepad_button_check_pressed(1, gp_face3);
kSacrifice3		= keyboard_check_pressed(ord("M"))		|| gamepad_button_check_pressed(1, gp_face2)	|| gamepad_button_check_pressed(1, gp_face4);
kEnter3			= gamepad_button_check_pressed(1, gp_start);
kShift3			= gamepad_button_check_pressed(1, gp_select);

kLeft4			= keyboard_check_pressed(vk_numpad0)	|| (gamepad_axis_value(2, gp_axislh) < 0)	|| gamepad_button_check_pressed(2, gp_padl);
kRight4			= keyboard_check_pressed(vk_numpad1) 	|| (gamepad_axis_value(2, gp_axislh) > 0)	|| gamepad_button_check_pressed(2, gp_padr);
kUp4			= keyboard_check_pressed(vk_numpad2) 	|| (gamepad_axis_value(2, gp_axislv) < 0)	|| gamepad_button_check_pressed(2, gp_padu);
kDown4			= keyboard_check_pressed(vk_numpad3) 	|| (gamepad_axis_value(2, gp_axislv) > 0)	|| gamepad_button_check_pressed(2, gp_padd);
kJump4			= keyboard_check_pressed(vk_numpad4)		|| gamepad_button_check_pressed(2, gp_face1);
kJumpRelease4	= keyboard_check_released(vk_numpad4)		|| gamepad_button_check_released(2, gp_face1);
kPickup4		= keyboard_check_pressed(vk_numpad5)		|| gamepad_button_check_pressed(2, gp_face3);
kSacrifice4		= keyboard_check_pressed(vk_numpad6)		|| gamepad_button_check_pressed(2, gp_face2)	|| gamepad_button_check_pressed(2, gp_face4);
kEnter4			= gamepad_button_check_pressed(2, gp_start);
kShift4			= gamepad_button_check_pressed(2, gp_select);
#endregion

#region Controller Registration
if (!gamepad_is_connected(0))
	p2in = in.CPU;
	
if (!gamepad_is_connected(1))
	p3in = in.CPU;
	
if (!gamepad_is_connected(2))
	p4in = in.CPU;
#endregion
	
#region Next State
if (kEnter1 || kJump1)
	if (p1in == in.CPU) {
		p1in = in.CONTROLLER;
		numberOfPlayers++;
		p1comp = false;
	}
	else if (p1in == in.CONTROLLER)
		p1in = in.SELECT;
	else if (p1in == in.SELECT) {
		p1in = in.READY;
		numberReady++;
	}

if (kEnter2 || kJump2)
	if (p2in == in.CPU) {
		p2in = in.CONTROLLER;
		numberOfPlayers++;
		p2comp = false;
	}
	else if (p2in == in.CONTROLLER)
		p2in = in.SELECT;
	else if (p2in == in.SELECT) {
		p2in = in.READY;
		numberReady++;
	}
	
if (kEnter3 || kJump3)
	if (p3in == in.CPU) {
		p3in = in.CONTROLLER;
		numberOfPlayers++;
		p3comp = false;
	}
	else if (p3in == in.CONTROLLER)
		p3in = in.SELECT;
	else if (p3in == in.SELECT) {
		p3in = in.READY;
		numberReady++;
	}

if (kEnter4 || kJump4)
	if (p4in == in.CPU) {
		p4in = in.CONTROLLER;
		numberOfPlayers++;
		p4comp = false;
	}
	else if (p4in == in.CONTROLLER)
		p4in = in.SELECT;
	else if (p4in == in.SELECT) {
		p4in = in.READY;
		numberReady++;
	}
#endregion
	
#region Character Select
if (kRight1 && p1in = in.SELECT)
	if (p1val < numberOfSkins)
		p1val++;
	else 
		p1val = 1;

if (kLeft1 && p1in = in.SELECT)
	if (p1val > 1)
		p1val--;
	else
		p1val = numberOfSkins;
#endregion

#region Fullscreen
kFull = kShift1 || kShift2 || kShift3 || kShift4;

if (kExit1)
    game_end();	

// Fullscreen
if (kFull) {
	window_set_fullscreen(!window_get_fullscreen());
}	
#endregion

#region Previous State
if (kShift1 || kPickup1 || kSacrifice1)
	//if (p1in == in.CONTROLLER) {
	//	p1in = in.CPU;
	//	numberOfPlayers--;
	//	p1comp = true;
	//}
	if (p1in == in.SELECT)
		p1in = in.CONTROLLER;
	else if (p1in == in.READY) {
		p1in = in.SELECT;
		numberReady--;
	}

if (kShift2 || kPickup2 || kSacrifice2)
	if (p2in == in.CONTROLLER) {
		p2in = in.CPU;
		numberOfPlayers--;
		p2comp = true;
	}
	else if (p2in == in.SELECT)
		p2in = in.CONTROLLER;
	else if (p2in == in.READY) {
		p2in = in.SELECT;
		numberReady--;
	}
	
if (kShift3 || kPickup3 || kSacrifice3)
	if (p3in == in.CONTROLLER) {
		p3in = in.CPU;
		numberOfPlayers--;
		p3comp = true;
	}
	else if (p3in == in.SELECT)
		p3in = in.CONTROLLER;
	else if (p3in == in.READY) {
		p3in = in.SELECT;
		numberReady--;
	}

if (kShift4 || kPickup4 || kSacrifice4)
	if (p4in == in.CONTROLLER) {
		p4in = in.CPU;
		numberOfPlayers--;
		p4comp = true;
	}
	else if (p4in == in.SELECT)
		p4in = in.CONTROLLER;
	else if (p4in == in.READY) {
		p4in = in.SELECT;
		numberReady--;
	}
#endregion

if (numberReady == numberOfPlayers)
	if (alarm[0] == -1) 
		alarm[0] = waitTime;
	
}