mask_index = sAz_mask;
image_xscale = facing;
draw_self();

switch(state) {
	case humanState.IDLE:
		sprite_index = sAz1_idle;
		image_speed  = 0.6;
		break;
		
	case humanState.RUN:
		sprite_index = sAz1_run;
		image_speed  = 0.8;
		break;
		
	case humanState.JUMP:
		sprite_index = sAz1_jump;
		image_index  = 1;
		image_speed  = 0.0;
		break;
	
	case humanState.FALL:
		sprite_index = sAz1_jump;
		image_index  = 0;
		image_speed  = 0.0;
		break;
		
	case humanState.WALLSLIDE:
		break;
		
	case humanState.HURT:
		sprite_index = sAz1_hurt;
		image_speed  = 0.8;
		break;
		
	case humanState.ALTAR:
		sprite_index = sAz1_kill;
		image_speed = 0;
		image_index = 0;
		if (masher != noone) {
			draw_sprite_ext(sRotatingBeam, 0, x, y - 24, 0.02 * masher.progress, 0.02 * masher.progress, counter * masher.progress, c_white, 1);
		}
		break;
		
	case humanState.ALTARFINISH:
		sprite_index = sAz1_kill;
		image_speed = 0;
		image_index = 1;
		break;
}