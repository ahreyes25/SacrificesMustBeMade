draw_self();

if (drawLight) {
	draw_sprite_ext(sLightBeam, 0, x, y, 1, 1, 0, c_white, random_range(0.1, 0.8));	
}

//draw_text(x, y - 20, victim);