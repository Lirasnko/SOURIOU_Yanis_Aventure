var playerVisionMap = collision_rectangle(x, y, x + 8, y + 8, O_PlayerVisionMap, true, false);
//var propPosition = collision_rectangle(x * 4 + 48, y * 4 - O_Global.mapHeight * 32 + 48, x * 4 + 80, y * 4 - O_Global.mapHeight * 32 + 80, O_PropCollision, true, false);

if (!(playerVisionMap > 0) /*|| !(propPosition > 0)*/) {
	instance_destroy();
}