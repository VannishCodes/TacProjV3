extends PanelContainer

func _on_grid_on_cursor_moved(tile : Tile) -> void:
	if tile.character:
		show()
		$Label.text = tile.character.name
	else: hide()
