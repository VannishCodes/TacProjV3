extends Node2D
class_name Grid

@onready var cursor : AnimatedSprite2D = $Cursor
@onready var tile_handler : TileHandler
var grid : AStarGrid2D
var player_locations : Dictionary = {}

signal on_cursor_moved

func _ready() -> void:
	var tile_map_layer : TileMapLayer = get_tree().get_first_node_in_group("map_tiles")
	
	tile_handler = $"Tile Handler"
	
	grid = AStarGrid2D.new()
	grid.region = tile_map_layer.get_used_rect()
	grid.cell_size = Vector2(Globals.TILE_SIZE, Globals.TILE_SIZE)
	grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	grid.update()
	
	initialize_tiles(tile_map_layer)
	initialize_character_locations()
	
	on_cursor_moved.emit(tile_handler.get_tile(tile_map_layer.local_to_map(cursor.global_position)))

func initialize_tiles(tile_map_layer : TileMapLayer) -> void:
	var tile : Tile
	var tile_data : TileData
	for x in tile_map_layer.get_used_rect().size.x:
		for y in tile_map_layer.get_used_rect().size.y:
			tile = tile_handler.add_tile(Vector2i(x,y))
			tile_data = tile_map_layer.get_cell_tile_data(Vector2i(x,y))
			if tile_data:
				var tile_name : StringName = tile_data.get_custom_data("tile_name")
				if tile_name:
					tile.terrain_type = tile_name

func initialize_character_locations() -> void:
	for character in get_active_characters():
		var grid_location : Vector2i
		grid_location = get_character_grid_location(character)
		player_locations[character] = grid_location
		tile_handler.get_tile(grid_location).character = character

func _unhandled_input(event: InputEvent) -> void:
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
	
func block_tiles(tiles : Array[Vector2i]) -> void:
	for tile in tiles:
		if grid.region.has_point(tile):
			grid.set_point_solid(tile, true)
	
func unblock_tiles(tiles : Array[Vector2i]) -> void:
	for tile in tiles:
		if grid.region.has_point(tile):
			grid.set_point_solid(tile, false)

func move_cursor(direction : Vector2i) -> void:
	var tile_map : TileMapLayer
	tile_map = get_tree().get_first_node_in_group("map_tiles")
	
	if not tile_map:
		return
	
	var cell : Vector2i = tile_map.local_to_map(cursor.position)
	cell += direction
	
	if grid.is_in_boundsv(cell):
		var global_direction = Vector2(direction) * Globals.TILE_SIZE
		cursor.global_position += global_direction
		on_cursor_moved.emit(tile_handler.get_tile(cell))

func get_active_characters() -> Array[Character]:
	var active_characters : Array[Character] = []
	for node in $Characters.get_children():
		active_characters.append(node)
	return active_characters

func get_character_grid_location(character : Character) -> Vector2i:
	var tile_map : TileMapLayer
	tile_map = get_tree().get_first_node_in_group("map_tiles")
	
	if not tile_map:
		return Vector2i(0, 0)
	
	return tile_map.local_to_map(character.global_position)
