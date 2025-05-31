extends PanelContainer

#Heavily spaghettified, please edit
func _on_turn_handler_turn_queue_changed(turn_queue : Dictionary) -> void:
	var keys : Array[int]
	keys = turn_queue.keys()
	
	for child in $HBoxContainer.get_children():
		$HBoxContainer.remove_child(child)
		child.queue_free()
	
	var character : Character
	var texture_rect : TextureRect
	for key in keys:
		character = turn_queue[key]
		texture_rect = TextureRect.new()
		texture_rect.texture = character.get_child(0).sprite_frames.get_frame_texture("default", 0)
		texture_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
		texture_rect.custom_minimum_size.x = 16.0
		texture_rect.custom_minimum_size.y = 16.0
		$HBoxContainer.add_child(texture_rect)
		
