if (!isComputer && !inHitStun && !mashing && !finishing)
	wall_cling_with_input();

apply_gravity_wall_slide();
apply_gravity();

if (!isComputer && !inHitStun && !mashing && !finishing) {
	move_with_input();
	wall_jump_with_input();
	jump_with_input();
}

// - - - - - - - - - - - - - - - - 

// Pickup Sacrifice
if (!isComputer && !inHitStun && !mashing && !finishing) {
	pickup_sacrifice_with_input();	
}

// Sacrifice at altar
if (!inHitStun && !mashing && !finishing) {
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
}

// Break out of mashing
if (mashing) {
	var hit	= touching(oAltar);
	if (hit == noone) {
		mashing = false;
		
		with (masher)
			instance_destroy();
			
		masher = noone;
	}
}

// Hitstun state
if (inHitStun) {
	state = humanState.HURT;	
}

counter++;