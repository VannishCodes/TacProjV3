extends Resource
class_name CharacterStats

#Basic Information
@export var name : StringName
@export var sprite_frames : SpriteFrames
@export var default_texture : Texture2D
@export var playable : bool = false

#Basic Stats
#Variable below is temporary
@export var wait_timer : int = 20
@export var movement_speed : int = 4
