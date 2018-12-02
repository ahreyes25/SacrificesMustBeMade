// Gravity
if (!onGround) {
	if (canClingToWalls) {
		if (!((cLeft || cRight) && vy >= 0)) {
			vy = approach(vy, vyMax, gravNorm);
		
			if (sign(vy) == 1) 
				state = fallState;
		}
	}
	else {
		vy = approach(vy, vyMax, gravNorm);
		
		if (sign(vy) == 1) 
			state = fallState;
	}
}