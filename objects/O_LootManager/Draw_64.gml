var armor = sprite_get_width(S_Shield);
for(var i = 0; i < playerArmor; i++) {
	draw_sprite_ext(S_Shield, 0, 64 + i * (armor + 56), 144, 3, 3, 0, c_white, 1);
}
draw_sprite_ext(S_Money, 0, 64, 216, 2, 2, 0, c_white, 1);
draw_set_font(Font24);
draw_set_halign(fa_left);
draw_text_ext_transformed(112, 224, playerMoney, 10, 80, 1, 1, 0);