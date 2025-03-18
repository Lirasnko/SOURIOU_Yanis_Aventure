var actionZone = collision_circle(x, y, 20, O_Player, true, false);

if (actionZone > 0) {
	if (O_Player.gamepad) {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonG_A);
		}
	}
	else {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonK_E);
		}
	}
}
else if (button != noone) {
	instance_destroy(button);
	button = noone;
}