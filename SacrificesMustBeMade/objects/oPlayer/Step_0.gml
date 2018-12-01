if (!isComputer && !inHitStun)
	wall_cling_with_input();

apply_gravity_wall_slide();
apply_gravity();

if (!isComputer && !inHitStun) {
	move_with_input();
	wall_jump_with_input();
	jump_with_input();
}

// - - - - - - - - - - - - - - - - 

if (!isComputer && !inHitStun) {
	pickup_sacrifice();	
}
