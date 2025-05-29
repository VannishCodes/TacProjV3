extends Node2D

var grid : AStarGrid2D

func _ready() -> void:
	grid = AStarGrid2D.new()
	grid.cell_size = Vector2(Globals.TILE_SIZE, Globals.TILE_SIZE)
	grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	grid.update()

func add_region(rect : Rect2i) -> void:
	grid.region = rect
	grid.update()
	
func block_tiles(tiles : Array[Vector2i]) -> void:
	for tile in tiles:
		if grid.region.has_point(tile):
			grid.set_point_solid(tile, true)
	
func unblock_tiles(tiles : Array[Vector2i]) -> void:
	for tile in tiles:
		if grid.region.has_point(tile):
			grid.set_point_solid(tile, false)
	
