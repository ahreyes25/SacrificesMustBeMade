//x = oDragon.x;
//y = oDragon.y;

var moveSpeed = oDragon.moveSpeed * 0.8;
if (x != oDragon.x) {
	if (x > oDragon.x) {
		x -= moveSpeed;	
	}
	if (x < oDragon.x) {
		x += moveSpeed;	
	}
}

if (y != oDragon.y) {
	if (y > oDragon.y) {
		y -= moveSpeed;	
	}
	if (y < oDragon.y) {
		y += moveSpeed;	
	}
}

/*
if (image_xscale > oDragon.image_xscale) 
	image_xscale -= 0.01;
if (image_xscale < oDragon.image_xscale) 
	image_xscale += 0.01;
*/
	
image_alpha = 0.4;