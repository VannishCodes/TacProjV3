extends Node2D

@onready var turn_handler : TurnHandler = $"Turn Handler"
@onready var current_level : Level = $Level

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	turn_handler.initialize(current_level.get_active_characters())
