#region Not Carried
	if (attachedTo == noone && !dying) {
		phy_active = true;
	
		/*
		// Thrown at player
		var hit	= touching(oEntity_par);
		if (hit != noone && abs(phy_speed) >= 4 && lastAttachedTo != noone && canHit) {
			if (hit.id != lastAttachedTo.id) {
		
				var xforce = phy_linear_velocity_x / 500
				var yforce = phy_linear_velocity_y / 500;
		
				with (hit) {
					if (!inHitStun) {
						
						if (hit.mashing) {
							oDragon.speaking = true;
							oDragon.phrase = get_dragon_phrase("bad");
							oDragon.mood = "mad";
							audio_play_sound(choose(sfxDragon1, sfxDragon2, sfxDragon3, sfxDragon4, sfxDragon5), 0, 0);	
						}
						
						inHitStun    = true;
						phy_active   = true;
						alarm[1]	 = hitStun;
						mashing		 = false;
						finishing	 = false;
						audio_play_sound(sfxHurt, 0, 0);
						blood_particles(10);
						
						// Destroy Masher
						if (masher != noone)
							with (masher) 
								instance_destroy();
						masher = noone;
								
						// Lose Connection To Sacrifice
						if (carrying != noone) {
							if (instance_exists(carrying.attachedTo))
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
		*/
		
		if (!on_ground()) {
			if (state == idleState) {
				state = fallState;	
			}
		}
	}
#endregion

#region Carried
	else {
		if (!dying) {
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
	
				lastAttachedTo = attachedTo;
				state = carryState;
				lockedX = noone;
				lockedToAltar = false;
				
				depth = attachedTo.depth - 1;
			
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
		
		// Touching Altar
		if (hit != noone) {
			altar = hit;
			state = altarState;	
			
			if (!lockedToAltar) {
				phy_position_x = x;
				lockedX = x;
				lockedToAltar = true;	
			}
			
			phy_active = false;
			x = lockedX;
			y = hit.y - 8;
			phy_angular_velocity = 0;
			phy_position_x = x;
			phy_position_y = y;
			
			hit.victim = id;
		}
		// Not touching Altar
		else {
			lockedToAltar = false
			lockedX = noone;
			phy_active = true;
			
			if (altar != noone) {
				altar.victim = noone;
				altar = noone;
			}
		}
	}
#endregion

if (dying) {
	if (image_alpha > 0)
		image_alpha -= 0.01;
	
	if (image_alpha <= 0)
		instance_destroy();
}
