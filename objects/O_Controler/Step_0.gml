controledObject.gamepad = gamepad;

var menuPress;
var mapPress;

if (gamepad) {
	menuPress = gamepad_button_check_pressed(0, gp_start);
	mapPress = gamepad_button_check_pressed(0, gp_padd);
	
	controledObject.xSpeed = gamepad_axis_value(0, gp_axislh);
	controledObject.ySpeed = gamepad_axis_value(0, gp_axislv);
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
}
//Map
var mapCamera = view_camera[1];
if (mapPress && camera_get_view_width(mapCamera) == 128) {
	camera_set_view_size(mapCamera, 256, 144);
	view_wport[1] = 512;
	view_hport[1] = 288;
	view_xport[1] = 192;
	view_yport[1] = 108;
}
else if (mapPress) {
	camera_set_view_size(mapCamera, 128, 72);
	view_wport[1] = 128;
	view_hport[1] = 72;
	view_xport[1] = 752;
	view_yport[1] = 16;
}

if (menuPress && room_get_name(room) == "R_Test") {
	room_goto(R_Parameter);
}
else if (menuPress) {
	room_goto(R_Test);
}