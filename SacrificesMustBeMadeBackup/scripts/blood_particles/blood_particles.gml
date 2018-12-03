/// @param Number
repeat(argument0) {
	var b = instance_create_layer(x, y, "Instances", oBlood);
	with (b) {
		physics_apply_impulse(x, y, random_range(-1, 1), random_range(-1, 1));	
	}
}