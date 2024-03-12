extends "res://src/GameManager.gd"

func _after_ready():
	Triggers.find_papers = true
	_dialog_tree_manager.OpenDialogTree("Something To Do")

func _quit_attempt():
	if Triggers.hurt:
		_dialog_tree_manager.OpenDialogTree("Oh You Want To Quit")
	elif Triggers.papers_found:
		Triggers.final_quit.emit()
	else:
		_dialog_tree_manager.OpenDialogTree("Something To Do Quit")
