var hit	= touching(oAltar);
if (hit == noone) {
	mashing = false;
		
	with (masher)
		instance_destroy();
			
	masher = noone;
}