randomize();

audio_play_sound(sQuetzalcoatl, 0, 1);

propIndex			= 0;
numberOfProperties	= 10;
lightAlpha			= 0.5;
shakeScreen			= false;
shakeSize			= 4;
paused				= true;
countdownTimer		= 150;
countdown			= true;
alarm[1]			= countdownTimer;
gameWon				= false;
endingGame			= false;
winner				= noone;
numberOfSkullsToWin	= 5;

if (oCharacterSelect.p1in != in.OFF) {
	// Create Player 1
	p1				= instance_create_layer(440, 620, "Instances", oPlayer);
	p1.isComputer	= oCharacterSelect.p1comp;
	p1.takesInput	= !p1.isComputer;
	p1.player		= 1;
	if (!p1.isComputer)
		p1.name		= "Az" + string(oCharacterSelect.p1val);
	else 
		p1.name		= "Az" + string(choose(1, 2, 3, 4));
	p1.idleSprite	= asset_get_index("s" + string(p1.name) + "_idle");
	p1.runSprite	= asset_get_index("s" + string(p1.name) + "_run");
	p1.jumpSprite	= asset_get_index("s" + string(p1.name) + "_jump");
	p1.hurtSprite	= asset_get_index("s" + string(p1.name) + "_hurt");
	p1.altarSprite	= asset_get_index("s" + string(p1.name) + "_kill");
}
else {
	p1 = noone;	
}

if (oCharacterSelect.p2in != in.OFF) {
	// Create Player 2
	p2				= instance_create_layer(480, 620, "Instances", oPlayer);
	p2.isComputer	= oCharacterSelect.p2comp;
	p2.takesInput	= !p2.isComputer;
	p2.player		= 2;
	if (!p2.isComputer)
		p2.name		= "Az" + string(oCharacterSelect.p2val);
	else 
		p2.name		= "Az" + string(choose(1, 2, 3, 4));
	p2.idleSprite	= asset_get_index("s" + string(p2.name) + "_idle");
	p2.runSprite	= asset_get_index("s" + string(p2.name) + "_run");
	p2.jumpSprite	= asset_get_index("s" + string(p2.name) + "_jump");
	p2.hurtSprite	= asset_get_index("s" + string(p2.name) + "_hurt");
	p2.altarSprite	= asset_get_index("s" + string(p2.name) + "_kill");
}
else {
	p2 = noone;	
}

if (oCharacterSelect.p3in != in.OFF) {
	// Create Player 3
	p3				= instance_create_layer(520, 620, "Instances", oPlayer);
	p3.isComputer	= oCharacterSelect.p3comp;
	p3.takesInput	= !p3.isComputer;
	p3.player		= 3;
	if (!p3.isComputer)
		p3.name		= "Az" + string(oCharacterSelect.p3val);
	else 
		p3.name		= "Az" + string(choose(1, 2, 3, 4));
	p3.idleSprite	= asset_get_index("s" + string(p3.name) + "_idle");
	p3.runSprite	= asset_get_index("s" + string(p3.name) + "_run");
	p3.jumpSprite	= asset_get_index("s" + string(p3.name) + "_jump");
	p3.hurtSprite	= asset_get_index("s" + string(p3.name) + "_hurt");
	p3.altarSprite	= asset_get_index("s" + string(p3.name) + "_kill");
}
else {
	p3 = noone;	
}

if (oCharacterSelect.p4in != in.OFF) {
	// Create Player 4
	p4				= instance_create_layer(560, 620, "Instances", oPlayer);
	p4.isComputer	= oCharacterSelect.p4comp;
	p4.takesInput	= !p4.isComputer;
	p4.player		= 4;
	if (!p4.isComputer)
		p4.name		= "Az" + string(oCharacterSelect.p4val);
	else 
		p4.name		= "Az" + string(choose(1, 2, 3, 4));
	p4.idleSprite	= asset_get_index("s" + string(p4.name) + "_idle");
	p4.runSprite	= asset_get_index("s" + string(p4.name) + "_run");
	p4.jumpSprite	= asset_get_index("s" + string(p4.name) + "_jump");
	p4.hurtSprite	= asset_get_index("s" + string(p4.name) + "_hurt");
	p4.altarSprite	= asset_get_index("s" + string(p4.name) + "_kill");
}
else {
	p4 = noone;	
}

if (!instance_exists(oDragon)) {
	instance_create_layer(room_width / 2, room_height / 2, "Dragon", oDragon);	
}

instance_create_layer(0, 0, "Controllers", oCenterOfMass);
instance_create_layer(0, 0, "Controllers", oBloodSurface);
instance_create_layer(0, 0, "Controllers", oCamera);