extends Node2D

@onready var _dialog_tree_manager = $DialogTreeManager

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		if $CharacterBody2D.ready_to_quit:
			get_tree().quit()
		else:
			_dialog_tree_manager.OpenDialogTree("Attempt To Quit")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_auto_accept_quit(false)
	_dialog_tree_manager.ParseDialogXml()
