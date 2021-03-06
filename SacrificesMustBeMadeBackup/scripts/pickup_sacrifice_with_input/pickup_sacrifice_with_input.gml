if (kPickup) {
	// Pickup Sacrifice
	if (carrying == noone) {
		if (place_meeting(x, y, oCarry_par)) {
			var sac	= touching(oCarry_par);
			
			if (sac != noone) {
				if (sac.attachedTo == noone) {
					sac.attachedTo	= id;
					carrying		= sac;
					audio_play_sound(sfxPickup1, 0, 0);
				}
			}
		}
	}
	// Drop Sacrifice
	else {
		var mult   = 3;
		var xforce = mult * sign(vx);
		
		if (kUp)
			var yforce = mult * -1;	
		else if (kDown)
			var yforce = mult;	
		else 
			var yforce = 0;
		
		with (carrying) {
			physics_apply_impulse(x, y, xforce, yforce * 0.75);
			audio_play_sound(sfxDoor1, 0, 0);
		}
		
		carrying.attachedTo = noone;
		carrying			= noone;
	}			
}