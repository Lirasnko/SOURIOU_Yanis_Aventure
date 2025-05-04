var life = sprite_get_width(S_Life);
for(var i = 0; i < playerLife; i++) {
	draw_sprite_ext(S_Life, 0, 64 + i * (life + 80), 64, 4, 4, 0, c_white, 1);
}