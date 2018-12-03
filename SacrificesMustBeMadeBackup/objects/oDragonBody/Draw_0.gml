var red = make_color_rgb(147, 37, 74);

if (oDragon.mood == "happy")
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
else if (oDragon.mood == "mad")
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, red, image_alpha);
