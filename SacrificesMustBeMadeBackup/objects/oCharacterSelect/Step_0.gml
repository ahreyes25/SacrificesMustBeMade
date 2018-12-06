if (room == asset_get_index("rmCharacter")) {
	menu_input();

	#region Turn Off CPU
	if (p1in == in.READY && !gamepad_is_connected(1) && !gamepad_is_connected(2) && !gamepad_is_connected(3)) {
		drawArrow = true;
	
		if (kRight1) {
			audio_play_sound(sfxHit2, 0, 0);
			if (characterIndex < 4)
				characterIndex++;
			else
				characterIndex = 1;
		}
	
		if (kLeft1) {
			audio_play_sound(sfxHit2, 0, 0);
			if (characterIndex > 1)
				characterIndex--;
			else
				characterIndex = 4;
		}
	
		// Next
		if (kJump1) {
			switch(characterIndex) {
				case 1:
					if (p1in == in.SELECT) {
						p2in = in.READY;
						characterIndex++;
						audio_play_sound(sfxCoin, 0, 0);
					}
					else if (p1in == in.READY) {
						characterIndex++;	
					}
					break;
					
				case 2:
					if (p2in == in.CPU) {
						p2in = in.READY;
						p2comp = true;
						characterIndex++;
						audio_play_sound(sfxCoin, 0, 0);
					}
					else if (p2in == in.OFF) {
						p2in = in.CPU;
						audio_play_sound(sfxHit2, 0, 0);
					}
					break;
			
				case 3:
					if (p3in == in.CPU) {
						p3in = in.READY;
						p3comp = true;
						characterIndex++;
						audio_play_sound(sfxCoin, 0, 0);
					}
					else if (p3in == in.OFF) {
						p3in = in.CPU;
						audio_play_sound(sfxHit2, 0, 0);
					}
					break;
				
				case 4:
					if (p4in == in.CPU) {
						p4in = in.READY;
						p4comp = true;
						characterIndex++;
						audio_play_sound(sfxCoin, 0, 0);
					}
					else if (p4in == in.OFF) {
						p4in = in.CPU;
						audio_play_sound(sfxHit2, 0, 0);
					}
					break;
			}
		}
	
		// Back
		if (kShift1 || kPickup1 || kSacrifice1) {
			switch(characterIndex) {
				case 1:
					drawArrow = false;
					p1in = in.SELECT;
					p1comp = false;
					break;
				
				case 2:
					if (p2in == in.CPU || p2in == in.OFF) {
						p2in = in.OFF;
						p2comp = false;
						characterIndex--;
					}
					else if (p2in == in.READY)
						p2in = in.CPU;
					break;
			
				case 3:
					if (p3in == in.CPU || p3in == in.OFF) {
						p3in = in.OFF;
						p3comp = false;
						characterIndex--;
					}
					else if (p3in == in.READY)
						p3in = in.CPU;
					break;
				
				case 4:
					if (p4in == in.CPU || p4in == in.OFF) {
						p4in = in.OFF;
						p4comp = false;
						characterIndex--;
					}
					else if (p4in == in.READY)
						p4in = in.CPU;
					break;
			}
		}
	}
	else {
		drawArrow = false;	
	}
	#endregion

	#region Next State
	if (kJump1)
		if (p1in == in.CPU) {
			p1in = in.CONTROLLER;
			p1comp = false;
			audio_play_sound(sfxHit2, 0, 0);
		}
		else if (p1in == in.CONTROLLER) {
			p1in = in.SELECT;
			audio_play_sound(sfxHit2, 0, 0);
		}
		else if (p1in == in.SELECT) {
			audio_play_sound(sfxCoin, 0, 0);
			p1in = in.READY;
		}
		else if (p1in == in.OFF) {
			p1in = in.CPU;
			p1comp = true;
			audio_play_sound(sfxHit2, 0, 0);
		}

	if (kJump2)
		if (p2in == in.CPU) {
			p2in = in.CONTROLLER;
			p2comp = false;
			audio_play_sound(sfxHit2, 0, 0);
		}
		else if (p2in == in.CONTROLLER) {
			p2in = in.SELECT;
			audio_play_sound(sfxHit2, 0, 0);
		}
		else if (p2in == in.SELECT) {
			audio_play_sound(sfxCoin, 0, 0);
			p2in = in.READY;
		}
		else if (p2in == in.OFF) {
			p2in = in.CPU;	
			audio_play_sound(sfxHit2, 0, 0);
		}
	
	if (kJump3)
		if (p3in == in.CPU) {
			p3in = in.CONTROLLER;
			p3comp = false;
			audio_play_sound(sfxHit2, 0, 0);
		}
		else if (p3in == in.CONTROLLER) {
			p3in = in.SELECT;
			audio_play_sound(sfxHit2, 0, 0);
		}
		else if (p3in == in.SELECT) {
			audio_play_sound(sfxCoin, 0, 0);
			p3in = in.READY;
		}
		else if (p3in == in.OFF) {
			p3in = in.CPU;	
			audio_play_sound(sfxHit2, 0, 0);
		}

	if (kJump4)
		if (p4in == in.CPU) {
			p4in = in.CONTROLLER;
			p4comp = false;
			audio_play_sound(sfxHit2, 0, 0);
		}
		else if (p4in == in.CONTROLLER) {
			p4in = in.SELECT;
			audio_play_sound(sfxHit2, 0, 0);
		}
		else if (p4in == in.SELECT) {
			audio_play_sound(sfxCoin, 0, 0);
			p4in = in.READY;
		}
		else if (p4in == in.OFF) {
			p4in = in.CPU;	
			audio_play_sound(sfxHit2, 0, 0);
		}
	#endregion
	
	#region Character Select
	if (kRight1 && p1in = in.SELECT) {
		audio_play_sound(sfxHit2, 0, 0);
		if (p1val < numberOfSkins)
			p1val++;
		else 
			p1val = 1;
	}

	if (kLeft1 && p1in = in.SELECT) {
		audio_play_sound(sfxHit2, 0, 0);
		if (p1val > 1)
			p1val--;
		else
			p1val = numberOfSkins;
	}
	
	if (kRight2 && p2in = in.SELECT) {
		audio_play_sound(sfxHit2, 0, 0);
		if (p2val < numberOfSkins)
			p2val++;
		else 
			p2val = 1;
	}

	if (kLeft2 && p2in = in.SELECT) {
		audio_play_sound(sfxHit2, 0, 0);
		if (p2val > 1)
			p2val--;
		else
			p2val = numberOfSkins;
	}
	
	if (kRight3 && p3in = in.SELECT) {
		audio_play_sound(sfxHit2, 0, 0);
		if (p3val < numberOfSkins)
			p3val++;
		else 
			p3val = 1;
	}

	if (kLeft3 && p3in = in.SELECT) {
		audio_play_sound(sfxHit2, 0, 0);
		if (p3val > 1)
			p3val--;
		else
			p3val = numberOfSkins;
	}
	
	if (kRight4 && p4in = in.SELECT) {
		audio_play_sound(sfxHit2, 0, 0);
		if (p4val < numberOfSkins)
			p4val++;
		else 
			p4val = 1;
	}

	if (kLeft4 && p4in = in.SELECT) {
		audio_play_sound(sfxHit2, 0, 0);
		if (p4val > 1)
			p4val--;
		else
			p4val = numberOfSkins;
	}
	#endregion

	#region Fullscreen
	kFull = kShift1 || kShift2 || kShift3 || kShift4;

	if (kExit1) {
	    room_goto_previous();
		instance_destroy();
	}

	// Fullscreen
	if (kFull)
		window_set_fullscreen(!window_get_fullscreen());
	#endregion

	#region Previous State
	if (kShift1 || kPickup1 || kSacrifice1) {
		if (!drawArrow) {
			if (p1in == in.SELECT)
				p1in = in.CONTROLLER;
			else if (p1in == in.READY) {
				p1in = in.SELECT;
			}
			else if (p1in == in.CONTROLLER) {
				p1in = in.CPU;
				p1comp = true;
			}
			else if (p1in == in.CPU) {
				p1in = in.OFF;	
			}
		}
		else {
			
		}
	}

	if (kShift2 || kPickup2 || kSacrifice2) {
		if (p2in == in.CONTROLLER) {
			p2in = in.CPU;
			p2comp = true;
		}
		else if (p2in == in.SELECT)
			p2in = in.CONTROLLER;
		else if (p2in == in.READY) {
			p2in = in.SELECT;
		}
		else if (p2in == in.CPU) {
			p2in = in.OFF;	
		}
	}
	
	if (kShift3 || kPickup3 || kSacrifice3) {
		if (p3in == in.CONTROLLER) {
			p3in = in.CPU;
			p3comp = true;
		}
		else if (p3in == in.SELECT)
			p3in = in.CONTROLLER;
		else if (p3in == in.READY) {
			p3in = in.SELECT;
		}
		else if (p3in == in.CPU) {
			p3in = in.OFF;	
		}
	}

	if (kShift4 || kPickup4 || kSacrifice4) {
		if (p4in == in.CONTROLLER) {
			p4in = in.CPU;
			p4comp = true;
		}
		else if (p4in == in.SELECT)
			p4in = in.CONTROLLER;
		else if (p4in == in.READY) {
			p4in = in.SELECT;
		}
		else if (p4in == in.CPU) {
			p4in = in.OFF;	
		}
	}
	#endregion

	if (kEnter1) {
		//if (alarm[0] == -1) {
		//	alarm[0] = waitTime;
		//}
		room_goto_next();
	}

	imSpeed += 0.3;
	imSpeedIdle += 0.2;

	characterIndex = clamp(characterIndex, 1, 4);
}

