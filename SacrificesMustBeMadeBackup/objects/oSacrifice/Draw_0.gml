draw_self();

if (dying) {
	image_speed = 0.5;
	draw_sprite_ext(sSacrifice_knife, 0, x, y - 4, 1, 1, 0, c_white, image_alpha);	
	draw_sprite_ext(sBlood, image_index, x, y, 1, 1, 0, c_white, image_alpha);	
}