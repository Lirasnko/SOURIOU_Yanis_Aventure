if (doIt) {
	if (checker.atk && array_length(atkAnimation) > 0) {
		sprite_index = atkAnimation[checker.orientation];
		idleCheck = -1;
		moveCheck = -1;
	}
	else {
		if (!usePath) {
			if (checker.speed > 0.5 && moveCheck != checker.orientation && array_length(moveAnimation) > 0) {
				sprite_index = moveAnimation[checker.orientation];
				idleCheck = -1;
				moveCheck = checker.orientation;
			}
			else if (checker.speed <= 0.5 && idleCheck != checker.orientation && array_length(idleAnimation) > 0) {
				sprite_index = idleAnimation[checker.orientation];
				idleCheck = checker.orientation;
				moveCheck = -1;
			}
		}
		else {
			if (path_position > 0 && path_position < 1 && moveCheck != checker.orientation && array_length(moveAnimation) > 0) {
				sprite_index = moveAnimation[checker.orientation];
				idleCheck = -1;
				moveCheck = checker.orientation;
			}
			else if (path_position == 0 || path_position == 1 && idleCheck != checker.orientation && array_length(idleAnimation) > 0) {
				sprite_index = idleAnimation[checker.orientation];
				idleCheck = checker.orientation;
				moveCheck = -1;
			}
		}
	}
}