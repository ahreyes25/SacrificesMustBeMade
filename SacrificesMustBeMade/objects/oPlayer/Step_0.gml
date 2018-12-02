#region Player Controlled With Input
if (!isComputer) {
	//check_for_sprites_assigned();

	if (!inHitStun && !mashing && !finishing)
		wall_cling_with_input();

	apply_gravity_wall_slide();
	apply_gravity();

	if (!inHitStun && !mashing && !finishing) {
		move_with_input();
		wall_jump_with_input();
		jump_with_input();
	}
	// - - - - - - - - - - - - - - - - - - - - -

	// Can act
	if (!inHitStun && !mashing && !finishing) {
		pickup_sacrifice_with_input();
		check_for_starting_sacrifice();
	}
	// Break out of mashing
	else if (mashing) {
		check_for_break_out_mash();
	}
	// Hitstun
	else if (inHitStun) {
		state = humanState.HURT;	
	}
}
#endregion

#region Computer Controlled
else {
	
}
#endregion

counter++;