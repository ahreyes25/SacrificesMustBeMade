if (drawLight && alarm[0] == -1) {
	alarm[0] = lightTime;	
}

var npt = 0;
with (oPlayer) {
	if (collision_circle(x, y, 24, oAltar, false, true)) {
		npt++;
	}
}
nPlayersTouching = npt;


if (victim != noone) {
	if (instance_exists(victim)) {
		if (!collision_rectangle(x - 18, y, x + 18, y - 32, oSacrifice, false, true)) {
			victim = noone;	
		}
	}
}