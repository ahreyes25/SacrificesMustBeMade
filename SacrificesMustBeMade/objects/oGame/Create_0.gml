propIndex = 0;
numberOfProperties = 10;

p1 = instance_create_layer(50, 150, "Instances", oPlayer);
p1.isComputer = false;
p1.takesInput = true;

p2 = instance_create_layer(200, 100, "Instances", oPlayer);
p2.isComputer = true;
p2.takesInput = false;