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

screen_shake();

kFull = kShift1 || kShift2 || kShift3 || kShift4;

if (kExit1) {
    room_goto(rmMenu);	
	audio_stop_sound(sfxBlood);
	
	with (oCharacterSelect)
		instance_destroy();
		
	with (oBloodSurface)
		instance_destroy();
		
	with (oCamera)
		instance_destroy();
		
	with (oCenterOfMass)
		instance_destroy();
		
	instance_destroy();
}

// Fullscreen
if (kFull) {
	window_set_fullscreen(!window_get_fullscreen());
}	

// Gradually Shift Light Alpha
var minLight = 0.03;
var maxLight = 0.1;
lightAlpha += random_range(-0.001, 0.001);
lightAlpha = clamp(lightAlpha, minLight, maxLight);

if (lightAlpha > maxLight)
	lightAlpha = maxLight;
if (lightAlpha < minLight)
	lightAlpha = minLight;
	
// Pause
if (!countdown)
	if (kEnter1 || kEnter2 || kEnter3 || kEnter4)
		paused = !paused;
		
if (alarm[1] >= 0) {
	if (alarm[1] != 0) {
		if (alarm[1] mod 30 == 0) {
			audio_play_sound(sfxBlipLow, 0, 0);	
		}
	}
	else 
		audio_play_sound(sfxBlipHi, 0, 0);
}	

// End Game
if (gameWon && !endingGame) {
	endingGame = true;
	if (alarm[2] == -1) {
		alarm[2] = 300;	
	}
	
	// Destroy all players
	with (oPlayer) {
		if (id != oGame.winner.id) {
			instance_destroy();	
		}
	}
}