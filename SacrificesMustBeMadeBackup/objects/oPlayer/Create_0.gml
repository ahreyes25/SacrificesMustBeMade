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
jumpHeight  = 10.0  * m;
gravNorm    = 0.90  * m;
gravSlide   = 0.15  * m; 
clingTime   = 10.0  * m;

cLeft  = place_meeting(x - 1, y, oSolid_par);
cRight = place_meeting(x + 1, y, oSolid_par);

// Common calculation
sqrt2 = sqrt(2);

//Player States
enum humanState {
	IDLE, RUN, JUMP, FALL, WALLSLIDE, HURT, ALTAR, ALTARFINISH, PRAISE, SHAME
}

state				= humanState.IDLE;
isComputer			= false;
takesinput			= !isComputer;
canClingToWalls		= true;
facing				= 1;
player				= 1;
carrying			= noone;
hitStun				= 60;
inHitStun			= false;
image_xscale		= facing;
phy_active			= false;
masher				= noone;
mashing				= false;
altar				= noone;
points				= 0;
name				= "";
counter				= 0;
finishing			= false;
phy_fixed_rotation	= true;
skulls				= ds_list_create();
showIconTime		= 90;
showIcon			= false;

// CPU
target				= noone;
seeking				= noone;
mashDown			= false;
mashSpeedMin		= 5;
mashSpeedMax		= 10;

idleState			= humanState.IDLE;
runState			= humanState.RUN;
jumpState			= humanState.JUMP;
fallState			= humanState.FALL;
wallSlideState		= humanState.WALLSLIDE;
altarState			= humanState.ALTAR;
altarFinishState	= humanState.ALTARFINISH;

idleSprite			= asset_get_index("s" + string(name) + "_idle");
runSprite			= asset_get_index("s" + string(name) + "_run");
jumpSprite			= asset_get_index("s" + string(name) + "_jump");
hurtSprite			= asset_get_index("s" + string(name) + "_hurt");
altarSprite			= asset_get_index("s" + string(name) + "_kill");