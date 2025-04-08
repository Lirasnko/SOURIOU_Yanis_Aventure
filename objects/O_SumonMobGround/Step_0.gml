event_inherited();

time += 1;

//Time max
if (time >= maxTime * 30) {
	hp = 0;
	time = 0;
}

//Death
if (hp == 0) {
	SC_GoTo(O_Global.goundGird, path, x, y, xstart, ystart);
	hp = -1;
}
if (hp == -1 && x == xstart && y == ystart) {
	path_end();
	instance_destroy();
}

//Movement


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
				if (takeDamageGround > 0) {
					O_Global.mobsGround[i].hp -= 1;
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