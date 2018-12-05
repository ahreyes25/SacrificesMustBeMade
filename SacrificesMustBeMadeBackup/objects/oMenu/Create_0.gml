randomize();
instance_create_layer(room_width / 2, room_height / 2, "Instances", oDragon);

lightAlpha = 0.1;

audio_stop_sound(sMenuSong);
audio_play_sound(sMenuSong, 0, 1);