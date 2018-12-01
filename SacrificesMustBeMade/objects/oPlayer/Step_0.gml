wall_cling_with_input();
apply_gravity_wall_slide();
apply_gravity();
move_with_input();
wall_jump_with_input();
jump_with_input();

if (kPickup) {
	if (carrying == noone) {
		if (place_meeting(x, y, oSacrifice)) {
			var sac	= collision_rectangle(x - 12, y + 4, x + 12, y - 20, oSacrifice, false, true);
			
			if (sac != noone) {
				sac.attachedTo	= id;
				carrying		= sac;
			}
		}
	}
	else {
		carrying.attachedTo = noone;
		carrying			= noone;
	}			
}