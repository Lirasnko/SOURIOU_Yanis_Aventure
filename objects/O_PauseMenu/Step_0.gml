var downEscap = keyboard_check_pressed(vk_escape);

if (downEscap) {
	if (!paused) {
		if (O_Player.x < 256) {
			x = 256;
		}
		else if (O_Player.x > room_width - 256) {
			x = room_width - 256;
		}
		else {
			x = O_Player.x;
		}
		if (O_Player.y < 144) {
			y = 144;
		}
		else {
			y = O_Player.y;
		}
	}
	paused = !paused;
}

if (paused) {
	instance_deactivate_all(true);
	visible = true;
}
else {
	instance_activate_all();
	visible = false;
}