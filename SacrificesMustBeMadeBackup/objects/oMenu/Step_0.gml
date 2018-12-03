// input variables for debug room traversal
var kRestart, kExit, kPrev, kNext;

kExit    = keyboard_check_pressed(vk_escape);
kEnter	 = keyboard_check_pressed(vk_enter);

if (kExit)
    game_end();	

// Fullscreen
if (kEnter) {
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
	
	
if (!kExit && !kEnter) {
	if (keyboard_check_pressed(vk_anykey)) {
		room_goto_next();	
	}
}