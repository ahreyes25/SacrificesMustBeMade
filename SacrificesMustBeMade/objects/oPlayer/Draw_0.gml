mask_index = sAz_mask;

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
}

image_xscale = facing;
draw_self();