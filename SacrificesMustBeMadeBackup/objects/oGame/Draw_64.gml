var scale = view_wport[0] / room_width;
draw_sprite_ext(sLightRays, 0, 320 * scale, 0, scale, scale, 0, c_white, lightAlpha);

if (paused) {
	draw_set_alpha(0.5);
	draw_rectangle_color(-room_width * 2, -room_height * 2, room_width * 2, room_height * 2, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	if (!countdown)
		draw_text(room_width - 20, room_height, "Paused");
	else
		draw_text_transformed(room_width, room_height - 30, ceil(alarm[1] / 30), 3, 3, 0);
}