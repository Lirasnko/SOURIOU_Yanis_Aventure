speed = 2;

if (gamepad) {
	xSpeed = gamepad_axis_value(0, gp_axislh);
	ySpeed = gamepad_axis_value(0, gp_axislv);	
	
	direction = point_direction(0, 0, xSpeed, ySpeed);

	if (xSpeed <= 0.1 && xSpeed >= -0.1 ) {
		xSpeed = 0;
	}
	if (ySpeed <= 0.1 && ySpeed >= -0.1 ) {
		ySpeed = 0;
	}
	
	if (direction >= 60 && direction <= 120 && ySpeed < -0.1) {
		orientation = 1;
	}
	else if (direction > 120 && direction < 240 && xSpeed < -0.1) {
		orientation = 2;
	}
	else if (direction >= 240 && direction <= 300 && ySpeed > 0.1) {
		orientation = 3;
	}
	else if (xSpeed > 0.1) {
		orientation = 0;
	}
}
else {
	var downZ = keyboard_check(ord("Z"));
	var downS = keyboard_check(ord("S"));
	var downQ = keyboard_check(ord("Q"));
	var downD = keyboard_check(ord("D"));

	if (downD) {
		xSpeed = 1;
		orientation = 0;
	}
	else if (downQ) {
		xSpeed = -1;
		orientation = 2;
	}
	else {
		xSpeed = 0;
	}
	if (downZ) {
		ySpeed = -1;
		orientation = 1
	}
	else if (downS) {
		ySpeed = 1;
		orientation = 3
	}
	else {
		ySpeed = 0;
	}
	
	direction = point_direction(0, 0, xSpeed, ySpeed);
}
if (xSpeed == 0 && ySpeed == 0) {
	speed = 0;
}

// Inherit the parent event
event_inherited();