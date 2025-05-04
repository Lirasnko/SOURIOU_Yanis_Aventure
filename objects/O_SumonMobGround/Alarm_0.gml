if (typeof(O_Global.sumonMobsGround) == "array") {
	array_push(O_Global.sumonMobsGround, id);
	sumonMobId = array_length(O_Global.sumonMobsGround);
}

var sumonMobMap = instance_create_layer(floor(x / 32) * 8 + 68, floor(y / 32) * 8 + 68 + O_Global.mapHeight * 32, "Map", O_SumonMobGroundMap);
sumonMobMap.sumonMobID = sumonMobId;