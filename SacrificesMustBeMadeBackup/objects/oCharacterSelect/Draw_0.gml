image_speed = 0.1;

switch (p1in) {
	case in.CPU:
		draw_sprite(sCPU, image_index, room_width / 2 - 48, room_height / 2);
		break;
		
	case in.CONTROLLER:
		draw_sprite(sController, image_index, room_width / 2 - 48, room_height / 2);
		break;
		
	case in.SELECT:
		draw_sprite(asset_get_index("sAz" + string(p1val) + "_idle"), image_index, room_width / 2 - 48, room_height / 2);
		break;
}

switch (p2in) {
	case in.CPU:
		draw_sprite(sCPU, image_index, room_width / 2 - 16, room_height / 2);
		break;
		
	case in.CONTROLLER:
		draw_sprite(sController, image_index, room_width / 2 - 16, room_height / 2);
		break;
}

switch (p3in) {
	case in.CPU:
		draw_sprite(sCPU, image_index, room_width / 2 + 16, room_height / 2);
		break;
		
	case in.CONTROLLER:
		draw_sprite(sController, image_index, room_width / 2 + 16, room_height / 2);
		break;
}

switch (p4in) {
	case in.CPU:
		draw_sprite(sCPU, image_index, room_width / 2 + 48, room_height / 2);
		break;
		
	case in.CONTROLLER:
		draw_sprite(sController, image_index, room_width / 2 + 48, room_height / 2);
		break;
}