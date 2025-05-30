extends Node2D

var grid : AStarGrid2D

func _ready() -> void:
	grid = AStarGrid2D.new()
	grid.region = get_tree().get_first_node_in_group("map_tiles").get_used_rect()
	grid.cell_size = Vector2(Globals.TILE_SIZE, Globals.TILE_SIZE)
	grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	grid.update()
	
func block_tiles(tiles : Array[Vector2i]) -> void:
	for tile in tiles:
		if grid.region.has_point(tile):
			grid.set_point_solid(tile, true)
	
func unblock_tiles(tiles : Array[Vector2i]) -> void:
	for tile in tiles:
		if grid.region.has_point(tile):
			grid.set_point_solid(tile, false)
	
func is_in_boundsv(vector : Vector2i) -> bool:
	return grid.is_in_boundsv(vector)
