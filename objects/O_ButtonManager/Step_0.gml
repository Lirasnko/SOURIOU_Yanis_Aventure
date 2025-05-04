if (O_Controler.gamepad) {
	for (var i = 0; i < buttons; i++) {
		if (i == buttonSelected - 1) {
			if (glow == noone && arrow == noone) {
				glow = instance_create_layer(320, 544, "Glow", O_MenuButtonSelect);
				arrow = instance_create_layer(320 - 96 * O_MenuButton.image_xscale / 2, 544, "Arrow", O_MenuArrow);
				glow.image_xscale = O_MenuButton.image_xscale;
				glow.image_yscale = O_MenuButton.image_yscale;
			}
			glow.y = 544 + (buttonSelected - 1) * 160;
			arrow.y = 544 + (buttonSelected - 1) * 160;
		}
	}
	
	var vAxis = gamepad_axis_value(0, gp_axislv);
	var upArrow = gamepad_button_check_pressed(0, gp_padu);
	var downArrow = gamepad_button_check_pressed(0, gp_padd);

	if (vAxis <= 0.1 && vAxis >= -0.1 ) {
		vAxis = 0;
	}
	if (vAxis > 0.1 && changable) {
		if (buttonSelected == 3) {
			buttonSelected = 1;
		}
		else {
			buttonSelected += 1;
		}
		changable = false;
		alarm_set(0, 10);
	}
	else if (vAxis < -0.1 && changable) {
		if (buttonSelected == 1) {
			buttonSelected = 3;
		}
		else {
			buttonSelected -= 1;
		}
		changable = false;
		alarm_set(0, 10);
	}
	
	if (downArrow) {
		if (buttonSelected == 3) {
			buttonSelected = 1;
		}
		else {
			buttonSelected += 1;
		}
	}
	if (upArrow) {
		if (buttonSelected == 1) {
			buttonSelected = 3;
		}
		else {
			buttonSelected -= 1;
		}
	}
}