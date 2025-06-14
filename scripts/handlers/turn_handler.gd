extends Node2D
class_name TurnHandler

var current_character : Character
var active_characters : Array[Character]

var turn_queue : Array[CountablePair]

signal turn_queue_changed
signal current_character_changed

func initialize(characters : Array[Character]) -> void:
	active_characters = characters
	initialize_turn_queue()
	connect_characters()
	manage_turn()

func initialize_turn_queue() -> void:
	for i in active_characters.size():
		turn_queue.append(CountablePair.new(active_characters[i].stats.wait_timer, active_characters[i]))
	turn_queue.sort_custom(sort)
	turn_queue_changed.emit(turn_queue)

func connect_characters() -> void:
	for character : Character in active_characters:
		character.turn_ended.connect(end_turn)

func manage_turn() -> void:
	skip_time(turn_queue.front().first)
	turn_queue_changed.emit(turn_queue)
	current_character = turn_queue.pop_front().second
	current_character_changed.emit(current_character)
	current_character.play_turn()

func skip_time(time : int) -> void:
	for pair in turn_queue:
		pair.first -= time

func end_turn() -> void:
	turn_queue.append(CountablePair.new(current_character.stats.wait_timer, current_character))
	turn_queue.sort_custom(sort)
	manage_turn()
	
func is_player_turn() -> bool:
	return current_character.stats.playable
	
func sort(a, b):
	if a.first < b.first:
		return true
	return false

func _on_action_menu_end_button_pressed() -> void:
	end_turn()
