extends CharacterBody2D

var ready_to_quit = false
const SPEED = 300.0

func _input(event):
	if event.is_action_released("quit"):
		ready_to_quit = true
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED

func _physics_process(delta):
	get_input()
	move_and_slide()
