input();

if (kSacrifice && progress < goal) {
	progress += amountPerPress;
	timesPressed++;
}

if (progress > 0) {
	progress--;
}

if (progress >= goal) {
	// Destroy Current victim
	with (alter.victim) {
		instance_destroy();
	}
	alter.victim = noone;
	
	// Set player state and add points
	owner.state = humanState.PRAISE;
	owner.points += 1000;
	owner.points += timesPressed;
	owner.masher = noone;
	owner.mashing = false;
	
	// Destroy Masher
	instance_destroy();	
}