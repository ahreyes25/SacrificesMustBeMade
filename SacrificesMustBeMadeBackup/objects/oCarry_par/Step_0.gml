if (attachedTo == noone) {
	phy_active = true;
	
	// Thrown at player
	var hit	= touching(oEntity_par);
	if (hit != noone && abs(phy_speed) >= 4 && lastAttachedTo != noone) {
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
}
else {
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
		depth = attachedTo.depth - 1;
	}
	else {
		attachedTo = noone;	
	}
}