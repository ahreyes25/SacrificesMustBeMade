if (kJump) { 
	state = jumpState;
	
	if (onGround) {
		// Fall thru platform
		if (kDown) {
		    if (place_meeting(x, y + 1, oPass_par))
		        ++y;
		} else {
		    vy = -jumpHeight;
			audio_play_sound(sfxHit2, 0, 0);
		}
	}
}
// Variable jumping
else if (kJumpRelease) { 
	if (vy < 0)
		vy *= 0.25;
}

phy_position_y = y;