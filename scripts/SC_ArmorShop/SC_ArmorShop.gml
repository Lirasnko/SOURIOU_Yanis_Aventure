function SC_ArmorShop(price) {
	if (O_LootManager.playerArmor < 3 && O_LootManager.haveArmor) {
		O_LootManager.playerMoney -= price;
		O_LootManager.playerArmor += 1;
	}
}