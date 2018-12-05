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
		#region Not Running Away
		if (!runaway) {
			#region Set starting target
			if (instance_exists(oSacrifice) && target == noone) {
				var nearestSac = instance_nearest(x, y, oSacrifice);
				target = nearestSac;
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
				if (instance_exists(oAltar) && carrying.object_index == oSacrifice) {
					var nearestAltar = instance_nearest(x, y, oAltar);
					target  = nearestAltar;
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
					else if (carrying.object_index == oCrate) {
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
				// Not carrying anything at altar
				else {
					if (altar != noone) {
						// Victim at altar
						if (altar.victim != noone) {
							if (altar.victim.phy_speed == 0 && altar.nPlayersTouching == 1) {
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
							// Start running away
							else if (altar.victim.phy_speed == 0 && altar.nPlayersTouching > 1) {
								if (!mashing) {
									runaway = true;
									if (alarm[9] == -1) {
										alarm[9] = 150; // run for 5 seconds	
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
				
					if (target != noone) {
						if (instance_exists(target)) {
							if (target.object_index != oCpuTargetPoint) {
								target = instance_nearest(x, y, oSacrifice);
							}
						}
						else {
							target = instance_nearest(x, y, oSacrifice);
						}
					}
					else {
						target = instance_nearest(x, y, oSacrifice);
					}
				}
			}
			#endregion
	
			#region Reassign Target To Crate If Sac is Carried
			if (target != noone) {
				if (instance_exists(target)) {
					if (target.object_index == oSacrifice) {
						if (target.attachedTo != noone) {
							var nearCrate = instance_nearest(x, y, oCrate);
							target = nearCrate;
						}
					}
					else if (target.object_index == oCrate) {
						var nearCrate = instance_nearest(x, y, oCrate);
						target = nearCrate;	
					}
				}
			}			
			#endregion
		}
		#endregion
		
		#region Running Away
		else {
			// Go get sacrifice if it is not attached to anything
			var sac = instance_nearest(x, y, oSacrifice);
			if (sac.attachedTo == noone) {
				target = sac;
			}
			// Go Get crate instead
			else {
				// Dont Have Crate
				if (carrying == noone) {
					target = instance_nearest(x, y, oCrate);	
				}
				else {
					// Already Holding Crate
					if (carrying.object_index == oCrate) {
						target = sac;	
					}
				}
			}
			
			// Pickup Sacrifice
			if (touching(oSacrifice)) {
				if (carrying != noone) {
					if (carrying.object_index == oCrate) {
						kUp = true;
						kPickup = true;
					}
				}
				else {
					kPickup = true;
					target = instance_furthest(x, y, oCpuTargetPoint);
				}
			}
		}
		#endregion
		
		#region Carrying Box
		if (carrying != noone) {
			if (carrying.object_index = oCrate) {
				
				if (target != noone) {
					if (instance_exists(target)) {
						if (target.object_index != oCpuTargetPoint) {
							target = instance_nearest(x, y, oSacrifice);
						}
					}
				}
				
				var hit;
				var pd1 = 0;
				var pd2 = 0;
				var pd3 = 0;
				var pd4 = 0;
				var nearPlayer = noone;
				
				// Get player at altar
				if (nearPlayer == noone) {
					if (oAltar.victim != noone) {
						if (instance_exists(oAltar.victim)) {
							nearPlayer = instance_nearest(oAltar.x, oAltar.y, oPlayer);
							
							if (nearPlayer.id == id)
								nearPlayer = noone;
						}
					}
				}
				
				// Get player carrying sacrifice
				if (nearPlayer == noone) {
					if (instance_exists(oSacrifice)) {
						if (oSacrifice.attachedTo != noone) {
							if (instance_exists(oSacrifice.attachedTo)) {
								if (oSacrifice.attachedTo.id != id) {
									nearPlayer = oSacrifice.attachedTo;
								}
							}
						}
					}
				}

				// Get nearest player
				if (nearPlayer == noone) {
					if (oGame.p1 != noone) {
						if (instance_exists(oGame.p1)) {
							if (oGame.p1.id != id) {
								pd1 = point_distance(x, y, oGame.p1.x, oGame.p1.y);
							}
						}
					}
					if (oGame.p2 != noone) {
						if (instance_exists(oGame.p2)) {
							if (oGame.p2.id != id) {
								pd2 = point_distance(x, y, oGame.p2.x, oGame.p2.y);
							}
						}
					}
					if (oGame.p3 != noone) {
						if (instance_exists(oGame.p3)) {
							if (oGame.p3.id != id) {
								pd3 = point_distance(x, y, oGame.p3.x, oGame.p3.y);
							}
						}
					}
					if (oGame.p4 != noone) {
						if (instance_exists(oGame.p4)) {
							if (oGame.p4.id != id) {
								pd4 = point_distance(x, y, oGame.p4.x, oGame.p4.y);
							}
						}
					}
					
					var pmax = max(pd1, pd2, pd3, pd4);
					if (pmax == pd1) {
						var nearPlayer = oGame.p1;
					}
					else if (pmax == pd2) {
						var nearPlayer = oGame.p2;
					}
					else if (pmax == pd3) {
						var nearPlayer = oGame.p3;
					}
					else if (pmax == pd4) {
						var nearPlayer = oGame.p4;
					}
				}
			
				// Look Right & Left
				hit = collision_line(x, y, nearPlayer.x, y, oPlayer, false, true);
				if (hit != noone) {
					// Throw Right
					if (hit.x > x) {
						kRight = true;
						kPickup = true;
					}
					else if (hit.x < x) {
						kLeft = true;
						kPickup = true;
					}
					else {
						kUp = true;
						kPickup = true;
						kLeft = false;
						kRight = false;
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
							kLeft = false;
							kRight = false;
						}
						else {
							kUp = true;
							kPickup = true;
							kLeft = false;
							kRight = false;
						}
					}
				
					if (alarm[5] == -1) {
						alarm[5] = 30; // crate pickup cooldown
						canPickupCrate = false;
					}
				}
			}
		}
		#endregion
		
		#region Standing Still For Too Long
		if (x == xprevious && !mashing && !touching(oAltar)) {
			if (alarm[8] == -1) {
				alarm[8] = 120;
				xpos = x;
			}
		}
		else
			xpos = noone;
		#endregion
		
		#region At Target Point
		if (target != noone) {
			if (instance_exists(target)) {
				if (target.object_index == oCpuTargetPoint) {
					if (point_distance(x, y, target.x, target.y) < 75) {
						target = oSacrifice;	
					}
				}
			}
		}
		#endregion
		
		#region Not Doing Anything
		if (target == noone) {
			var nearestSac = instance_nearest(x, y, oSacrifice);
			target = nearestSac;
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
				}
		
				// Vertically Move
				if (yThresh) {
					// Jump to target
					if (y > target.y && xThresh) {
						kJump = true;	
					}
					// Fall through platforms
					else if (touching(oPass_par) && target.y > y) {
						kDown = true;	
						kJump = true;
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
		
		x = phy_position_x;
		y = phy_position_y;
		xprevious = phy_position_xprevious;
		yprevious = phy_position_yprevious;
	}
	#endregion
}
counter++;