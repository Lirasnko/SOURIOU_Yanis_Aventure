function SC_TakeDamage(damage = 1) {
	if(O_LifeManager.takeDamage == true) {
		O_LifeManager.playerLife -= damage;
		O_LifeManager.takeDamage = false;
	
		with(O_LifeManager) {
			alarm_set(0, 90);
		}
	}
}