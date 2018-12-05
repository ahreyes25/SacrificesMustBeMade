mask_index = sAz_mask;
image_xscale = facing;
draw_self();

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
		if (instance_exists(masher) && masher != noone) {
			draw_sprite_ext(sRotatingBeam, 0, x, y - 24, 0.02 * masher.progress, 0.02 * masher.progress, counter * masher.progress, c_white, 1);
		}
		break;
		
	case humanState.ALTARFINISH:
		sprite_index = altarSprite;
		image_speed = 0;
		image_index = 1;
		break;
}

if (showIcon || inHitStun) {
	draw_sprite(sPlayer, player - 1, x, y);
}

var red = make_color_rgb(204, 55, 77);
var lineW = 2;
if (punished) {
	draw_line_width_color(x, y - 8, oDragon.x, oDragon.y, lineW, red, red);
}

/*
// Draw Line To Player That Just Scored
var red = make_color_rgb(204, 55, 77);
var yel = make_color_rgb(230, 145, 70);
var gre = make_color_rgb(73, 143, 96);
var bro = make_color_rgb(250, 220, 200);
var lineW = 1;

if (justScored) {
	switch (player) {
		case 1:
			draw_line_width_color(x, y - 8, x - view_wport[0] / 2, y - view_hport[0] / 2, lineW, red, red);
			break;
			
		case 2:
			draw_line_width_color(x, y - 8, x + view_wport[0] / 2, y - view_wport[0] / 2, lineW, yel, yel);
			break;
		
		case 3:
			draw_line_width_color(x, y - 8, x - view_wport[0] / 2, y + view_hport[0] / 2, lineW, gre, gre);
			break;
		
		case 4:
			draw_line_width_color(x, y - 8, x + view_wport[0] / 2, y + view_hport[0] / 2, lineW, bro, bro);
			break;
	}
}
*/

if (isComputer) {
	if (target != noone) {
		if (instance_exists(target)) {
			draw_line_color(x, y, target.x, target.y, c_aqua, c_aqua);
		}
	}
}

draw_text(x, y - 50, runaway);