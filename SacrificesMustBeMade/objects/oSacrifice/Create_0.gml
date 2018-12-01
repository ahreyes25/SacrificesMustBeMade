// Inherit the parent event
event_inherited();

// Multiplier
m = 0.5;

groundAccel = 3.50  * m;
groundFric  = 2.75  * m;
airAccel    = 2.50  * m;
airFric     = 0.70  * m;
vxMax       = 4.50  * m;
vyMax       = 8.00  * m;
jumpHeight  = 8.00  * m;
gravNorm    = 0.90  * m;
gravSlide   = 0.15  * m; 
clingTime   = 60.0  * m;

// Common calculation
sqrt2 = sqrt(2);

//Player States
enum sacrificeState {
	IDLE, FALL
}

state			= sacrificeState.IDLE;
takesinput		= false;
canClingToWalls = false;
facing			= 1;
image_xscale	= facing;
attachedTo		= noone;

idleState		= sacrificeState.IDLE;
fallState		= sacrificeState.FALL;