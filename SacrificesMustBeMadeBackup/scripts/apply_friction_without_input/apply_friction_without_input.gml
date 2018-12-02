// Acceleration & Frciton
var tempAccel, tempFric;

if (onGround) {
	tempAccel = groundAccel;
	tempFric  = groundFric;
}
else {
	tempAccel = airAccel;
	tempFric  = airFric;
}

// Apply Friction
vx = approach(vx, 0, tempFric); 