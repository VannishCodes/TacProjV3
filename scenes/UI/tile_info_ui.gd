extends PanelContainer

func _on_grid_on_cursor_moved(tile : Tile) -> void:
	if tile.terrain_type:
		$VBoxContainer/Label.text = tile.terrain_type
