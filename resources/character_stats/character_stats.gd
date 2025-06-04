extends Resource
class_name CharacterStats

#Basic Information
@export var name : StringName
@export var sprite_frames : SpriteFrames
@export var default_texture : Texture2D
@export var playable : bool = false

#Basic Stats
@export var maximum_health_points : int
@export var maximum_mana_points : int
@export var strength : int
@export var magic : int
@export var defense : int
@export var resistance : int
@export var dexterity : int
@export var agility : int
@export var speed : int = 20
@export var movement_speed : int = 4
@export var elemental_affinity : Globals.ELEMENTS

#Complex Stats
var wait_timer : int


#Other Stats
@export var min_attack_range : int = 1
@export var max_attack_range : int = 1

func initialize_complex_stats() -> void:
	calculate_wait_timer()

func calculate_wait_timer() -> void:
	var unrounded_result : float
	unrounded_result = 100.0 * (20.0 / (20.0 + speed))
	print(unrounded_result)
	wait_timer = int(unrounded_result)
	print(wait_timer)
