groundGrid = mp_grid_create(0, 0, room_width / 32, (room_height - mapHeight) / 32, 32, 32);
FlyGird = mp_grid_create(0, 0, room_width / 32, (room_height - mapHeight) / 32, 32, 32);
mp_grid_add_instances(groundGird, O_ColliderGround, false);
mp_grid_add_instances(flyGrid, O_ColliderFly, false);