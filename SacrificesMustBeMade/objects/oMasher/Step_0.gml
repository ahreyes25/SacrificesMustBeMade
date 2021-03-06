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
	if (altar.victim != noone) {
		with (altar.victim) {
			dying = true;
			state = sacrificeState.DEAD;
		}
	}
	
	// Make Sure Victim Is still at altar
	if (altar.victim != noone) {
		altar.drawLight = true;
		owner.points += 1000;
		owner.points += timesPressed;
	}
	timesPressed = 0;
	
	altar.victim = noone;
	owner.state = humanState.ALTARFINISH;
	owner.masher = noone;
	owner.mashing = false;
	owner.alarm[2] = 15;
	owner.finishing = true;
	
	// Destroy Masher
	instance_destroy();	
}