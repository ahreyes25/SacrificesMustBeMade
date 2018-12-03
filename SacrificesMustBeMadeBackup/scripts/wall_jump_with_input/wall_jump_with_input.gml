if (kJump && cLeft && !onGround) {
	if (kLeft) {
		vy = -jumpHeight * 1.1;
		vx =  jumpHeight * .75;
	}
	else {
		vy = -jumpHeight * 1.1;
		vx =  vxMax;
	}  
	facing		= 1;
	rollCheck	= 0;
	state		= jumpState;
	audio_play_sound(sfxHit2, 0, 0);
}

if (kJump && cRight && !onGround) {
	if (kRight) {
		vy = -jumpHeight * 1.1;
		vx = -jumpHeight * .75;
	}
	else {
		vy = -jumpHeight * 1.1;
		vx = -vxMax;
	}  
	facing		= -1;
	rollCheck	= 0;
	state		= jumpState;
	audio_play_sound(sfxHit2, 0, 0);
} 