#region Not Carried
	if (attachedTo == noone) {
		phy_active = true;
	
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
						state		 = humanState.HURT;
						phy_rotation = 0;
						physics_apply_impulse(x, y, xforce, yforce);
					}
				}
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
		phy_rotation			= 0;
		phy_linear_velocity_x	= 0;
		phy_linear_velocity_y	= 0;
		phy_angular_velocity	= 0;
		phy_active				= false;
	
		if (instance_exists(attachedTo)) {
			phy_position_x = attachedTo.x;
			phy_position_y = attachedTo.y - 16;
			x = attachedTo.x;
			y = attachedTo.y - 16;
			lastAttachedTo = attachedTo;
			state = carryState;
		}
		else {
			attachedTo = noone;	
			state = idleState;
		}
	}
#endregion

#region Alter
	if (phy_speed == 0 && attachedTo == noone) {
		var hit	= touching(oAlter);
		if (hit != noone) {
			state = alterState;	
			
			phy_active = false;
			x = hit.x;
			y = hit.y - 8;
			phy_position_x = x;
			phy_position_y = y;
			phy_rotation = 0;
			phy_angular_velocity = 0;
			phy_linear_velocity_x = 0;
			phy_linear_velocity_y = 0;
			
			hit.victim = id;
		}
	}
#endregion