var red = make_color_rgb(147, 37, 74);
var yellow = make_color_rgb(240, 207, 116);

if (mood == "happy")
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
else if (mood == "mad")
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, red, image_alpha);

if (textAlpha > 0) 
	textAlpha -= 0.001;
else {
	textAlpha = 1;
	mood = "happy";
}

if (speaking && mood == "happy") {
	draw_text_color(x - 75, y + c, phrase, yellow, yellow, yellow, yellow, textAlpha);	
}
else if (speaking && mood == "mad") {
	draw_text_color(x - 75, y + c, phrase, red, red, red, red, 1);	
}