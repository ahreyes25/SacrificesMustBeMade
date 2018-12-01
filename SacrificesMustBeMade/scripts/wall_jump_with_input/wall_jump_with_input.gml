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
} 