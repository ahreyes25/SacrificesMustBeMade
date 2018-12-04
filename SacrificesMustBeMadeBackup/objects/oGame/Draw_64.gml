draw_sprite_ext(sLightRays, 0, view_wport[0], 0, 2, 2, 0, c_white, lightAlpha);

if (paused) {
	draw_set_alpha(0.5);
	draw_rectangle_color(-view_wport[0] * 2, -view_hport[0] * 2, view_wport[0] * 2, view_hport[0] * 2, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	if (!countdown)
		draw_text(view_wport[0] / 2 - 20, view_hport[0] / 2, "Paused");
	else
		draw_text_transformed(view_wport[0] / 2, view_hport[0] / 2 - 30, ceil(alarm[1] / 30), 3, 3, 0);
}