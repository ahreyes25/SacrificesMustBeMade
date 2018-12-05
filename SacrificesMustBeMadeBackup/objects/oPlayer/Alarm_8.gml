/// @description CPU Not Moving

if (xpos != noone) {
	if (x == xpos) {
		xpos = noone;
		target = instance_nearest(x, y, oCpuTargetPoint);
	}
}