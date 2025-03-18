var colTop = instance_place(x, y - 2, O_ColliderFly);
var colBot = instance_place(x, y + 2, O_ColliderFly);
var colRight = instance_place(x + 2, y, O_ColliderFly);
var colLeft = instance_place(x - 2, y, O_ColliderFly);

if (colTop > 0 && vspeed < 0) {
	vspeed = 0;
}
if (colBot > 0 && vspeed > 0) {
	vspeed = 0;
}
if (colRight > 0 && hspeed > 0) {
	hspeed = 0;
}
if (colLeft > 0 && hspeed < 0) {
	hspeed = 0;
}

// Inherit the parent event
event_inherited();