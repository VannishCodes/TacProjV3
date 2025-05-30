extends Node2D
class_name Level

@onready var active_grid : Grid = $Grid

func get_active_players() -> Array[Character]:
	return active_grid.get_active_players()
