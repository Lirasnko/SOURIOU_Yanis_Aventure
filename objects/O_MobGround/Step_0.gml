event_inherited();

//Death
if (hp == 0) {
	instance_destroy();
}

//Movement
var visionZone = collision_circle(x, y, 32 * visionRadius, target, true, false);
var visionCollision = collision_line(x, y, target.x, target.y, O_ColliderGroundWall, true, false);	
if (visionZone > 0 && !(visionCollision > 0)) {
	path_end();
	if (xTarget32 != floor(target.x/32) || yTarget32 != floor(target.y/32)) {
		xTarget32 = floor(target.x/32);
		yTarget32 = floor(target.y/32);
		SC_GoToBefore(O_Global.groundGird, path, x, y, target.x, target.y);
	}
}
else {
	xTarget32 = 0;
	yTarget32 = 0;
	if (!move) {
		var action = random(1);
		if (action < 0.05) {
			if (typeof(zones) == "array") {
				if (array_length(zones) > 0) {
					pointTarget = SC_FindPoint(zones);
				}
			}
			if (pointTarget[0] != 0 && pointTarget[1] != 0) {
				SC_GoTo(O_Global.groundGird, path, x, y, pointTarget[0], pointTarget[1]);
				move = true;
			}
		}
	}
}
if (x == floor(pointTarget[0]) && y == floor(pointTarget[1])) {
	move = false;
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
		if (typeof(O_Global.sumonMobsGround) == "array") {
			for (var i = 0; i < array_length(O_Global.sumonMobsGround); i++) {
				var takeDamageGround;
				if (checker.orientation == 0) {
					takeDamageGround = collision_rectangle(x + 16, y - 32, x + 48, y + 32, O_Global.sumonMobsGround[i], true, false);
				}
				else if (checker.orientation == 1) {
					takeDamageGround = collision_rectangle(x - 32, y - 48, x + 32, y - 16, O_Global.sumonMobsGround[i], true, false);
				}
				else if (checker.orientation == 2) {
					takeDamageGround = collision_rectangle(x - 48, y - 32, x - 16, y + 32, O_Global.sumonMobsGround[i], true, false);
				}
				else {
					takeDamageGround = collision_rectangle(x - 32, y + 16, x + 32, y + 48, O_Global.sumonMobsGround[i], true, false);
				}
				if (takeDamageGround > 0) {
					O_Global.sumonMobsGround[i].hp -= 1;
				}
			}
		}
		if (typeof(O_Global.sumonMobsFly) == "array") {
			for (var i = 0; i < array_length(O_Global.sumonMobsFly); i++) {
				var takeDamageFly;
				if (checker.orientation == 0) {
					takeDamageFly = collision_rectangle(x + 16, y - 32, x + 48, y + 32, O_Global.sumonMobsFly[i], true, false);
				}
				else if (checker.orientation == 1) {
					takeDamageFly = collision_rectangle(x - 32, y - 48, x + 32, y - 16, O_Global.sumonMobsFly[i], true, false);
				}
				else if (checker.orientation == 2) {
					takeDamageFly = collision_rectangle(x - 48, y - 32, x - 16, y + 32, O_Global.sumonMobsFly[i], true, false);
				}
				else {
					takeDamageFly = collision_rectangle(x - 32, y + 16, x + 32, y + 48, O_Global.sumonMobsFly[i], true, false);
				}
				if (takeDamageFly > 0) {
					O_Global.sumonMobsFly[i].hp -= 1;
				}
			}
		}
		var takeDamagePlayer;
		if (checker.orientation == 0) {
			takeDamagePlayer = collision_rectangle(x + 16, y - 32, x + 48, y + 32, O_Player, true, false);
		}
		else if (checker.orientation == 1) {
			takeDamagePlayer = collision_rectangle(x - 32, y - 48, x + 32, y - 16, O_Player, true, false);
		}
		else if (checker.orientation == 2) {
			takeDamagePlayer = collision_rectangle(x - 48, y - 32, x - 16, y + 32, O_Player, true, false);
		}
		else {
			takeDamagePlayer = collision_rectangle(x - 32, y + 16, x + 32, y + 48, O_Player, true, false);
		}
		if (takeDamagePlayer > 0) {
			O_Player.hp -= 1;
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