/// @description Close Gate

// Check to see that we are done spawning
if (alarm[1] != -1) {
	alarm[0] = 1;	
}
else {
	gateOpen = false;
	spawnedPerson = false;
}