if (instance_exists(owner)) {
	x = owner.x;
	y = owner.y;
	
	if (!owner.isComputer)
		input();

	if (kSacrifice && progress < goal) {
		progress += amountPerPress;
		timesPressed++;
		audio_play_sound(sfxLight1, 0, 0);
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
				audio_play_sound(sfxBlood, 0, 1);
			
				blood_particles(100);
			}
		}
	
		// Make Sure Victim Is still at altar
		if (altar.victim != noone) {
			altar.drawLight = true;
			owner.points += 1000;
			owner.points += timesPressed;
			owner.justScored = true;
			if (owner.alarm[6] == -1) {
				owner.alarm[6] = 90;	
			}
		
			// Add skull to player
			if (ds_exists(owner.skulls, ds_type_list) && altar.victim != noone) 
				ds_list_add(owner.skulls, altar.victim.image_index);
			
			// Final kill is collected
			if (ds_list_size(owner.skulls) == oGame.numberOfSkullsToWin) {
				oGame.winner = owner;
				oGame.gameWon= true;
				
				oDragon.speaking = true;
				oDragon.phrase = "P" + string(owner.player) + " wins!";
				oDragon.mood = "happy";
				audio_play_sound(choose(sfxDragon1, sfxDragon2, sfxDragon3, sfxDragon4, sfxDragon5), 0, 0);
			}
			else {
			
				// Spawn next sacrifice
				if (instance_exists(oPrisonGate)) {
					oPrisonGate.gateOpen = true;
					oPrisonGate.numberSpawned += 1;
					audio_play_sound(sfxDoor2, 0, 0);
				}
				audio_stop_sound(sfxLight1);
				audio_play_sound(sfxCoin, 0, 0);
				
				oDragon.speaking = true;
				oDragon.phrase = get_dragon_phrase("good");
				oDragon.mood = "happy";
				audio_play_sound(choose(sfxDragon1, sfxDragon2, sfxDragon3, sfxDragon4, sfxDragon5), 0, 0);
			}
		}
		else {
			if (!oDragon.speaking) {
				oDragon.speaking = true;
				oDragon.phrase = get_dragon_phrase("bad");
				oDragon.mood = "mad";
				audio_play_sound(choose(sfxDragon1, sfxDragon2, sfxDragon3, sfxDragon4, sfxDragon5), 0, 0);
			}
		}
		timesPressed = 0;
		
		altar.victim	= noone;
		owner.state		= humanState.ALTARFINISH;
		owner.masher	= noone;
		owner.mashing	= false;
		owner.alarm[2]	= 15;
		owner.finishing	= true;
		
		/* // Focus On Player
		if (instance_exists(oCamera)) {
			oCamera.target = owner;
			oCamera.altarFocus = true;
		}
		*/
		
		// Blast all others away
		var insts = ds_list_create();
		collision_circle_list(x, y, 64, oPlayer, false, true, insts, false); 
		//collision_circle_list(x, y, 10, oCrate, false, true, insts, false);
		
		for (var i = 0; i < ds_list_size(insts); i++) {
			var inst = ds_list_find_value(insts, i);
	
			if (inst.id != owner.id) {
				inst.inHitStun  = true;
				inst.phy_active = true;
				inst.alarm[1]	= inst.hitStun;
				inst.mashing	= false;
				inst.finishing	= false;
				inst.punished	= true;
				
				if (inst.alarm[7] == -1)
					inst.alarm[7] = 60;
				
				audio_play_sound(sfxHurt, 0, 0);
				blood_particles(10);
				
				if (inst.carrying != noone) {
					if (instance_exists(inst.carrying.attachedTo)) 
						inst.carrying.attachedTo = noone;
					inst.carrying = noone;
				}
	
				with (inst) {
					if (oAltar.x > room_width / 2)
						physics_apply_impulse(x, y, -1, 0);
					else if (oAltar.x < room_width / 2)
						physics_apply_impulse(x, y, 1, 0);
					else
						physics_apply_impulse(x, y, random_range(-1, 1), -2);
				}
			}
		}
		ds_list_destroy(insts);
	
		// Destroy Masher
		instance_destroy();	
	}
}