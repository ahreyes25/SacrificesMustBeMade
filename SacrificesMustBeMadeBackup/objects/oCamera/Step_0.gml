// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Update Target and Position To Move To

if (oGame.winner != noone)
	target = oGame.winner;

if (target == noone)
	if (instance_exists(oCenterOfMass))
		target = oCenterOfMass;
	else
		if (instance_exists(oDragon))
			target = oDragon;
		else
			target = noone;

if (target != noone) {
	xTo = target.x;
	yTo = target.y;
		
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Move Camera Object
	x += (xTo - x) * 0.05;
	y += (yTo - y) * 0.05;

	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Update Camera View Matrix
	viewmat = matrix_build_lookat(x, y, -100, x, y, 0, 0, 1, 0);
	camera_set_view_mat(cam, viewmat);

	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	// Update Camera Projection Matrix
	if (target.object_index == oPlayer)
		projmat = matrix_build_projection_ortho(160, 120, 1.0, 32000.0);
	else {
		var furth = instance_furthest(oCenterOfMass.x, oCenterOfMass.y, oPlayer);
		var zoom = point_distance(oCenterOfMass.x, oCenterOfMass.y, furth.x, furth.y) / (room_width) * 4.0;
		zoom = clamp(zoom, 0.8, 2.0);
		projmat = matrix_build_projection_ortho(640 * zoom, 480 * zoom, 1.0, 32000.0);
	}
	camera_set_proj_mat(cam, projmat);

	if (altarFocus && alarm[0] == -1) {
		alarm[0] = 60;
	}
}