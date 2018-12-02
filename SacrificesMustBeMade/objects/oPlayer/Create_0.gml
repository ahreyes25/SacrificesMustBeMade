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
jumpHeight  = 9.00  * m;
gravNorm    = 0.90  * m;
gravSlide   = 0.15  * m; 
clingTime   = 10.0  * m;

cLeft  = place_meeting(x - 1, y, oSolid_par);
cRight = place_meeting(x + 1, y, oSolid_par);

// Common calculation
sqrt2 = sqrt(2);

//Player States
enum humanState {
	IDLE, RUN, JUMP, FALL, WALLSLIDE, HURT, ALTER, PRAISE, SHAME
}

state			= humanState.IDLE;
isComputer		= false;
takesinput		= !isComputer;
canClingToWalls	= true;
facing			= 1;
player			= 1;
carrying		= noone;
hitStun			= 60;
inHitStun		= false;
image_xscale	= facing;
phy_active		= false;
masher			= noone;
mashing			= false;
alter			= noone;
points			= 0;
phy_fixed_rotation = true;

idleState		= humanState.IDLE;
runState		= humanState.RUN;
jumpState		= humanState.JUMP;
fallState		= humanState.FALL;
wallSlideState	= humanState.WALLSLIDE;
alterState		= humanState.ALTER;