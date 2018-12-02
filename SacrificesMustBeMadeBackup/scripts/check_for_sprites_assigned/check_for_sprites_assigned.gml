if (idleSprite == noone)
	idleSprite = asset_get_index("s" + string(name) + "_idle");

if (runSprite == noone)
	runSprite = asset_get_index("s" + string(name) + "_run");
	
if (jumpSprite == noone)
	jumpSprite = asset_get_index("s" + string(name) + "_jump");

if (hurtSprite == noone)
	hurtSprite = asset_get_index("s" + string(name) + "_hurt");

if (altarSprite == noone)
	altarSprite = asset_get_index("s" + string(name) + "_kill");