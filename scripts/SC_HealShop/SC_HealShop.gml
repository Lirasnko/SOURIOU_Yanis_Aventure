function SC_HealShop(price) {
	if (O_LifeManager.playerLife < 3) {
		O_LootManager.playerMoney -= price;
		O_LifeManager.playerLife += 1;
	}
}