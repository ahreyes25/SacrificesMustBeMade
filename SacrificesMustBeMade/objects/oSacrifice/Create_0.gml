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
disabled		= false;

idleState		= sacrificeState.IDLE;
fallState		= sacrificeState.FALL;

var fix	= physics_fixture_create();
physics_fixture_set_box_shape(fix, 8, 8);
physics_fixture_set_density(fix, 1);
physics_fixture_set_restitution(fix, 0.1);
physics_fixture_set_linear_damping(fix, 0.1);
physics_fixture_set_collision_group(fix, -1);
physics_fixture_set_angular_damping(fix, 0.1);
physics_fixture_set_friction(fix, 0.2);
physics_fixture_bind_ext(fix, id, 0, 8)
physics_fixture_delete(fix);
