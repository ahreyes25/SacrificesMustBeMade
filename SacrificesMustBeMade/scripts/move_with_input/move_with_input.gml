var tempAccel, tempFric;

if (onGround) {
	tempAccel = groundAccel;
	tempFric  = groundFric;
}
else {
	tempAccel = airAccel;
	tempFric  = airFric;
}

// Left 
if (kLeft && !kRight) {
	// Apply acceleration left
	if (vx > 0)
	    vx = approach(vx, 0, tempFric);   
	vx = approach(vx, -vxMax, tempAccel);
	
	if (onGround)
		state = runState;

	facing = -1;
}

// Right 
if (kRight && !kLeft) {
	// Apply acceleration right
	if (vx < 0)
	    vx = approach(vx, 0, tempFric);   
	vx = approach(vx, vxMax, tempAccel);
	
	if (onGround)
		state = runState;

	facing = 1;
}

// Idle
if (!kRight && !kLeft && onGround) {
	state = idleState;
}

// Friction
if (!kRight && !kLeft)
	vx = approach(vx, 0, tempFric); 