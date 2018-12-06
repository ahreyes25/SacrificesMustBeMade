if (room == asset_get_index("rmCharacter")) {
	
	draw_sprite_pos(
		sBackdrop, 0, 
		-room_width / 2, room_height / 2, 
		room_width / 2, -room_height / 2, 
		room_width + room_width / 2, room_height / 2, 
		room_width / 2, room_height + room_height / 2,
		0.2
	);
	
	image_speed = 0.1;
	var p1x = room_width / 2 - 48;
	var p1y = room_height / 2;
	var p2x =room_width / 2 - 16;
	var p2y = room_height / 2;
	var p3x = room_width / 2 + 16;
	var p3y = room_height / 2;
	var p4x = room_width / 2 + 48;
	var p4y = room_height / 2;

	#region P1
	switch (p1in) {
		case in.CPU:
			draw_sprite(sCPU, image_index, p1x, p1y);
			break;
		
		case in.CONTROLLER:
			if (gamepad_is_connected(0))
				draw_sprite(sController, image_index, p1x, p1y);
			else 
				draw_sprite(sKeyboard, image_index, p1x, p1y);
			break;
		
		case in.SELECT:
			draw_sprite(sShadow, 0, p1x, p1y);
			draw_sprite(asset_get_index("sAz" + string(p1val) + "_run"), imSpeed, p1x, p1y);
			break;
		
		case in.READY:
			draw_sprite(sShadow, 0, p1x, p1y);
			if (!p1comp)
				draw_sprite_ext(asset_get_index("sAz" + string(p1val) + "_idle"), imSpeedIdle, p1x, p1y, 1, 1, 0, c_gray, 1);
			else 
				draw_sprite_ext(sCPU, image_index, p1x, p1y, 1, 1, 0, c_gray, 1);
			draw_sprite(sCheck, 0, p1x, p1y - 16);
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
			draw_sprite(asset_get_index("sAz" + string(p2val) + "_run"), imSpeed, p2x, p2y);
			break;
		
		case in.READY:
			draw_sprite(sShadow, 0, p2x, p2y);
			if (!p2comp)
				draw_sprite_ext(asset_get_index("sAz" + string(p2val) + "_idle"), imSpeedIdle, p2x, p2y, 1, 1, 0, c_gray, 1);
			else 
				draw_sprite_ext(sCPU, image_index, p2x, p2y, 1, 1, 0, c_gray, 1);
			
			draw_sprite(sCheck, 0, p2x, p2y - 16);
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
			draw_sprite(asset_get_index("sAz" + string(p3val) + "_run"), imSpeed, p3x, p3y);
			break;
		
		case in.READY:
			draw_sprite(sShadow, 0, p3x, p3y);
			if (!p3comp)
				draw_sprite_ext(asset_get_index("sAz" + string(p3val) + "_idle"), imSpeedIdle, p3x, p3y, 1, 1, 0, c_gray, 1);
			else 
				draw_sprite_ext(sCPU, image_index, p3x, p3y, 1, 1, 0, c_gray, 1);
			draw_sprite(sCheck, 0, p3x, p3y - 16);
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
			draw_sprite(asset_get_index("sAz" + string(p4val) + "_run"), imSpeed, p4x, p4y);
			break;
		
		case in.READY:
			draw_sprite(sShadow, 0, p4x, p4y);
			if (!p4comp)
				draw_sprite_ext(asset_get_index("sAz" + string(p4val) + "_idle"), imSpeedIdle, p4x, p4y, 1, 1, 0, c_gray, 1);
			else 
				draw_sprite_ext(sCPU, image_index, p4x, p4y, 1, 1, 0, c_gray, 1);
			draw_sprite(sCheck, 0, p4x, p4y - 16);
			break;
	}
	draw_sprite(sPlayer, 3, p4x, p4y);
	#endregion
	
	if (drawArrow)
		draw_sprite(sArrow, 0, p1x + (32 * (characterIndex - 1)), p1y + 16);
		
	var sca = abs(sin(counter) + 1);
	var rot = sin(counter) * 30;
	draw_sprite_ext(sPressStart, 0, room_width / 2, room_height - 75, sca, sca, rot, c_white, 1);	
}

//draw_text(10, 10, characterIndex);
//draw_text(10, 50, p1in);