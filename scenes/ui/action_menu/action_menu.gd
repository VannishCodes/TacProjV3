extends PanelContainer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel"):
		if self.is_visible_in_tree():
			close_menu()
			accept_event()
	elif self.is_visible_in_tree():
		accept_event()

func _on_grid_on_movement_simulated() -> void:
	open_menu()

func open_menu() -> void:
	show()
	$"VBoxContainer/Attack Button".grab_focus()

func close_menu() -> void:
	hide()
