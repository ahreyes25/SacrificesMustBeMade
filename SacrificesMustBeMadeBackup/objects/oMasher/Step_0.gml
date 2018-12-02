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
	
	// Add skull to player
	if (ds_exists(owner.skulls, ds_type_list) && altar.victim != noone) 
		ds_list_add(owner.skulls, altar.victim.image_index);
		
	altar.victim = noone;
	owner.state = humanState.ALTARFINISH;
	owner.masher = noone;
	owner.mashing = false;
	owner.alarm[2] = 15;
	owner.finishing = true;
	
	// Spawn next sacrifice
	if (instance_exists(oPrisonGate)) {
		oPrisonGate.gateOpen = true;
		oPrisonGate.numberSpawned += 1;
	}
	
	// Destroy Masher
	instance_destroy();	
}