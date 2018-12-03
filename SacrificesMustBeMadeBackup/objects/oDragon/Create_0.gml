startX = x;
startY = y;
targetX = x;
targetY = y;
moveSpeed = 0.1;
image_alpha = 0.6;
speaking = false;
speakLength = 120;
phrase = "";
textAlpha = 1;
mood = "happy";

if (room != asset_get_index("rmMenu")) 
	body = instance_create_layer(x, y, "Dragon", oDragonBody);
else 
	body = instance_create_layer(x, y, "Instances", oDragonBody);
body.depth = depth + 1;