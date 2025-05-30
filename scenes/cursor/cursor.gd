extends Node2D

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_released():
		return
	
	if event.is_action("up"):
		global_position.y -= Globals.TILE_SIZE
	elif event.is_action("down"):
		global_position.y += Globals.TILE_SIZE
	elif event.is_action("left"):
		global_position.x -= Globals.TILE_SIZE
	elif event.is_action("right"):
		global_position.x += Globals.TILE_SIZE
		
	get_tile_info()

func get_tile_info() -> void:
	var tile_map : TileMapLayer
	tile_map = get_tree().get_first_node_in_group("map_tiles")
	
	if not tile_map:
		return
	
	var cell : Vector2i = tile_map.local_to_map(self.position)
	var tile_data : TileData = tile_map.get_cell_tile_data(cell)
	
	if tile_data:
		var tile_name : StringName = tile_data.get_custom_data("tile_name")
		print(tile_name)
