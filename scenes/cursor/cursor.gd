extends Node2D

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
		global_position.y -= Globals.TILE_SIZE
	elif event.is_action_pressed("down"):
		global_position.y += Globals.TILE_SIZE
	elif event.is_action_pressed("left"):
		global_position.x -= Globals.TILE_SIZE
	elif event.is_action_pressed("right"):
		global_position.x += Globals.TILE_SIZE
