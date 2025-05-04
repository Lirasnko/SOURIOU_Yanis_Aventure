if (typeof(O_Global.mobsFly) == "array") {
	array_push(O_Global.mobsFly, id);
}

var mobMap = instance_create_layer(floor(x / 32) * 8 + 68, floor(y / 32) * 8 + 68 + O_Global.mapHeight * 32, "Map", O_MobFlyMap);
mobMap.mobID = mobId;