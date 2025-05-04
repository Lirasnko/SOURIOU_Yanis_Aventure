function SC_FindPointCircle() {
	var targetX = 0;
	var targetY = 0;
	var findPoint = false;
	
	while(!findPoint) {
		targetX = O_Player.x - 16 - 32 * O_Player.sumonDistance + floor(random((O_Player.sumonDistance * 2 + 1) * 32));
		targetY = O_Player.y - 16 - 32 * O_Player.sumonDistance + floor(random((O_Player.sumonDistance * 2 + 1) * 32));
		findPoint = true;
		if ((targetX < 0 || targetY < 0) /*|| ((targetX > O_Player.x - 16 && targetX < O_Player.x + 16) && (targetY > O_Player.y - 16 && targetY < O_Player.y + 16)) || (point_distance(O_Player.x, O_Player.y, targetX, targetY) > O_Player.sumonDistance * 32 + 16)*/) {
			findPoint = false;
		}
	}
	
	return([targetX, targetY]);
}