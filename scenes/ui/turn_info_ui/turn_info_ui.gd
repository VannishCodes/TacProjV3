extends PanelContainer

var character_box_size_x : int = 16
var character_box_size_y : int = 16
var font_size : int = 14

@onready var timing_container : HBoxContainer = $VBoxContainer/TimingContainer
@onready var character_container : HBoxContainer = $VBoxContainer/CharacterContainer

func _on_turn_handler_turn_queue_changed(turn_queue : Array[CountablePair]) -> void:
	empty_containers()

	var character : Character
	var texture_rect : TextureRect
	var label : Label
	for pair in turn_queue:
		character = pair.second
		texture_rect = TextureRect.new()
		texture_rect.texture = character.stats.default_texture
		initialize_texture_rect(texture_rect)
		label = Label.new()
		label.text = str(pair.first)
		label.add_theme_font_size_override("font_size", font_size)
		timing_container.add_child(label)
		character_container.add_child(texture_rect)
		
func empty_containers() -> void:
	for child in timing_container.get_children():
		timing_container.remove_child(child)
		child.queue_free()
	
	for child in character_container.get_children():
		character_container.remove_child(child)
		child.queue_free()
		
func initialize_texture_rect(texture_rect : TextureRect) -> void:
	texture_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
	texture_rect.custom_minimum_size.x = character_box_size_x
	texture_rect.custom_minimum_size.y = character_box_size_y
