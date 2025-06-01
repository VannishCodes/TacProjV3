extends Node2D
class_name Character

@export var stats : CharacterStats
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

@warning_ignore("unused_signal")
signal turn_ended	

func _ready() -> void:
	animated_sprite.sprite_frames = stats.sprite_frames
	animated_sprite.play("default")

func play_turn() -> void:
	pass
