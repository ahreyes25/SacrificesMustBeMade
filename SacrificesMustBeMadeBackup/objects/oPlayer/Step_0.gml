if (!oGame.paused) {
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
			var nearestSac = instance_nearest(x, y, oSacrifice);
			target = nearestSac;
			seeking = nearestSac;
		}
	
		#region Assign target
		if (seeking != noone) {
			if (instance_exists(seeking)) {
			
				// Draw Vector Directly To seeking
				var hit = collision_line(x, y, seeking.x, seeking.y, seeking.object_index, false, true);
				if (hit != noone) {
				
					// Can See seeking Directly
					if (hit.object_index == seeking.object_index) {
						target = seeking;
					}
					// Cannot See seeking Directly, Check For Crate
					else {
						// Check for nearest crate
						var closestCrate = instance_nearest(x, y, oCrate);
						if (closestCrate != noone) {
							var cHit = collision_line(x, y, closestCrate.x, closestCrate.y, oCrate, false, true);
							if (cHit != noone) {
								target = closestCrate;
								seeking = target;
							}
							// Cannot See Crate, Go To Player
							else {
								target = oGame.p1;	
								seeking = target;
							}
						}
					}
				}
			}
		}
		#endregion
		
		#region Move To Target
		if (target != noone) {
			if (instance_exists(target)) {
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
		
					// Fall through platforms
					if (touching(oPass_par) && target.y > y) {
						kDown = true;	
						kJump = true;
					}
				}
		
				// Vertically Move
				if (yThresh) {
					// Jump to target
					if (y > target.y && xThresh) {
						kJump = true;	
					}
				}
			}
		}
		#endregion
		
		#region Pickup Sacrifice
		if (touching(oSacrifice) && carrying == noone && !touching(oAltar)) {
			kPickup = true;
		}
		// Drop Crate to pickup sacrifice
		else if (touching(oSacrifice) && carrying != noone && !touching(oAltar)) {
			if (carrying.object_index == oCrate) {
				kUp = true;
				kPickup = true;
			}
		}
		#endregion

		#region Pickup Crate
		// Pickup Crate
		var c = touching(oCrate);
			if (c != noone) {
			if (c.phy_speed == 0 && !touching(oSacrifice) && carrying == noone) {
				if (canPickupCrate) {
					kPickup = true;	
				}
			}
			}
		#endregion

		#region Carrying Sacrifice 
		if (instance_exists(oSacrifice) && carrying != noone) {
			if (instance_exists(oAltar) && carrying.object_index == oSacrifice.object_index) {
				var nearestAltar = instance_nearest(x, y, oAltar);
				seeking = nearestAltar;	
				target  = nearestAltar;
			}
		}
		#endregion
	
		#region Carrying Box
		if (carrying != noone) {
			if (carrying.object_index = oCrate.object_index) {
				var hit;
			
				var nearPlayer = instance_nearest(oAltar.x, oAltar.y, oPlayer);
			
				// Look Right & Left
				hit = collision_line(x, y, nearPlayer.x, y, oPlayer, false, true);
				if (hit != noone) {
					// Throw Right
					if (hit.x > x) {
						kRight = true;
						kPickup = true;
					}
					else {
						kLeft = true;
						kPickup = true;
					}
				
					if (alarm[5] == -1) {
						alarm[5] = 30; // crate pickup cooldown
						canPickupCrate = false;
					}
				}
				// Look Up & Down
				else {
					hit = collision_line(x, y, x, nearPlayer.y, oPlayer, false, true);
					if (hit != noone) {
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
				
					if (alarm[5] == -1) {
						alarm[5] = 30; // crate pickup cooldown
						canPickupCrate = false;
					}
				}
			
				// Set Target Once Holding Crate
				var nearSac = instance_nearest(x, y, oSacrifice);
				target = nearSac;
				seeking = nearSac;
			}
		}
		#endregion
	
		#region Touching Altar
		if (touching(oAltar)) {
			altar = instance_nearest(x, y, oAltar);
			// Put Down Sacrifice
			if (carrying != noone) {
				if (carrying.object_index == oSacrifice) {
					kDown = true;
					kPickup = true;	
				}
				else {
					var nearestP = instance_nearest(x, y, oPlayer);
					if (nearestP.x > x) {
						kRight = true;
						kPickup = true;
					}
					else {
						kLeft = true;
						kPickup = true;
					}
				}
			}
			// Start Mashing
			else {
				if (altar != noone) {
					if (altar.victim != noone) {
						if (altar.victim.phy_speed == 0) {
							// Enter into mashing state
							if (!mashing) {
								kSacrifice = true;	
							}
							// Start Mashing
							else {
								if (alarm[3] == -1) {
									alarm[3] = irandom_range(mashSpeedMin, mashSpeedMax);
							
									if (masher != noone) 
										if (instance_exists(masher)) 
											masher.kSacrifice = true;
								}
								else {
									if (masher != noone)
										if (instance_exists(masher))
											masher.kSacrifice = false;	
								}
							}
						}
					}
					// Mash Until no longer  mashing if sacrifice gets stolen
					else {
						if (mashing) {
							if (alarm[3] == -1) {
								alarm[3] = irandom_range(mashSpeedMin, mashSpeedMax);
							
								if (masher != noone) 
									if (instance_exists(masher)) 
										masher.kSacrifice = true;
							}
							else {
								if (masher != noone)
									if (instance_exists(masher))
										masher.kSacrifice = false;	
							}	
						}
					}
				}
			}
		}
		#endregion
	
		#region Not Holding Anything
		if (carrying == noone) {
			var nearestSac = instance_nearest(x, y, oSacrifice);
			seeking = nearestSac;
			target = nearestSac;
		}
		#endregion
	
		#region Reassign Target To Crate
		if (target != noone) {
			if (instance_exists(target)) {
				if (target.object_index == oSacrifice) {
					if (target.attachedTo != noone) {
						var nearCrate = instance_nearest(x, y, oCrate);
						target = nearCrate;
						seeking = nearCrate;
					}
				}
			}
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
}
counter++;