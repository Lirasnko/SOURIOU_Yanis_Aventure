if (!O_Controler.gamepad) {
	var leftClick = mouse_check_button_pressed(mb_left);
	
	if (position_meeting(mouse_x, mouse_y, id)) {
		if (glow == noone) {
			glow = instance_create_layer(x, y, "Glow", O_MenuButtonSelect);
			glow.image_xscale = image_xscale;
			glow.image_yscale = image_yscale;
		}
		if (arrow == noone) {
			arrow = instance_create_layer(x - 96 * image_xscale / 2, y, "Arrow", O_MenuArrow);
		}
	}
	else {
		if (glow != noone) {
			instance_destroy(glow);
			glow = noone;
		}
		if (arrow != noone) {
			instance_destroy(arrow);
			arrow = noone;
		}
	}
	
	if (leftClick && position_meeting(mouse_x, mouse_y, id)) {
		scriptDo();
	}
}
else {
	var aPress = gamepad_button_check_pressed(0, gp_face1);
	
	if (aPress && O_ButtonManager.buttonSelected == order) {
		scriptDo();
	}
}