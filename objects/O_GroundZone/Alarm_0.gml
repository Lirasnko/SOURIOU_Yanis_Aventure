if (typeof(O_Global.mobsGround) == "array") {
	for (var i = 0; i < array_length(O_Global.mobsGround); i++) {
		if (O_Global.mobsGround[i].mobId == mobId) {
			array_push(O_Global.mobsGround[i].zones, id);
		}
	}
}