var playerCol = collision_circle(x, y, 48, O_Player, true, false);

if (playerCol > 0) {
	if (life) {
		draw_sprite_ext(S_Life, 0, 920 + 96 + 16 + (x - O_Player.x) * 3.75, 528 - 32 - 8 + (y - O_Player.y) * 3.75, 2, 2, 0, c_white, 1);
	}
	if (money > 0) {
		draw_sprite_ext(S_Money, 0, 920 + 96 + 16 + (x - O_Player.x) * 3.75, 528 + 8 + (y - O_Player.y) * 3.75, 2, 2, 0, c_white, 1);
		draw_set_font(Font32);
		draw_text(920 + 96 + 16 + 40 + (x - O_Player.x) * 3.75, 528 + 8 + 40 + (y - O_Player.y) * 3.75, money);
	}
}