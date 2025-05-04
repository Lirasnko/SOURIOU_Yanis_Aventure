if (typeof(O_Global.mobsFly) == "array") {
	for (var i = 0; i < array_length(O_Global.mobsFly); i++) {
		if (O_Global.mobsFly[i].mobId == mobId) {
			array_push(O_Global.mobsFly[i].zones, id);
		}
	}
}