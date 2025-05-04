//gamepad = global.gamepadGlobal;

if (controledObject != noone) {
	controledObject.gamepad = gamepad;

	var menuPress;
	var mapPress;
	var attackPress;

	if (gamepad) {
		menuPress = gamepad_button_check_pressed(0, gp_start);
		if (room_get_name(room) == "R_Game") {
			mapPress = gamepad_button_check_pressed(0, gp_padd);
		}
		else {
			mapPress = false;
		}
	
		controledObject.xSpeed = gamepad_axis_value(0, gp_axislh);
		controledObject.ySpeed = gamepad_axis_value(0, gp_axislv);
		
		attackPress = gamepad_button_check_pressed(0, gp_face2);
	}
	else {
		menuPress = keyboard_check_pressed(vk_escape);
		mapPress = keyboard_check_pressed(vk_tab);
	
		var downZ = keyboard_check(ord("Z"));
		var downS = keyboard_check(ord("S"));
		var downQ = keyboard_check(ord("Q"));
		var downD = keyboard_check(ord("D"));

		if (downD) {
			controledObject.xSpeed = 1;
			controledObject.orientation = 0;
		}
		else if (downQ) {
			controledObject.xSpeed = -1;
			controledObject.orientation = 2;
		}
		else {
			controledObject.xSpeed = 0;
		}
		if (downZ) {
			controledObject.ySpeed = -1;
			controledObject.orientation = 1
		}
		else if (downS) {
			controledObject.ySpeed = 1;
			controledObject.orientation = 3
		}
		else {
			controledObject.ySpeed = 0;
		}
		
		attackPress = keyboard_check_pressed(vk_space);
	}
	//Map
	var mapCamera = view_camera[1];
	if (mapPress && camera_get_view_width(mapCamera) == 128) {
		camera_set_view_size(mapCamera, 512, 288);
		view_wport[1] = 1792;
		view_hport[1] = 952;
		view_xport[1] = 64;
		view_yport[1] = 64;
		camera_set_view_target(mapCamera, O_MapCenter);
		camera_set_view_border(mapCamera, 256, 144);
	}
	else if (mapPress) {
		camera_set_view_size(mapCamera, 128, 72);
		view_wport[1] = 384;
		view_hport[1] = 216;
		view_xport[1] = 1504;
		view_yport[1] = 32;
		camera_set_view_target(mapCamera, O_PlayerMap);
		camera_set_view_border(mapCamera, 64, 36);
	}

	if (menuPress && room_get_name(room) == "R_Game") {
		SC_Pause();
	}
	else if (menuPress) {
		SC_Play();
	}
	if (attackPress && controledObject.haveSpear) {
		controledObject.atk = true;
		alarm_set(0, 30);
	}
}