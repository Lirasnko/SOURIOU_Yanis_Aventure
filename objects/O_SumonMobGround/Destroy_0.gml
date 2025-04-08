instance_create_layer(x, y, "DeadMob", deadMob);

if (typeof(O_Global.sumonMobsGround) == "array") {
	for(var i = 0; i < array_length(O_Global.sumonMobsGround); i++) {
		if(array_get(O_Global.sumonMobsGround, i) == id) {
			array_delete(O_Global.sumonMobsGround, i, 1);
		}
	}
}