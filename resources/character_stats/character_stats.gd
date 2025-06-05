extends Resource
class_name CharacterStats

#Necessary constants for mathematical calculations
const base_turn_wait_time = 100.0
const wait_time_coefficient = 20.0
const base_critical_strike = 2.0

#Basic Information
@export var name : StringName
@export var sprite_frames : SpriteFrames
@export var default_texture : Texture2D
@export var playable : bool = false

#Basic Stats
@export var maximum_health_points : int = 20
@export var maximum_mana_points : int = 20
@export var strength : int = 5
@export var magic : int = 5
@export var defense : int = 5
@export var resistance : int = 5
@export var dexterity : int = 5
@export var agility : int = 5
@export var speed : int = 5
@export var movement_speed : int = 4
@export var elemental_affinity : Globals.ELEMENTS

#Complex Stats
var wait_timer : int
var evasion : int
var critical_strike_chance : int
var critical_strike_damage : int
var critical_strike_evasion : int
var status_effect_evasion : int

#Other Stats
@export var min_attack_range : int = 1
@export var max_attack_range : int = 1

func initialize_complex_stats() -> void:
	calculate_wait_timer()
	calculate_evasion()
	calculate_critical_strike_chance()
	calculate_critical_strike_damage()
	calculate_critical_strike_evasion()
	calculate_status_effect_evasion()

func calculate_wait_timer() -> void:
	var unrounded_result : float
	unrounded_result = base_turn_wait_time * (wait_time_coefficient / (wait_time_coefficient + speed))
	wait_timer = int(unrounded_result)
	
func calculate_evasion() -> void:
	evasion = agility
	
func calculate_critical_strike_chance() -> void:
	critical_strike_chance = dexterity
	
func calculate_critical_strike_damage() -> void:
	critical_strike_damage = int(base_critical_strike)
	
func calculate_critical_strike_evasion() -> void:
	critical_strike_evasion = agility
	
func calculate_status_effect_evasion() -> void:
	status_effect_evasion = resistance
	
