var hit	= touching(oAltar);
if (hit != noone) {
	if (kSacrifice && hit.victim != noone) {
		state = altarState;	
			
		// Create masher
		if (masher == noone) {
			masher = instance_create_layer(x, y, "Instances", oMasher);
			masher.owner = id;
			mashing = true;
			masher.player = player;
			altar = hit;
			masher.altar = altar;
			phy_linear_velocity_x = 0;
			phy_linear_velocity_y = 0;
			vx = 0;
			vy = 0;
				
			// Drop anything we're carrying
			if (carrying != noone) {
				carrying.attachedTo = noone;
				carrying = noone;
			}
		}
	}
}
else {
	altar = noone;	
}