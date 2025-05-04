if (typeof(O_Global.sumonMobsFly) == "array") {
	array_push(O_Global.sumonMobsFly, id);
	sumonMobId = array_length(O_Global.sumonMobsFly);
}

var sumonMobMap = instance_create_layer(floor(x / 32) * 8 + 68, floor(y / 32) * 8 + 68 + O_Global.mapHeight * 32, "Map", O_SumonMobGroundMap);
sumonMobMap.sumonMobID = sumonMobId;