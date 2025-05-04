if (xPlayer32 != floor(O_Player.x / 32) || yPlayer32 != floor(O_Player.y / 32)) {
	xPlayer32 = floor(O_Player.x / 32);
	yPlayer32 = floor(O_Player.y / 32);
	for (var i = 0; i < 11; i++) {
		for (var j = 0; j < 17; j++) {
			var colX = (floor(O_Player.x / 32) - 8 + j) * 32;
			var colY = (floor(O_Player.y / 32) - 5 + i) * 32;
			var colMapX = (floor(O_Player.x / 32) - 8 + j) * 8 + 64;
			var colMapY = (floor(O_Player.y / 32) - 5 + i) * 8 + 64 + O_Global.mapHeight * 32;
		
			if (colX >= 0 && colY >= 0) {
				var colWall = collision_rectangle(colX, colY, colX + 32, colY + 32, O_ColliderGroundWall, true, false);
				var colHole = collision_rectangle(colX, colY, colX + 32, colY + 32, O_ColliderGroundHole, true, false);
				var colProp = collision_rectangle(colX, colY, colX + 32, colY + 32, O_DeadMob, true, false);
				var colCkPt = collision_rectangle(colX, colY, colX + 32, colY + 32, O_CheckPoint, true, false);
				
				var colWallMap = collision_rectangle(colMapX, colMapY, colMapX + 8, colMapY + 8, O_WallMap, true, false);
				var colHoleMap = collision_rectangle(colMapX, colMapY, colMapX + 8, colMapY + 8, O_HoleMap, true, false);
				var colPropMap = collision_rectangle(colMapX, colMapY, colMapX + 8, colMapY + 8, O_PropMap, true, false);
				var colCkPtMap = collision_rectangle(colMapX, colMapY, colMapX + 8, colMapY + 8, O_CheckpointMap, true, false);
			
				if (colWall > 0 && !(colWallMap > 0)) {
					instance_create_layer(colX / 4 + 64, colY / 4 + 64 + O_Global.mapHeight * 32, "Map", O_WallMap);
				}
				if (colHole > 0 && !(colHoleMap > 0)) {
					instance_create_layer(colX / 4 + 64, colY / 4 + 64 + O_Global.mapHeight * 32, "Map", O_HoleMap);
				}
				if (colProp > 0 && !(colPropMap > 0)) {
					instance_create_layer(colX / 4 + 64, colY / 4 + 64 + O_Global.mapHeight * 32, "Map", O_PropMap);
				}
				if (colCkPt > 0 && !(colCkPtMap > 0)) {
					instance_create_layer(colX / 4 + 64, colY / 4 + 64 + O_Global.mapHeight * 32, "Map", O_CheckpointMap);
				}
			}
		}
	}
}