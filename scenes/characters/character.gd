extends Node2D
class_name Character

@export var stats : CharacterStats
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

@warning_ignore("unused_signal")
signal turn_ended

func _ready() -> void:
	stats = stats.duplicate()
	stats.initialize_complex_stats()
	animated_sprite.sprite_frames = stats.sprite_frames
	animated_sprite.play("default")

func play_turn() -> void:
	if !stats.playable:
		print("I am a non-playable character and have decided to end my turn!")
		turn_ended.emit()
	
func is_playable() -> bool:
	return self.stats.playable
