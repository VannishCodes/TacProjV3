extends Node2D
class_name TileHandler

var tiles : Dictionary = {}
var overlay : TileMapLayer 

func _ready() -> void:
	overlay = get_tree().get_nodes_in_group("map_tiles")[Globals.TILEMAP_LAYERS_GROUP_INDEX.OVERLAY]

func add_tile(coords : Vector2i) -> Tile:
	var new_tile = Tile.new()
	tiles[coords] = new_tile
	return new_tile
	
func get_tile(coords : Vector2i) -> Tile:
	return tiles[coords]

func clear_paint() -> void:
	overlay.clear()

func paint_movement_tiles(array : Array) -> void:
	for tile in array:
		overlay.set_cell(tile, 0, Vector2i(0, 0), 0)
		
func paint_attack_tiles(array : Array) -> void:
	for tile in array:
		overlay.set_cell(tile, 1, Vector2i(0, 0), 0)
