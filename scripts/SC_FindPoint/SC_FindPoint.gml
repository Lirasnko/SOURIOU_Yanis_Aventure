function SC_FindPoint(zones) {
	var geneX = 0;
	var geneY = 0;
	//Real minX
	var minX = room_width;
	for (var i = 0; i < array_length(zones); i++) {
		if (zones[i].x < minX) {
			minX = zones[i].x + 16;
		}
	}
	//Real maxX
	var maxX = 0;
	for (var i = 0; i < array_length(zones); i++) {
		if ((zones[i].x + zones[i].image_xscale * 32) > maxX) {
			maxX = zones[i].x + zones[i].image_xscale * 32 - 16;
		}
	}
	//Real minY
	var minY = room_height;
	for (var i = 0; i < array_length(zones); i++) {
		if (zones[i].y < minY) {
			minY = zones[i].y + 16;
		}
	}
	//Real maxY
	var maxY = 0;
	for (var i = 0; i < array_length(zones); i++) {
		if ((zones[i].y + zones[i].image_yscale * 32) > maxY) {
			maxY = zones[i].y + zones[i].image_yscale * 32 - 16;
		}
	}
	//find point
	var pointIn = false;
	while (!pointIn) {
		geneX = minX + random(maxX - minX);
		geneY = minY + random(maxY - minY);
		for (var i = 0; i < array_length(zones); i++) {
			if (zones[i].x < geneX && geneX < (zones[i].x + zones[i].image_xscale * 32)) {
				if (zones[i].y < geneY && geneY < (zones[i].y + zones[i].image_yscale * 32)) {
					pointIn = true;
				}
			}
		}
	}
	return([geneX, geneY]);
}