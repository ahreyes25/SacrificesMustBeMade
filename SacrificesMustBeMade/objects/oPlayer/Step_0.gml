if (!isComputer && !inHitStun && !mashing)
	wall_cling_with_input();

apply_gravity_wall_slide();
apply_gravity();

if (!isComputer && !inHitStun && !mashing) {
	move_with_input();
	wall_jump_with_input();
	jump_with_input();
}

// - - - - - - - - - - - - - - - - 

// Pickup Sacrifice
if (!isComputer && !inHitStun && !mashing) {
	pickup_sacrifice_with_input();	
}

// Sacrifice at alter
if (!inHitStun && !mashing) {
	var hit	= touching(oAlter);
	if (hit != noone) {
		if (kSacrifice && hit.victim != noone) {
			state = alterState;	
			
			// Create masher
			if (masher == noone) {
				masher = instance_create_layer(x, y, "Instances", oMasher);
				masher.owner = id;
				mashing = true;
				masher.player = player;
				alter = hit;
				masher.alter = alter;
				
				// Drop anything we're carrying
				if (carrying != noone) {
					carrying.attachedTo = noone;
					carrying = noone;
				}
			}
		}
	}
}

// Break out of mashing
if (mashing) {
	var hit	= touching(oAlter);
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







