var colTop = instance_place(x, y - 2, O_ColliderGround);
var colBot = instance_place(x, y + 2, O_ColliderGround);
var colRight = instance_place(x + 2, y, O_ColliderGround);
var colLeft = instance_place(x - 2, y, O_ColliderGround);

var propTop = instance_place(x, y - 2, O_PropCollision);
var propBot = instance_place(x, y + 2, O_PropCollision);
var propRight = instance_place(x + 2, y, O_PropCollision);
var propLeft = instance_place(x - 2, y, O_PropCollision);

var entityTop = instance_place(x, y - 2, O_EntityGroundCollison);
var entityBot = instance_place(x, y + 2, O_EntityGroundCollison);
var entityRight = instance_place(x + 2, y, O_EntityGroundCollison);
var entityLeft = instance_place(x - 2, y, O_EntityGroundCollison);

if ((colTop > 0 || propTop > 0 || entityTop > 0) && vspeed < 0) {
	vspeed = 0;
}
if ((colBot > 0 || propBot > 0 || entityBot > 0) && vspeed > 0) {
	vspeed = 0;
}
if ((colRight > 0 || propRight > 0 || entityRight > 0) && hspeed > 0) {
	hspeed = 0;
}
if ((colLeft > 0 || propLeft > 0 || entityLeft > 0) && hspeed < 0) {
	hspeed = 0;
}

// Inherit the parent event
event_inherited();