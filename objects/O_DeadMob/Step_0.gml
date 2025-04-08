var actionZone = collision_circle(x, y, 20, O_Player, true, false);

if (actionZone > 0) {
	if (O_Player.gamepad) {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonG_A);
		}
		
		var buttonG_A = gamepad_button_check_pressed(0, gp_face1);
		if (buttonG_A) {
			instance_create_layer(x, y, "SumonMob", sumonMob);
			instance_destroy(button);
			button = noone;
			instance_destroy();
		}
	}
	else {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonK_E);
		}
		
		var buttonK_E = keyboard_check_pressed(ord("E"));
		if (buttonK_E) {
			instance_create_layer(x, y, "SumonMob", sumonMob);
			instance_destroy(button);
			button = noone;
			instance_destroy();
		}
	}
}
else if (button != noone) {
	instance_destroy(button);
	button = noone;
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
