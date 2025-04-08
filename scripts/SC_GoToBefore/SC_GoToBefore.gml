function SC_GoToBefore(grid, path, startX, startY, endX, endY) {
	path = path_add();
	if (mp_grid_path(grid, path, startX, startY, endX, endY, 1)) {
		if (mp_grid_path(grid, path, startX, startY, path_get_point_x(path, path_get_number(path) - 2), path_get_point_y(path, path_get_number(path) - 2), 1)) {
			path_start(path, 1, path_action_stop, true);
		}
	}
}