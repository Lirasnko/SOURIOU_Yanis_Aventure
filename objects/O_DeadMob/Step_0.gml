var actionZone = collision_circle(x, y, 20, O_Player, true, false);

if (actionZone > 0) {
	if (O_Player.gamepad) {
		if (button1 == noone) {
			button1 = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonG_A);
		}
		if (button2 == noone) {
			button2 = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonG_X);
		}
		
		var buttonG_A = gamepad_button_check_pressed(0, gp_face1);
		if (buttonG_A) {
			instance_create_layer(x, y, "SumonMob", sumonMob);
			instance_destroy(button1);
			button1 = noone;
			if (button2 != noone) {
				instance_destroy(button2);
				button2 = noone;
			}
			instance_destroy();
		}
		var buttonG_X = gamepad_button_check_pressed(0, gp_face3);
		if (buttonG_X) {
			if (life && O_LifeManager.playerLife < 3) {
				O_LifeManager.playerLife += 1;
				life = false;
			}
			O_LootManager.playerMoney += money;
			money = 0;
		}
	}
	else {
		if (button1 == noone) {
			button1 = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonK_E);
		}
		if (button2 == noone && (life || money > 0)) {
			button2 = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonK_A);
		}
		
		var buttonK_E = keyboard_check_pressed(ord("E"));
		if (buttonK_E) {
			instance_create_layer(x, y, "SumonMob", sumonMob);
			instance_destroy(button1);
			button1 = noone;
			if (button2 != noone) {
				instance_destroy(button2);
				button2 = noone;
			}
			instance_destroy();
		}
		var buttonK_A = keyboard_check_pressed(ord("A"));
		if (buttonK_A && (life || money > 0)) {
			if (life && O_LifeManager.playerLife < 3) {
				O_LifeManager.playerLife += 1;
				life = false;
			}
			O_LootManager.playerMoney += money;
			money = 0;
		}
	}
	if (button2 != noone && !life && money == 0) {
		instance_destroy(button2);
		button2 = noone;
	}
}
else {
	if (button1 != noone) {
		instance_destroy(button1);
		button1 = noone;
	}
	if (button2 != noone) {
		instance_destroy(button2);
		button2 = noone;
	}
}

//check position of grid
if (x != floor(x/32) * 32 + 16 && y != floor(y/32) * 32 + 16) {
	var centerPath = path_add();
	path_add_point(centerPath, x, y, 100);
	path_add_point(centerPath, floor(x/32) * 32 + 16, floor(y/32) * 32 + 16, 100);
	path_start(centerPath, 1, 0, 0);
}
else {
	path_end();
}
