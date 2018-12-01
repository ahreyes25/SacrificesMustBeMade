/// @description Hit Stun

if (phy_speed != 0) {
	alarm[1] = 1;	
}
else {
	inHitStun				= false;
	phy_rotation			= 0;
	phy_linear_velocity_x	= 0;
	phy_linear_velocity_y	= 0;
	phy_angular_velocity	= 0;
	phy_active				= false;
}