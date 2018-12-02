if (kPickup) {
	// Pickup Sacrifice
	if (carrying == noone) {
		if (place_meeting(x, y, oSacrifice)) {
			var sac	= touching(oSacrifice);
			
			if (sac != noone) {
				sac.attachedTo	= id;
				carrying		= sac;
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
			physics_apply_impulse(x, y, xforce, yforce / 2);
		}
		
		carrying.attachedTo = noone;
		carrying			= noone;
	}			
}