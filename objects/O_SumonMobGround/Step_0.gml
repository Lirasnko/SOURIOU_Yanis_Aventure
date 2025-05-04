event_inherited();

if (O_Player.compagnon != id) {
	time += 1;
}

//Time max
if (time >= maxTime * 60) {
	hp = 0;
	time = 0;
}

if (O_Player.compagnon != id) {
	startX = xstart;
	startY = ystart;
}
else {
	startX = O_Player.x;
	startY = O_Player.y;
}

//Death
if (hp == 0) {
	if (x != xstart && y != ystart) {
			SC_GoTo(O_Global.sumonGroundGrid, path, x, y, xstart, ystart);
	}
	hp = -1;
}
if (hp == -1 && x == xstart && y == ystart) {
	path_end();
	if (typeof(O_Global.sumonMobsGround) == "array") {
		for(var i = 0; i < array_length(O_Global.sumonMobsGround); i++) {
			if(array_get(O_Global.sumonMobsGround, i) == id) {
				array_delete(O_Global.sumonMobsGround, i, 1);
			}
		}
	}
	instance_destroy();
}

//Live
if (hp > 0) {
	//Movement
	var playerInZone = collision_circle(startX, startY, 32 * distanceZone + 16, O_Player, true, false);
	if (playerInZone > 0) {
		//Chase
		if (instance_exists(O_MobGround)) {
			var playerVisonGround = collision_circle(O_Player.x, O_Player.y, 32 * O_Player.sumonDistance + 16, O_MobGround, true, false);
			var playerVisionWallGround = collision_line(O_Player.x, O_Player.y, O_MobGround.x, O_MobGround.y, O_ColliderGroundWall, true, false);
			if ((playerVisonGround > 0 && !(playerVisionWallGround > 0))) {
					haveTarget = true;
			}
		}
		if (instance_exists(O_MobFly)) {
			var playerVisionFly = collision_circle(O_Player.x, O_Player.y, 32 * O_Player.sumonDistance + 16, O_MobFly, true, false);
			var playerVisionWallFly = collision_line(O_Player.x, O_Player.y, O_MobFly.x, O_MobFly.y, O_ColliderFly, true, false);
			if ((playerVisionFly > 0 && !(playerVisionWallFly > 0))) {
				haveTarget = true;
			}
		}
		
		if (target != noone) {
			path_end();
			if (xTarget32 != floor(target.x/32) || yTarget32 != floor(target.y/32)) {
				xTarget32 = floor(target.x/32);
				yTarget32 = floor(target.y/32);
				SC_GoToBefore(O_Global.sumonGroundGird, path, x, y, target.x, target.y);
			}
		}
		else {
			xTarget32 = 0;
			yTarget32 = 0;
			if (!move) {
				var action = random(1);
				if (action < 0.01) {
					pointTarget = SC_FindPointCircle();
					if (pointTarget[0] != 0 && pointTarget[1] != 0) {
						move = SC_GoTo(O_Global.sumonGroundGrid, path, x, y, pointTarget[0], pointTarget[1]);
					}
				}
			}
		}
		if (x == floor(pointTarget[0]) && y == floor(pointTarget[1])) {
			move = false;
		}
	}
	else {
		hp = 0;
	}

	//Attack
	var attackDistanceZone = collision_circle(x, y, 32 * attackDistance + 16, target, true, false);
	var attackZone;
	if (checker.orientation == 0) {
		attackZone = collision_rectangle(x + 16, y - 32, x + 48, y + 32, target, true, false);
	}
	else if (checker.orientation == 1) {
		attackZone = collision_rectangle(x - 32, y - 48, x + 32, y - 16, target, true, false);
	}
	else if (checker.orientation == 2) {
		attackZone = collision_rectangle(x - 48, y - 32, x - 16, y + 32, target, true, false);
	}
	else {
		attackZone = collision_rectangle(x - 32, y + 16, x + 32, y + 48, target, true, false);
	}
	if (attackDistanceZone > 0) {
		if (attackZone > 0 && !checker.atk) {
			checker.atk = true;
			if (typeof(O_Global.mobsGround) == "array") {
				for (var i = 0; i < array_length(O_Global.mobsGround); i++) {
					var takeDamageGround;
					if (checker.orientation == 0) {
						takeDamageGround = collision_rectangle(x + 16, y - 32, x + 48, y + 32, O_Global.mobsGround[i], true, false);
					}
					else if (checker.orientation == 1) {
						takeDamageGround = collision_rectangle(x - 32, y - 48, x + 32, y - 16, O_Global.mobsGround[i], true, false);
					}
					else if (checker.orientation == 2) {
						takeDamageGround = collision_rectangle(x - 48, y - 32, x - 16, y + 32, O_Global.mobsGround[i], true, false);
					}
					else {
						takeDamageGround = collision_rectangle(x - 32, y + 16, x + 32, y + 48, O_Global.mobsGround[i], true, false);
					}
					if (takeDamageGround > 0 && O_Global.mobsGround[i].armorHP == 0) {
						O_Global.mobsGround[i].hp -= 1;
						O_Global.mobsGround[i].target = id;
					}
				}
			}
			if (typeof(O_Global.mobsFly) == "array") {
				for (var i = 0; i < array_length(O_Global.mobsFly); i++) {
					var takeDamageFly;
					if (checker.orientation == 0) {
						takeDamageFly = collision_rectangle(x + 16, y - 32, x + 48, y + 32, O_Global.mobsFly[i], true, false);
					}
					else if (checker.orientation == 1) {
						takeDamageFly = collision_rectangle(x - 32, y - 48, x + 32, y - 16, O_Global.mobsFly[i], true, false);
					}
					else if (checker.orientation == 2) {
						takeDamageFly = collision_rectangle(x - 48, y - 32, x - 16, y + 32, O_Global.mobsFly[i], true, false);
					}
					else {
						takeDamageFly = collision_rectangle(x - 32, y + 16, x + 32, y + 48, O_Global.mobsFly[i], true, false);
					}
					if (takeDamageFly > 0) {
						O_Global.mobsFly[i].hp -= 1;
						O_Global.mobsFly[i].target = id;
					}
				}
			}
			alarm_set(1, attackTime);
		}
		else {
			if (checker.orientation == 3) {
				checker.orientation = 0;
			}
			else {
				checker.orientation += 1;
			}
		}
	}

	//Animation orientation
	var dir = point_direction(prevX, prevY, x, y);
	if (prevX != x && prevY != y) {
		if (prevX != x) {
			prevX = x;
		}
		if (prevY != y) {
			prevY = y;
		}
		if (60 <= dir && dir <= 120) {
		    checker.orientation = 1;
		}
		else if (120 < dir && dir < 240) {
		    checker.orientation = 2;
		}
		else if (240 <= dir && dir <= 300) {
		    checker.orientation = 3;
		}
		else {
		    checker.orientation = 0;
		}
	}
}