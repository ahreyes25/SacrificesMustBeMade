if (takesinput) {
	input();	
}

onGround = on_ground();

if (canClingToWalls) {
	cLeft  = place_meeting(x - 1, y, oSolid_par);
	cRight = place_meeting(x + 1, y, oSolid_par);
}