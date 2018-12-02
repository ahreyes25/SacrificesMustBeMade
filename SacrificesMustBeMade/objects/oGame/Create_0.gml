propIndex = 0;
numberOfProperties = 10;
lightAlpha = 0.5;

p1 = instance_create_layer(50, 150, "Instances", oPlayer);
p1.isComputer = false;
p1.takesInput = true;
p1.player = 1;
p1.name = "Az" + string(p1.player);

p2 = instance_create_layer(200, 100, "Instances", oPlayer);
p2.isComputer = true;
p2.takesInput = false;
p2.player = 2;
p2.name = "Az" + string(p2.player);