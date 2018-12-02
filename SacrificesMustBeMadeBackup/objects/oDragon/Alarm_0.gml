/// @description New Target Location

var sprWidth = sprite_get_width(sprite_index);
var sprHeight = sprite_get_height(sprite_index);

targetX = irandom_range(sprWidth, room_width - sprWidth);
targetY = irandom_range(sprHeight, room_height - sprHeight);