counter += 0.01;
counter2 += 0.5;

if (p1in == in.OFF || p1in == in.CPU) {
	if (gamepad_is_connected(0)) {
		p1in = in.CONTROLLER;
		p1comp = false;
	}
}
if (p2in == in.OFF || p2in == in.CPU) {
	if (gamepad_is_connected(1)) {
		p2in = in.CONTROLLER;
		p2comp = false;
	}
}
if (p3in == in.OFF || p3in == in.CPU) {
	if (gamepad_is_connected(2)) {
		p3in = in.CONTROLLER;
		p3comp = false;
	}
}
if (p4in == in.OFF || p4in == in.CPU) {
	if (gamepad_is_connected(3)) {
		p4in = in.CONTROLLER;
		p4comp = false;
	}
}

if (p1in == in.CONTROLLER || p1in == in.SELECT || p1in == in.READY) {
	if (!gamepad_is_connected(0)) {
		p1in = in.CPU;
		p1comp = true;
	}
}
if (p2in == in.CONTROLLER || p2in == in.SELECT || p2in == in.READY) {
	if (!gamepad_is_connected(1)) {
		p2in = in.CPU;
		p2comp = true;
	}
}
if (p3in == in.CONTROLLER || p3in == in.SELECT || p3in == in.READY) {
	if (!gamepad_is_connected(2)) {
		p3in = in.CPU;
		p3comp = true;
	}
}
if (p4in == in.CONTROLLER || p4in == in.SELECT || p4in == in.READY) {
	if (!gamepad_is_connected(3)) {
		p4in = in.CPU;
		p4comp = true;
	}
}