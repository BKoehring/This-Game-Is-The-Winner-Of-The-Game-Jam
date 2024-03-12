extends "res://src/GameManager.gd"

func _quit_attempt():
	if Triggers.hurt:
		_dialog_tree_manager.OpenDialogTree("Oh You Want To Quit")
	elif Triggers.papers_found:
		Triggers.final_quit.emit()
	else:
		_dialog_tree_manager.OpenDialogTree("Better Visuals Quit")
