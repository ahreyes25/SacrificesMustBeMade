propIndex			= 0;
numberOfProperties	= 10;
lightAlpha			= 0.5;

// Create Player 1
p1				= instance_create_layer(50, 150, "Instances", oPlayer);
p1.isComputer	= false;
p1.takesInput	= true;
p1.player		= 1;
p1.name			= "Az" + string(p1.player);
p1.idleSprite	= asset_get_index("s" + string(p1.name) + "_idle");
p1.runSprite	= asset_get_index("s" + string(p1.name) + "_run");
p1.jumpSprite	= asset_get_index("s" + string(p1.name) + "_jump");
p1.hurtSprite	= asset_get_index("s" + string(p1.name) + "_hurt");
p1.altarSprite	= asset_get_index("s" + string(p1.name) + "_kill");

// Create Player 2
p2				= instance_create_layer(200, 100, "Instances", oPlayer);
p2.isComputer	= false;
p2.takesInput	= true;
p2.player		= 2;
p2.name			= "Az" + string(p2.player);
p2.idleSprite	= asset_get_index("s" + string(p2.name) + "_idle");
p2.runSprite	= asset_get_index("s" + string(p2.name) + "_run");
p2.jumpSprite	= asset_get_index("s" + string(p2.name) + "_jump");
p2.hurtSprite	= asset_get_index("s" + string(p2.name) + "_hurt");
p2.altarSprite	= asset_get_index("s" + string(p2.name) + "_kill");