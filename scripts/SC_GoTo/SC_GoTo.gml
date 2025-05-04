function SC_GoTo(grid, path, startX, startY, endX, endY) {
	path = path_add();
	if (mp_grid_path(grid, path, startX, startY, endX, endY, 1)) {
		path_start(path, 0.5, path_action_stop, true);
		return(true);
	}
	else {
		return(false);
	}
}