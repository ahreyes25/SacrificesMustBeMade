#region Not Carried
	if (attachedTo == noone && !dying) {
		phy_active = true;
	
		// Thrown at player
		var hit	= touching(oEntity_par);
		if (hit != noone && abs(phy_speed) >= 4 && lastAttachedTo != noone) {
			if (hit.id != lastAttachedTo.id) {
		
				var xforce = phy_linear_velocity_x / 500
				var yforce = phy_linear_velocity_y / 500;
		
				with (hit) {
					if (!inHitStun) {
						inHitStun    = true;
						phy_active   = true;
						alarm[1]	 = hitStun;
						mashing		 = false;
						finishing	 = false;
						
						// Destroy Masher
						if (masher != noone)
							with (masher) 
								instance_destroy();
								
						// Lose Connection To Sacrifice
						if (carrying != noone) {
							carrying.attachedTo = noone;
							carrying = noone;
						}

						state		 = humanState.HURT;
						phy_rotation = 0;
						physics_apply_impulse(x, y, xforce, yforce);
					}
				}
				
				depth = lastAttachedTo.depth + 1;
			}
		}
		
		if (!on_ground()) {
			if (state == idleState) {
				state = fallState;	
			}
		}
	}
#endregion

#region Carried
	else {
		if  (!dying) {
			//phy_rotation			= 0;
			phy_linear_velocity_x	= 0;
			phy_linear_velocity_y	= 0;
			phy_angular_velocity	= 0;
			phy_active				= false;
	
			if (instance_exists(attachedTo)) {
				x = attachedTo.x + (8 * attachedTo.image_xscale);
				y = attachedTo.y - 12;
				phy_position_x = x;
				phy_position_y = y;
				//image_xscale = attachedTo.image_xscale;
				lastAttachedTo = attachedTo;
				state = carryState;
			
				if (altar != noone) {
					altar.victim = noone;
					altar = noone;
				}
			}
			else {
				attachedTo = noone;	
				state = idleState;
			}
		}
	}
#endregion

#region Altar
	if (phy_speed == 0 && attachedTo == noone && !dying) {
		var hit	= touching(oAltar);
		if (hit != noone) {
			altar = hit;
			state = altarState;	
			
			phy_active = false;
			//x = hit.x;
			y = hit.y - 8;
			phy_angular_velocity = 0;
			//phy_linear_velocity_x = 0;
			//phy_linear_velocity_y = 0;
			phy_position_x = x;
			phy_position_y = y;
			
			hit.victim = id;
		}
	}
#endregion

if (dying) {
	if (image_alpha > 0)
		image_alpha -= 0.01;
	
	if (image_alpha <= 0)
		instance_destroy();
}
