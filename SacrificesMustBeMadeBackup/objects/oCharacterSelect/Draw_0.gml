if (room == asset_get_index("rmCharacter")) {
	image_speed = 0.1;
	var p1x = room_width / 2 - 48;
	var p1y = room_height / 2;
	var p2x =room_width / 2 - 16;
	var p2y = room_height / 2;
	var p3x = room_width / 2 + 48;
	var p3y = room_height / 2;
	var p4x = room_width / 2 + 16;
	var p4y = room_height / 2;

	#region P1
	switch (p1in) {
		case in.CPU:
			draw_sprite(sCPU, image_index, p1x, p1y);
			break;
		
		case in.CONTROLLER:
			if (gamepad_is_connected(3))
				draw_sprite(sController, image_index, p1x, p1y);
			else 
				draw_sprite(sKeyboard, image_index, p1x, p1y);
			break;
		
		case in.SELECT:
			draw_sprite(sShadow, 0, p1x, p1y);
			draw_sprite(asset_get_index("sAz" + string(p1val) + "_idle"), image_index, p1x, p1y);
			break;
		
		case in.READY:
			draw_sprite(sShadow, 0, p1x, p1y);
			draw_sprite_ext(asset_get_index("sAz" + string(p1val) + "_idle"), 0, p1x, p1y, 1, 1, 0, c_black, 1);
			draw_sprite(sCheck, 0, p1x, p1y);
			break;
	}
	draw_sprite(sPlayer, 0, p1x, p1y);
	#endregion

	#region P2
	switch (p2in) {
		case in.CPU:
			draw_sprite(sCPU, image_index, p2x, p2y);
			break;
		
		case in.CONTROLLER:
			draw_sprite(sController, image_index, p2x, p2y);
			break;
		
		case in.SELECT:
			draw_sprite(sShadow, 0, p2x, p2y);
			draw_sprite(asset_get_index("sAz" + string(p2val) + "_idle"), image_index, p2x, p2y);
			break;
		
		case in.READY:
			draw_sprite(sShadow, 0, p2x, p2y);
			draw_sprite_ext(asset_get_index("sAz" + string(p2val) + "_idle"), 0, p2x, p2y, 1, 1, 0, c_black, 1);
			draw_sprite(sCheck, 0, p2x, p2y);
			break;
	}
	draw_sprite(sPlayer, 1, p2x, p2y);
	#endregion

	#region P3
	switch (p3in) {
		case in.CPU:
			draw_sprite(sCPU, image_index, p3x, p3y);
			break;
		
		case in.CONTROLLER:
			draw_sprite(sController, image_index, p3x, p3y);
			break;
		
		case in.SELECT:
			draw_sprite(sShadow, 0, p3x, p3y);
			draw_sprite(asset_get_index("sAz" + string(p3val) + "_idle"), image_index, p3x, p3y);
			break;
		
		case in.READY:
			draw_sprite(sShadow, 0, p3x, p3y);
			draw_sprite_ext(asset_get_index("sAz" + string(p3val) + "_idle"), 0, p3x, p3y, 1, 1, 0, c_black, 1);
			draw_sprite(sCheck, 0, p3x, p3y);
			break;
	}
	draw_sprite(sPlayer, 2, p3x, p3y);
	#endregion

	#region p4
	switch (p4in) {
		case in.CPU:
			draw_sprite(sCPU, image_index, p4x, p4y);
			break;
		
		case in.CONTROLLER:
			draw_sprite(sController, image_index, p4x, p4y);
			break;
		
		case in.SELECT:
			draw_sprite(sShadow, 0, p4x, p4y);
			draw_sprite(asset_get_index("sAz" + string(p4val) + "_idle"), image_index, p4x, p4y);
			break;
		
		case in.READY:
			draw_sprite(sShadow, 0, p4x, p4y);
			draw_sprite_ext(asset_get_index("sAz" + string(p4val) + "_idle"), 0, p4x, p4y, 1, 1, 0, c_black, 1);
			draw_sprite(sCheck, 0, p4x, p4y);
			break;
	}
	draw_sprite(sPlayer, 3, p4x, p4y);
	#endregion
}