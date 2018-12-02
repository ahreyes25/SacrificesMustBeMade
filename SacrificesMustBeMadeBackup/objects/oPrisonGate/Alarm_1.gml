/// @description Spawn Sacrifice

if (numberSpawned mod numberToSpawn != 0) {
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
	
	numberSpawned++;
	alarm[1] = timeBetweenSpawns;
}