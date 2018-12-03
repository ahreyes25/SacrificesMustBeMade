#region Player Controlled With Input
if (!isComputer) {
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
	// Set sacrifice as default starting target
	if (instance_exists(oSacrifice) && target == noone && seeking == noone) {
		target = oSacrifice;
		seeking = oSacrifice;
	}
	
	// Assign Correct seeking
	if (seeking != noone) {
		if (instance_exists(seeking)) {
			
			// Draw Vector Directly To seeking
			var hit = collision_line(x, y, seeking.x, seeking.y, seeking.object_index, false, true);
			if (hit != noone) {
				
				// Can See seeking Directly
				if (hit.object_index == seeking.object_index) {
					target = seeking;
				}
				// Cannot See seeking Directly, Go To Player
				else {
					target = oGame.p1;	
				}
			}
		}
	}
		
	var xDis = point_distance(x, y, target.x, y);
	var yDis = point_distance(x, y, x, target.y);
	var xThresh = xDis > 10;
	var yThresh = yDis > 25;
		
	// Horizontally Move
	if (xThresh) {
		if (x > target.x) {
			kLeft = true;	
		}
		else if (x < target.x) {
			kRight = true;	
		}
	}
		
	// Vertically Move
	if (yThresh) {
		// Jump to target
		if (y > target.y - 16 && xThresh) {
			kJump = true;	
		}
	}
		
	#region Pickup Sacrifice
	if (touching(oSacrifice) && carrying == noone && !touching(oAltar)) {
		kPickup = true;
	}
	#endregion

	#region Pickup Crate
	// Pickup Crate
	if (touching(oCrate) && !touching(oSacrifice) && carrying == noone) {
		kPickup = true;	
	}
	#endregion

	#region Carrying Sacrifice 
	if (instance_exists(oSacrifice) && carrying != noone) {
		if (instance_exists(oAltar) && carrying.object_index == oSacrifice.object_index) {
			seeking = oAltar;	
			target  = oAltar;
		}
	}
	#endregion
	
	#region Carrying Box
	if (carrying != noone) {
		if (carrying.object_index = oCrate.object_index) {
			var hit;
			
			// Look Right & Left
			hit = collision_line(x, y, oGame.p1.x, y, oPlayer, false, true);
			if (hit != noone) {
				if (hit.object_index == oPlayer) {
					// Throw Right
					if (hit.x > x) {
						kRight = true;
						kPickup = true;
					}
					else {
						kLeft = true;
						kPickup = true;
					}
				}
			}
			// Look Up & Down
			else {
				hit = collision_line(x, y, x, oGame.p1.y, oPlayer, false, true);
				if (hit != noone) {
					if (hit.object_index == oPlayer) {
						// Throw Down
						if (hit.y > y) {
							kDown = true;
							kPickup = true;
						}
						else {
							kUp = true;
							kPickup = true;
						}
					}
				}
			}
		}
	}
	#endregion
	
	#region Touching Altar
	if (touching(oAltar)) {
		// Put Down Sacrifice
		if (carrying != noone) {
			if (carrying.object_index == oSacrifice) {
				kDown = true;
				kPickup = true;	
			}
		}
		// Start Mashing
		else {
			if (oAltar.victim != noone) {
				if (oAltar.victim.phy_speed == 0) {
					// Enter into mashing state
					if (!mashing) {
						kSacrifice = true;	
					}
					// Start Mashing
					else {
						if (alarm[3] == -1) {
							alarm[3] = mashSpeed;	
						}
				
						if (masher != noone) {
							if (instance_exists(masher)) {
								masher.kSacrifice = mashDown;
								masher.kSacrificeUp = !mashDown;
							}
						}
					}
				}
			}
		}
	}
	#endregion
	
	#region Not Holding Anything
	if (carrying == noone) {
		seeking = oSacrifice;
		target = oSacrifice;
	}
	#endregion

	// - - - - - - - - - - - - - - - - - - - - -
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

counter++;