/// @description New Target Location

var sprWidth = sprite_get_width(sprite_index);
var sprHeight = sprite_get_height(sprite_index);

targetX = irandom_range((room_width / 2) - (room_width / 8) + sprWidth, (room_width / 2) + (room_width / 8) - sprWidth);
targetY = irandom_range((room_height / 2) - (room_height / 8) + sprHeight, (room_height / 2) + (room_height / 8) - sprHeight);