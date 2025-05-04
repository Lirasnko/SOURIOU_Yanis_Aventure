var playerCol = collision_rectangle(x - 8, y + 8, x + 8, y + 24, O_Player, true, false);

if (playerCol > 0) {
	if (O_Controler.gamepad) {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonG_A);
		}
		
		var buttonG_A = gamepad_button_check_pressed(0, gp_face1);
		if (buttonG_A && O_LootManager.playerMoney >= price) {
			scriptDo(price);
		}
	}
	else {
		if (button == noone) {
			button = instance_create_layer(O_Player.x, O_Player.y, "Button", O_ButtonK_E);
		}
		
		var buttonK_E = keyboard_check_pressed(ord("E"));
		if (buttonK_E && O_LootManager.playerMoney >= price) {
			scriptDo(price);
		}
	}
}
else if (button != noone) {
	instance_destroy(button);
	button = noone;
}

//Mouvement
if (y > ystart - 2 && !mouvementDown) {
	y -= 0.02;
	mouvementUp = true;
}
else {
	mouvementUp = false;
}
if (y < ystart && !mouvementUp) {
	y += 0.02;
	mouvementDown = true;
}
else {
	mouvementDown = false;
}