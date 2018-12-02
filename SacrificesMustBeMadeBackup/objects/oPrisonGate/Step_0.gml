if (gateOpen && !spawnedPerson) {
	spawnedPerson = true;
	
	// Alarm to close gate
	if (alarm[0] == -1) {
		alarm[0] = gateOpenTime;
	}
	
	// Spawn One
	var sac = instance_create_layer(x, y, "Instances", oSacrifice);	
	sac.phy_active = true;
	sac.attachedTo = noone;
	sac.lastAttachedTo = oPrisonGate;
	sac.dying = false;
	
	switch (dirToShoot) {
		case "right":
			with (sac)
				physics_apply_impulse(x, y, 10, random_range(-1, 1));
			break;
				
		case "left":
			with (sac)
				physics_apply_impulse(x, y, -10, random_range(-1, 1));
			break;
				
		case "up":	
			with (sac)
				physics_apply_impulse(x, y, random_range(-1, 1), -10);
			break;
				
		case "down":
			with (sac)
				physics_apply_impulse(x, y, random_range(-1, 1), 10);
			break;
	}
	
	// Check for more to spawn
	if (numberToSpawn > 1 && alarm[1] == -1) {
		alarm[1] = timeBetweenSpawns;
	}
}
