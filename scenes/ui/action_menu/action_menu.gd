extends PanelContainer

signal attack_button_pressed
signal end_button_pressed

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("cancel"):
		if self.is_visible_in_tree():
			close_menu()
			accept_event()
	elif event.is_action_pressed("act"):
		if self.is_visible_in_tree():
			if $"VBoxContainer/Attack Button".has_focus():
				attack_button_pressed.emit()
				close_menu()
			if $"VBoxContainer/End Turn Button".has_focus():
				end_button_pressed.emit()
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
