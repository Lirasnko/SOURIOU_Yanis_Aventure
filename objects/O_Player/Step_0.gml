speed = 2;

if (x32 != floor(x / 32) || y32 != floor(y / 32)) {
	mp_grid_clear_cell(O_Global.sumonGroundGrid, x32, y32);
	mp_grid_clear_cell(O_Global.sumonFlyGrid, x32, y32);
	x32 = floor(x / 32);
	y32 = floor(y / 32);
	mp_grid_add_cell(O_Global.sumonGroundGrid, x32, y32);
	mp_grid_add_cell(O_Global.sumonFlyGrid, x32, y32);
}

if (gamepad) {
	direction = point_direction(0, 0, xSpeed, ySpeed);

	if (xSpeed <= 0.1 && xSpeed >= -0.1 ) {
		xSpeed = 0;
	}
	if (ySpeed <= 0.1 && ySpeed >= -0.1 ) {
		ySpeed = 0;
	}
	
	if (direction >= 60 && direction <= 120 && ySpeed < -0.1) {
		orientation = 1;
	}
	else if (direction > 120 && direction < 240 && xSpeed < -0.1) {
		orientation = 2;
	}
	else if (direction >= 240 && direction <= 300 && ySpeed > 0.1) {
		orientation = 3;
	}
	else if (xSpeed > 0.1) {
		orientation = 0;
	}
}
else {	
	direction = point_direction(0, 0, xSpeed, ySpeed);
}
if (xSpeed == 0 && ySpeed == 0) {
	speed = 0;
}

if (haveBackpack && backpack == noone) {
	backpack = instance_create_layer(x, y, "Backpack", O_Backpack);
	backpack.image_index = image_index;
}
if (haveSpear && spear == noone) {
	spear = instance_create_layer(x, y, "Spear", O_Spear);
	spear.image_index = image_index;
}
if (typeof(O_Global.sumonMobsFly) == "array" && typeof(O_Global.sumonMobsGround) == "array") {
	if (haveBackpack && (array_length(O_Global.sumonMobsFly) > 0 || array_length(O_Global.sumonMobsGround) > 0) && compagnon == noone) {
		if (array_length(O_Global.sumonMobsFly) > 0) {
			compagnon = O_Global.sumonMobsFly[0];
		}
		else {
			compagnon = O_Global.sumonMobsGround[0];
		}
	}
}
if (atk) {
	var atkZoneMG;
	switch(checker.orientation) {
		case(0) :
			atkZoneMG = collision_rectangle(x + 16, y - 16, x + 48, y + 16, O_MobGround, true, false);
		case(1) :
			atkZoneMG = collision_rectangle(x - 16, y - 48, x + 16, y - 16, O_MobGround, true, false);
		case(2) :
			atkZoneMG = collision_rectangle(x - 48, y - 16, x - 16, y + 16, O_MobGround, true, false);
		case(3) :
			atkZoneMG = collision_rectangle(x - 16, y + 16, x + 16, y + 48, O_MobGround, true, false);
	}
	if (atkZoneMG > 0 && typeof(O_Global.mobsGround) == "array") {
		for (var i = 0; i < array_length(O_Global.mobsGround); i++) {
			var atkZone;
			switch(checker.orientation) {
				case(0) :
					atkZone = collision_rectangle(x + 16, y - 16, x + 48, y + 16, O_Global.mobsGround[i], true, false);
				case(1) :
					atkZone = collision_rectangle(x - 16, y - 48, x + 16, y - 16, O_Global.mobsGround[i], true, false);
				case(2) :
					atkZone = collision_rectangle(x - 48, y - 16, x - 16, y + 16, O_Global.mobsGround[i], true, false);
				case(3) :
					atkZone = collision_rectangle(x - 16, y + 16, x + 16, y + 48, O_Global.mobsGround[i], true, false);
			}
			if (atkZone > 0) {
				if ( O_Global.mobsGround[i].armorHP > 0) {
					O_Global.mobsGround[i].armorHP -= 1;
				}
				else {
					O_Global.mobsGround[i].hp -= 1;
				}
			}
		}
	}
}

// Inherit the parent event
event_inherited();