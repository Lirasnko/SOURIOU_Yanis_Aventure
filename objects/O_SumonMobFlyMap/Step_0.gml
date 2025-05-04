var visionPlayerMap = collision_rectangle(x - 4, y - 4, x + 4, y + 4, O_PlayerVisionMap, true, false);

if (visionPlayerMap > 0) {
	visible = true;
}
else {
	visible = false;
}

if (visible) {
	if (typeof(O_Global.sumonMobsFly) == "array") {
		for (var i = 0; i < array_length(O_Global.sumonMobsFly); i++) {
			if (O_Global.sumonMobsFly[i].sumonMobId == sumonMobID) {
				if (sumonMobX32 != floor(O_Global.sumonMobsFly[i].x / 32) || sumonMobY32 != floor(O_Global.sumonMobsFly[i].y / 32)) {
					x = floor(O_Global.sumonMobsFly[i].x / 32) * 8 + 68;
					y = floor(O_Global.sumonMobsFly[i].y / 32) * 8 + 68 + O_Global.mapHeight * 32;
				}
				image_angle = O_Global.sumonMobsFly[i].orientation * 90;
			}
		}
	}
}