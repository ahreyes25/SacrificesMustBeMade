if (collision_point(x, y, oSolid_par, false, false)) {
	if (!surface_exists(oBloodSurface.bloodMask)) {
		oBloodSurface.bloodMask = surface_create(room_width ,room_height);	
	}

	if (surface_exists(oBloodSurface.bloodMask)) {
		surface_set_target(oBloodSurface.bloodMask);
		
		draw_self();
		surface_reset_target();
	}
	instance_destroy();
}