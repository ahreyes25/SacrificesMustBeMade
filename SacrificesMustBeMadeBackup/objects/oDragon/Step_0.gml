if (x != targetX) {
	if (x > targetX) {
		x -= moveSpeed;	
	}
	if (x < targetX) {
		x += moveSpeed;	
	}
}

if (y != targetY) {
	if (y > targetY) {
		y -= moveSpeed;	
	}
	if (y < targetY) {
		y += moveSpeed;	
	}
}

if (speaking) 
	c -= 0.5;
else 
	c = 0;
	
if (speaking && alarm[1] == -1) {
	alarm[1] = speakLength;
	
	if (mood == "mad")
		shake_screen(4, 12);
	else if (mood == "happy")
		shake_screen(2, 8);	
}

var dis = point_distance(x, y, targetX, targetY);
if (dis < 50 && alarm[0] == -1) {
	alarm[0] = 100;	
}


if (x > room_width / 2) {
	image_xscale = 1;	
}else {
	image_xscale = -1;	
}