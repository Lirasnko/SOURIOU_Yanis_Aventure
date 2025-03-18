event_inherited();

var visionZone = collision_circle(x, y, 32 * visionRadius, O_Player, true, false);

if (visionZone > 0) {
	
	var visionCollision = collision_line(x, y, O_Player.x, O_Player.y, O_ColliderGroundWall, true, false);
	
	if (visionCollision > 0) {
	}
	else {
		if (x32 != floor(x/32) && y32 != floor(y/32) && xPlayer32 != floor(O_Player.x/32) && yPlayer32 != floor(O_Player.y/32)) {
			path = path_add();
			mp_grid_path(O_Global.groundGrid, path, x, y, O_Player.x, O_Player.y, 1);
			path_start(path, 1, 0, 0);
		}
	}
}
else {
	path_end();
	mp_grid_path(O_Global.groundGird, path, x, y, xstart, ystart, 1);
	path_start(path, 1, 0, 0);
}