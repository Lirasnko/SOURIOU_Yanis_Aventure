var actionZone = collision_circle(x, y, 20, O_Player, true, false);

if (actionZone > 0) {
	if (O_Player.gamepad) {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonG_A);
		}
		
		var buttonG_X = gamepad_button_check_pressed(0, gp_face1);
		if (buttonG_X) {
			O_Player.haveBackpack = true;
			instance_destroy(button);
			button = noone;
			instance_destroy();
		}
	}
	else {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonK_E);
		}
		
		var buttonK_A = keyboard_check_pressed(ord("E"));
		if (buttonK_A) {
			O_Player.haveBackpack = true;
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