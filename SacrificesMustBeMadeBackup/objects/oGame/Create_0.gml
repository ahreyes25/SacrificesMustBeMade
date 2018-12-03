randomize();

propIndex			= 0;
numberOfProperties	= 10;
lightAlpha			= 0.5;
shakeScreen			= false;
shakeSize			= 4;

// Create Player 1
p1				= instance_create_layer(50, 150, "Instances", oPlayer);
p1.isComputer	= false;
p1.takesInput	= !p1.isComputer;
p1.player		= 1;
p1.name			= "Az" + string(p1.player);
p1.idleSprite	= asset_get_index("s" + string(p1.name) + "_idle");
p1.runSprite	= asset_get_index("s" + string(p1.name) + "_run");
p1.jumpSprite	= asset_get_index("s" + string(p1.name) + "_jump");
p1.hurtSprite	= asset_get_index("s" + string(p1.name) + "_hurt");
p1.altarSprite	= asset_get_index("s" + string(p1.name) + "_kill");

// Create Player 2
p2				= instance_create_layer(200, 100, "Instances", oPlayer);
p2.isComputer	= true;
p2.takesInput	= !p2.isComputer;
p2.player		= 2;
p2.name			= "Az" + string(p2.player);
p2.idleSprite	= asset_get_index("s" + string(p2.name) + "_idle");
p2.runSprite	= asset_get_index("s" + string(p2.name) + "_run");
p2.jumpSprite	= asset_get_index("s" + string(p2.name) + "_jump");
p2.hurtSprite	= asset_get_index("s" + string(p2.name) + "_hurt");
p2.altarSprite	= asset_get_index("s" + string(p2.name) + "_kill");

// Create Player 3
p3				= instance_create_layer(100, 100, "Instances", oPlayer);
p3.isComputer	= true;
p3.takesInput	= !p2.isComputer;
p3.player		= 3;
p3.name			= "Az" + string(p3.player);
p3.idleSprite	= asset_get_index("s" + string(p1.name) + "_idle");
p3.runSprite	= asset_get_index("s" + string(p1.name) + "_run");
p3.jumpSprite	= asset_get_index("s" + string(p1.name) + "_jump");
p3.hurtSprite	= asset_get_index("s" + string(p1.name) + "_hurt");
p3.altarSprite	= asset_get_index("s" + string(p1.name) + "_kill");

// Create Player 2
p4				= instance_create_layer(250, 50, "Instances", oPlayer);
p4.isComputer	= true;
p4.takesInput	= !p4.isComputer;
p4.player		= 4;
p4.name			= "Az" + string(p4.player);
p4.idleSprite	= asset_get_index("s" + string(p2.name) + "_idle");
p4.runSprite	= asset_get_index("s" + string(p2.name) + "_run");
p4.jumpSprite	= asset_get_index("s" + string(p2.name) + "_jump");
p4.hurtSprite	= asset_get_index("s" + string(p2.name) + "_hurt");
p4.altarSprite	= asset_get_index("s" + string(p2.name) + "_kill");

if (!instance_exists(oDragon)) {
	instance_create_layer(room_width / 2, room_height / 2, "Dragon", oDragon);	
}

instance_create_layer(0, 0, "Controllers", oBloodSurface);