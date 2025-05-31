extends Node2D
class_name TurnHandler

var current_character : Character
var current_character_index : int = 0
var active_characters : Array[Character]

var turn_queue : Dictionary[int, Character]
signal turn_queue_changed

func initialize(characters : Array[Character]) -> void:
	active_characters = characters
	connect_characters()
	current_character = active_characters[current_character_index]
	manage_turn()
	for i in characters.size():
		turn_queue[20*i] = characters[i]
	turn_queue_changed.emit(turn_queue)

func connect_characters() -> void:
	for character : Character in active_characters:
		character.turn_ended.connect(end_turn)

func manage_turn() -> void:
	current_character.play_turn()
	
func move_index() -> void:
	current_character_index = (current_character_index + 1) % active_characters.size()
	current_character = active_characters[current_character_index]
	
func end_turn() -> void:
	move_index()
	manage_turn()
