/// @description Shake the screen by a given size and for a given time
// This function is the function that is called whenever we want to shake the screen
/// @param Size
/// @param NumberOfSteps

var s = argument0; // screen shake size
var t = argument1; // screen shake time/duration

oGame.shakeSize = s;
oGame.shakeScreen = true;
oGame.alarm[0] = t;