extends Node2D

class_name GameManager

@onready var _dialog_tree_manager = $DialogTreeManager
var ready_to_quit = false

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		if ready_to_quit:
			get_tree().quit()
		else:
			_quit_attempt()

func _quit_attempt():
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_auto_accept_quit(false)
	_dialog_tree_manager.ParseDialogXml()

func _input(event):
	if event.is_action_released("quit"):
		_quit_game()
	if event.is_action_released("save"):
		_dialog_tree_manager.OpenDialogTree("Save Game")

func _quit_game():
	ready_to_quit = true
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)

func _on_dialog_tree_manager_quit_game():
	_quit_game()
