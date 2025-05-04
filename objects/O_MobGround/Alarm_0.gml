if (typeof(O_Global.mobsGround) == "array") {
	array_push(O_Global.mobsGround, id);
}

var mobMap = instance_create_layer(floor(x / 32) * 8 + 68, floor(y / 32) * 8 + 68 + O_Global.mapHeight * 32, "Map", O_MobGroundMap);
mobMap.mobID = mobId;