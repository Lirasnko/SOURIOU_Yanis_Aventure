var playerCol = collision_rectangle(x - 8, y + 8, x + 8, y + 24, O_Player, true, false);

if (playerCol > 0) {
	draw_sprite_ext(S_Money, 0, 960 - 32 - 8 + (x - O_Player.x) * 3.75, 528 - 64 - 8 + (y - O_Player.y) * 3.75, 2, 2, 0, c_white, 1);
	draw_set_font(Font32);
	draw_text(960 - 32 + 48 - 8 + (x - O_Player.x) * 3.75, 528 - 64 - 8 + 40 + (y - O_Player.y) * 3.75, price);
}