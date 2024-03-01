extends Node2D

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST && $CharacterBody2D.ready_to_quit:
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_auto_accept_quit(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
