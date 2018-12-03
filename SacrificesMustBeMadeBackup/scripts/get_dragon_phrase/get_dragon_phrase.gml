if (argument0 == "good") {
	var phrases = [
		"GOOD", "PLEASED", "WORTHY", "PRAISE"
	];
}
else if (argument0 == "bad") {
	var phrases = [
		"SHAME", "DISGRACE", "POOR"
	];
}

return phrases[irandom_range(0, array_length_1d(phrases) - 1)];