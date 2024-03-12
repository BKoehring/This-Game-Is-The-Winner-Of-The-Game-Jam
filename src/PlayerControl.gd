extends CharacterBody2D

const SPEED = 300.0
var _circle_sprite = preload("res://Characters/MainCharacter.png")
var _better_sprite = preload("res://Characters/BetterCharacter.png")
@onready var _sprite_node = $Sprite2D

func _ready():
	if Triggers.better_visuals_flag:
		_sprite_node.texture = _better_sprite

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED

func _physics_process(_delta):
	get_input()
	move_and_slide()
