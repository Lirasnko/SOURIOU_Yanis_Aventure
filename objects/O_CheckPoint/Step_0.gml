var actionZone = collision_rectangle(x, y + 64, x + 32, y + 96, O_Player, true, false);

if (actionZone > 0) {
	if (O_Player.gamepad) {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonG_A);
		}
		
		var buttonG_X = gamepad_button_check_pressed(0, gp_face1);
		if (buttonG_X) {
			O_CheckPointManager.lastCheckPoint = [x + 16, y + 80];
			messageAff = true;
			alarm_set(1, 60);
		}
	}
	else {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonK_E);
		}
		
		var buttonK_A = keyboard_check_pressed(ord("E"));
		if (buttonK_A) {
			O_CheckPointManager.lastCheckPoint = [x + 16, y + 80];
			messageAff = true;
			alarm_set(1, 60);
		}
	}
}
else if (button != noone) {
	instance_destroy(button);
	button = noone;
}