var sprHeight = 8;
var sprWidth = 8;
var sprScale = 2;
var sprSpacing = 1;
var xOff = 0;
var yOff = 16;
var numPerColumn = 5;

switch (player) {
	case 1:
		if (ds_exists(skulls, ds_type_list)) {
			var xColumn = 0;
			for (var i = 0; i < ds_list_size(skulls); i++) {
				if (i mod numPerColumn == 0)
					xColumn++;
			
				draw_sprite_ext(
					sHeads, ds_list_find_value(skulls, i), 
					xOff + (((sprWidth * sprScale) + sprSpacing) * xColumn), 
					yOff + (((sprHeight * sprScale) + sprSpacing) * (i mod numPerColumn)), 
					sprScale, sprScale, 0, c_white, 1
				);
			}
		}
		break;
	
	case 2:
		break;
	
	case 3:	
		break;
		
	case 4:
		break;
}