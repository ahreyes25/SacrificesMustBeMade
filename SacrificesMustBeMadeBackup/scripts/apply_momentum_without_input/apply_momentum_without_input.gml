var tempAccel, tempFric;

if (onGround) {
	tempAccel = groundAccel;
	tempFric  = groundFric;
}
else {
	tempAccel = airAccel;
	tempFric  = airFric;
}

// Apply momentum left
if (vx > 0) {
	vx = approach(vx, 0, tempFric);   
	vx = approach(vx, -vxMax, tempAccel);

	facing = -1;
}
else if (vx < 0) {
	vx = approach(vx, 0, tempFric);   
	vx = approach(vx, vxMax, tempAccel);

	facing = 1;
}