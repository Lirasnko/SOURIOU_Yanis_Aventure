instance_create_layer(x, y, "DeadMobZoneBack", O_DeadMobZoneBack);
instance_create_layer(x, y, "DeadMobZoneFront", O_DeadMobZoneFront);
var corps = instance_create_layer(x, y, "DeadMob", deadMob);
corps.money = 10 + floor(random(20));
var r = random(1);
if (r < 0.3) {
	corps.life = true;
}
else {
	corps.life = false;
}