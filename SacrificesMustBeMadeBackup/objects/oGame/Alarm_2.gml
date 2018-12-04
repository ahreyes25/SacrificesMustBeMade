/// @description End Game

if (instance_exists(oCharacterSelect))
	with(oCharacterSelect)
		instance_destroy();	
		
with (oBloodSurface)
	instance_destroy();
		
with (oCamera)
	instance_destroy();
	
with (oCenterOfMass)
	instance_destroy();
	
audio_stop_sound(sfxBlood);

room_goto(rmMenu);

instance_destroy();