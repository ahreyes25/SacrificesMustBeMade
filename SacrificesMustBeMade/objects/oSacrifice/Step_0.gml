// Not Carried
if (attachedTo == noone) {
	phy_active = true;
	
	var hit	= collision_rectangle(x - 12, y + 4, x + 12, y - 20, oEntity_par, false, true);
	if (hit != noone && abs(phy_speed) >= 4) {
		
	}
}
// Carried
else {
	phy_rotation = 0;
	phy_active   = false;
	
	if (instance_exists(attachedTo)) {
		phy_position_x = attachedTo.x;
		phy_position_y = attachedTo.y - 16;
		x = attachedTo.x;
		y = attachedTo.y - 16;
	}
	else {
		attachedTo = noone;	
	}
}