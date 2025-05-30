extends Node2D
class_name Grid

var grid : AStarGrid2D
@onready var cursor : AnimatedSprite2D = $Cursor

signal on_cursor_moved

func _ready() -> void:
	grid = AStarGrid2D.new()
	grid.region = get_tree().get_first_node_in_group("map_tiles").get_used_rect()
	grid.cell_size = Vector2(Globals.TILE_SIZE, Globals.TILE_SIZE)
	grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	grid.update()
	on_cursor_moved.emit(cursor.global_position)
	
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
		on_cursor_moved.emit(cursor.global_position)

#Needs changes
func get_active_players() -> Array[Character]:
	var active_characters : Array[Character] = []
	for node in $Characters.get_children():
		active_characters.append(node)
	return active_characters
	
