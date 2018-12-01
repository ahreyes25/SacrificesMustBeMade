if (canClingToWalls) {
	if (!onGround) {	
		if ((cLeft || cRight) && vy >= 0) {
			vy = approach(vy, vyMax, gravSlide);
			state = wallSlideState;
		}
	}
}