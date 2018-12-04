var nPlayers = instance_number(oPlayer);
var nSacrifices = instance_number(oSacrifice);
var xTotal = 0;
var yTotal = 0;

for (var i = 0; i < nPlayers; i++) {
	var p = instance_find(oPlayer, i);
	xTotal += p.x;
	yTotal += p.y;
}

for (var i = 0; i < nSacrifices; i++) {
	var s = instance_find(oSacrifice, i);
	xTotal += s.x;
	yTotal += s.y;
}

x = xTotal / (nPlayers + nSacrifices);
y = yTotal / (nPlayers + nSacrifices);