instance_create_layer(x, y, "DeadMob", deadMob);

if (typeof(O_Global.mobsGround) == "array") {
	for (var i = 0; i < array_length(O_Global.mobsGround); i++) {
		if (array_get(O_Global.mobsGround, i) == id) {
			array_delete(O_Global.mobsGround, i, 1);
		}
	}
}