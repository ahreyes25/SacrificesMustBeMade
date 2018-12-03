// Player 1
if (player == 1) {
	kLeft			= keyboard_check(ord("A"));
	kRight			= keyboard_check(ord("D"));
	kUp			    = keyboard_check(ord("W"));
	kDown			= keyboard_check(ord("S"));

	kJump			= keyboard_check_pressed(ord("J"));
	kJumpRelease	= keyboard_check_released(ord("J"));

	kPickup			= keyboard_check_pressed(ord("K"));
	kSacrifice		= keyboard_check_pressed(ord("L"));
}
// Player 2
else if (player == 2) {
	kLeft			= keyboard_check(vk_left);
	kRight			= keyboard_check(vk_right);
	kUp			    = keyboard_check(vk_up);
	kDown			= keyboard_check(vk_down);

	kJump			= keyboard_check_pressed(ord("C"));
	kJumpRelease	= keyboard_check_released(ord("C"));

	kPickup			= keyboard_check_pressed(ord("X"));
	kSacrifice		= keyboard_check_pressed(ord("Z"));
	kSacrificeUp	= keyboard_check_released(ord("Z"));
}