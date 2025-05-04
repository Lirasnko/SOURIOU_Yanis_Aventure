if (playerLife == 0) {
	O_Player.x = O_CheckPointManager.lastCheckPoint[0];
	O_Player.y = O_CheckPointManager.lastCheckPoint[1];
	playerLife = 3;
	O_Player.orientation = 3;
}