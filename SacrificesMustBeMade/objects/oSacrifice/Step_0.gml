if (attachedTo == noone) {
	apply_gravity();
	apply_friction_without_input();		
}
else {
	if (instance_exists(attachedTo)) {
		x = attachedTo.x;
		y = attachedTo.y - 16;
	}
	else {
		attachedTo = noone;	
	}
}