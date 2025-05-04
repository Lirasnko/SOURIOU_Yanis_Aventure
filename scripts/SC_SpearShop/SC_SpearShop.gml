function SC_SpearShop(price) {
	O_LootManager.playerMoney -= price;
	O_Player.haveSpear = true;
	instance_destroy(O_SpearProps.button);
	instance_destroy(O_SpearProps);
}