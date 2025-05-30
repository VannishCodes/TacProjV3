extends Node2D
class_name Level

@onready var active_grid : Grid = $Grid

func get_active_characters() -> Array[Character]:
	return active_grid.get_active_characters()
