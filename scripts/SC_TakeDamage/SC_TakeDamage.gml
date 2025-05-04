function SC_TakeDamage(damage = 1) {
	if (O_LootManager.playerArmor > 0) {
		O_LootManager.playerArmor -= damage;
		if (O_Player.armor == noone) {
			O_Player.armor = instance_create_layer(O_Player.x, O_Player.y, "Armor", O_Armor);
			with(O_LifeManager) {
				alarm_set(1, 60);
			}
		}
	}
	else if (O_LifeManager.takeDamage == true) {
		O_LifeManager.playerLife -= damage;
		O_LifeManager.takeDamage = false;
	
		with(O_LifeManager) {
			alarm_set(0, 90);
		}
	}
}