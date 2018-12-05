menu_input();
	
if (kEnter1 || kEnter2 || kEnter3 || kEnter4 || kJump1 || kJump2 || kJump3 || kJump4) {
	room_goto_next();	
	audio_stop_sound(sMenuSong);
}

if (kPickup1 || kPickup2 || kPickup3 || kPickup4 || 
	kSacrifice1 || kSacrifice2 || kSacrifice3 || kSacrifice4) {
	room_goto_previous();	
}

// Fullscreen
	if (kShift1 || kShift2 || kShift3 || kShift4)
		window_set_fullscreen(!window_get_fullscreen());