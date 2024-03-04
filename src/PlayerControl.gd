extends CharacterBody2D

signal quit_override
const SPEED = 300.0

func _input(event):
	if event.is_action_released("quit"):
		quit_override.emit()

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED

func _physics_process(_delta):
	get_input()
	move_and_slide()
