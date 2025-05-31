extends Node2D
class_name TileHandler

var tiles : Dictionary = {}

func add_tile(coords : Vector2i) -> Tile:
	var new_tile = Tile.new()
	tiles[coords] = new_tile
	return new_tile
	
func get_tile(coords : Vector2i) -> Tile:
	return tiles[coords]
