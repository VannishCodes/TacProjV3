extends PanelContainer

func _on_grid_on_cursor_moved(cell : Vector2i) -> void:
	get_tile_info(cell)

func get_tile_info(cell : Vector2i) -> void:
	var tile_map : TileMapLayer
	tile_map = get_tree().get_first_node_in_group("map_tiles")
	
	if not tile_map:
		return
	
	cell = tile_map.local_to_map(cell)
	var tile_data : TileData = tile_map.get_cell_tile_data(cell)
	
	if tile_data:
		var tile_name : StringName = tile_data.get_custom_data("tile_name")
		$VBoxContainer/Label.text = tile_name
