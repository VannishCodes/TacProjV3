extends Node2D
class_name TileHandler

var tiles : Dictionary = {}

func add_tile(coords : Vector2i) -> Tile:
	var new_tile = Tile.new()
	tiles[coords] = new_tile
	return new_tile
	
func get_tile(coords : Vector2i) -> Tile:
	return tiles[coords]

func paint_movement_tiles(array : Array) -> void:
	for tile in array:
		$Overlay.set_cell(tile, 0, Vector2i(0, 0), 0)
		
func paint_attack_tiles(array : Array) -> void:
	for tile in array:
		$Overlay.set_cell(tile, 1, Vector2i(0, 0), 0)
