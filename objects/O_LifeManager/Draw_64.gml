var life = sprite_get_width(S_Life);
for(var i = 0; i < playerLife; i++) {
	draw_sprite(S_Life, 0, 10 + i * (life + 4), 10);
}