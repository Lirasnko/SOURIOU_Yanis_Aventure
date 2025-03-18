var colTop = instance_place(x, y - 2, O_ColliderGround);
var colBot = instance_place(x, y + 2, O_ColliderGround);
var colRight = instance_place(x + 2, y, O_ColliderGround);
var colLeft = instance_place(x - 2, y, O_ColliderGround);

var propTop = instance_place(x, y - 2, O_PropCollision);
var propBot = instance_place(x, y + 2, O_PropCollision);
var propRight = instance_place(x + 2, y, O_PropCollision);
var propLeft = instance_place(x - 2, y, O_PropCollision);

if ((colTop > 0 || propTop > 0) && vspeed < 0) {
	vspeed = 0;
}
if ((colBot > 0 || propBot > 0) && vspeed > 0) {
	vspeed = 0;
}
if ((colRight > 0 || propRight > 0) && hspeed > 0) {
	hspeed = 0;
}
if ((colLeft > 0 || propLeft > 0) && hspeed < 0) {
	hspeed = 0;
}

// Inherit the parent event
event_inherited();