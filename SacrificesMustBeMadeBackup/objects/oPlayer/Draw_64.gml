var sprHeight = 8;
var sprWidth = 8;
var sprScale = 2;
var sprSpacing = 1;
var xOff = 0;
var yOff = 16;
var numPerColumn = 5;

var red = make_color_rgb(204, 55, 77);
var yel = make_color_rgb(230, 145, 70);
var gre = make_color_rgb(73, 143, 96);
var bro = make_color_rgb(250, 220, 200);
var scale = 2;

switch (player) {
	case 1:
		var frameX = 25;
		var frameY = 25;
		draw_sprite_ext(sFrame, 0, frameX, frameY, scale, scale, 0, red, 1);
		draw_sprite_ext(asset_get_index("s" + string(name) + "Head"), 0, frameX, frameY, scale, scale, 0, c_white, 1);
		
		if (ds_exists(skulls, ds_type_list)) {
			var xColumn = 0;
			for (var i = 0; i < ds_list_size(skulls); i++) {
				if (i mod numPerColumn == 0)
					xColumn++;
			
				draw_sprite_ext(
					sHeads, ds_list_find_value(skulls, i), 
					xOff + (25 * 2) + (((sprWidth * sprScale) + sprSpacing) * (i mod numPerColumn)) + 8, 
					yOff + (((sprHeight * sprScale) + sprSpacing) * xColumn) - (25 / 2) - 2, 
					sprScale, sprScale, 0, c_white, 1
				);
			}
		}
		
		break;
	
	case 2:
		var frameX = room_width * 2 - 25;
		var frameY = 25;
		draw_sprite_ext(sFrame, 0, frameX, frameY, scale, scale, 0, yel, 1);;
		draw_sprite_ext(asset_get_index("s" + string(name) + "Head"), 0, frameX, frameY, scale * -1, scale, 0, c_white, 1);
		
		if (ds_exists(skulls, ds_type_list)) {
			var xColumn = 0;
			for (var i = 0; i < ds_list_size(skulls); i++) {
				if (i mod numPerColumn == 0)
					xColumn++;
			
				draw_sprite_ext(
					sHeads, ds_list_find_value(skulls, i), 
					(room_width * 2) - (xOff + (25 * 2) + (((sprWidth * sprScale) + sprSpacing) * (i mod numPerColumn)) + 8), 
					yOff + (((sprHeight * sprScale) + sprSpacing) * xColumn) - (25 / 2) - 2, 
					sprScale, sprScale, 0, c_white, 1
				);
			}
		}
		break;
	
	case 3:	
		var frameX = 25;
		var frameY = room_height * 2 - 25;
		draw_sprite_ext(sFrame, 0, frameX, frameY, scale, scale, 0, gre, 1);
		draw_sprite_ext(asset_get_index("s" + string(name) + "Head"), 0, frameX, frameY, scale, scale, 0, c_white, 1);
		
		if (ds_exists(skulls, ds_type_list)) {
			var xColumn = 0;
			for (var i = 0; i < ds_list_size(skulls); i++) {
				if (i mod numPerColumn == 0)
					xColumn++;
			
				draw_sprite_ext(
					sHeads, ds_list_find_value(skulls, i), 
					xOff + (25 * 2) + (((sprWidth * sprScale) + sprSpacing) * (i mod numPerColumn)) + 8, 
					(room_height * 2) - (yOff + (((sprHeight * sprScale) + sprSpacing) * xColumn) - (25 / 2) - 2), 
					sprScale, sprScale, 0, c_white, 1
				);
			}
		}
		break;
		
	case 4:
		var frameX = room_width * 2 - 25;
		var frameY = room_height * 2 - 25;
		draw_sprite_ext(sFrame, 0, frameX, frameY, scale, scale, 0, bro, 1);
		draw_sprite_ext(asset_get_index("s" + string(name) + "Head"), 0, frameX, frameY, scale * -1, scale, 0, c_white, 1);
		
		if (ds_exists(skulls, ds_type_list)) {
			var xColumn = 0;
			for (var i = 0; i < ds_list_size(skulls); i++) {
				if (i mod numPerColumn == 0)
					xColumn++;
			
				draw_sprite_ext(
					sHeads, ds_list_find_value(skulls, i), 
					(room_width * 2) - (xOff + (25 * 2) + (((sprWidth * sprScale) + sprSpacing) * (i mod numPerColumn)) + 8), 
					(room_height * 2) - (yOff + (((sprHeight * sprScale) + sprSpacing) * xColumn) - (25 / 2) - 2), 
					sprScale, sprScale, 0, c_white, 1
				);
			}
		}
		break;
}