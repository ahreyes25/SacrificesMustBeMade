//check_for_sprites_assigned();

switch(state) {
	case humanState.IDLE:
		sprite_index = idleSprite;
		image_speed  = 0.6;
		break;
		
	case humanState.RUN:
		sprite_index = runSprite;
		image_speed  = 0.8;
		break;
		
	case humanState.JUMP:
		sprite_index = jumpSprite;
		image_index  = 1;
		image_speed  = 0.0;
		break;
	
	case humanState.FALL:
		sprite_index = jumpSprite;
		image_index  = 0;
		image_speed  = 0.0;
		break;
		
	case humanState.HURT:
		sprite_index = hurtSprite;
		image_speed  = 0.8;
		break;
		
	case humanState.ALTAR:
		sprite_index = altarSprite;
		image_speed = 0;
		image_index = 0;
		break;
		
	case humanState.ALTARFINISH:
		sprite_index = altarSprite;
		image_speed = 0;
		image_index = 1;
		if (masher != noone) {
			draw_sprite_ext(sRotatingBeam, 0, x, y - 24, 0.02 * masher.progress, 0.02 * masher.progress, counter * masher.progress, c_white, 1);
		}
		break;
}

mask_index = sAz_mask;
image_xscale = facing;
draw_self();