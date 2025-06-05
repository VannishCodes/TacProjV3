extends Node2D

@onready var turn_handler : TurnHandler = $"Turn Handler"
@onready var current_level : Level = $Level

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	turn_handler.initialize(current_level.get_active_characters())

func _unhandled_input(event: InputEvent) -> void:
	if !turn_handler.is_player_turn():
		return
	
	if event.is_action_pressed("act"):
		current_level.active_grid.simulate_character_movement(turn_handler.current_character)

	if event.is_action_pressed("cancel"):
		current_level.active_grid.revert_character_movement_simulation(turn_handler.current_character)

func _on_action_menu_attack_button_pressed() -> void:
	print("Targeting menu not implemented yet")
	print("Damage preview menu not implemented yet")
	print("Here is a damage preview anyway")
	print(CombatCalculator.calculate_hit_chance($Level/Grid/Characters/Character, $Level/Grid/Characters/Character2))
	print(CombatCalculator.calculate_damage_dealt($Level/Grid/Characters/Character, $Level/Grid/Characters/Character2, Globals.DAMAGE_TYPE.PHYSICAL))
