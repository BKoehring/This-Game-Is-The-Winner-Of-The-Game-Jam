extends "res://src/GameManager.gd"

func _quit_attempt():
	_dialog_tree_manager.OpenDialogTree("Attempt To Quit")
