extends Node2D

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_released():
		return
	
	if event.is_action("up"):
		move_cursor(Vector2i.UP)
	elif event.is_action("down"):
		move_cursor(Vector2i.DOWN)
	elif event.is_action("left"):
		move_cursor(Vector2i.LEFT)
	elif event.is_action("right"):
		move_cursor(Vector2i.RIGHT)
		
	get_tile_info()

func move_cursor(direction : Vector2i) -> void:
	var tile_map : TileMapLayer
	tile_map = get_tree().get_first_node_in_group("map_tiles")
	
	if not tile_map:
		return
	
	var cell : Vector2i = tile_map.local_to_map(self.position)
	cell += direction
	
	if $"..".is_in_boundsv(cell):
		var global_direction = Vector2(direction) * Globals.TILE_SIZE
		global_position += global_direction

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
