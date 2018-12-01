// Reset wall cling
	if ((!cRight && !cLeft) || onGround) {
	    canStick = true;
	    sticking = false;
	} 

	// Cling to wall
	if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
	    alarm[0]	= clingTime;
	    sticking	= true; 
	    canStick	= false; 
		state		= wallSlideState;
		rollCheck	= 0;
	
		if (cLeft)
			facing = 1;
		if (cRight)
			facing = -1;
	}