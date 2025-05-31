extends PanelContainer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		if self.is_visible_in_tree():
			close_menu()
		else: open_menu()
	elif self.is_visible_in_tree():
		accept_event()
		
func open_menu() -> void:
	show()
	$"VBoxContainer/Return Button".grab_focus()
	
func close_menu() -> void:
	hide()

func _on_return_button_pressed() -> void:
	close_menu()

func _on_exit_button_pressed() -> void:
	get_tree().quit()
