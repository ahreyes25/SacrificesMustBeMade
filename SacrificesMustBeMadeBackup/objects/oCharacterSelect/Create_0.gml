enum in {
	CPU, CONTROLLER, SELECT, READY, OFF
}

if (gamepad_is_connected(0)) {
	p1in = in.CONTROLLER;
	p1comp = false;
}
else {
	p1in = in.CPU;
	p1comp = true;
}
if (gamepad_is_connected(1)) {
	p2in = in.CONTROLLER;
	p2comp = false;
}
else {
	p2in = in.CPU;
	p2comp = true;
}
if (gamepad_is_connected(2)) {
	p3in = in.CONTROLLER;
	p3comp = false;
}
else {
	p3in = in.OFF;
	p3comp = true;
}
if (gamepad_is_connected(3)) {
	p4in = in.CONTROLLER;
	p4comp = false;
}
else {
	p4in = in.OFF;
	p4comp = true;
}


p1val = 1;
p2val = 1;
p3val = 1;
p4val = 1;

p1comp = false;
waitTime = 90;

numberOfSkins = 4;
imSpeed = 0;
imSpeedIdle = 0;

characterIndex = 2;
drawArrow = false;

counter = 0;
counter2 = 0;