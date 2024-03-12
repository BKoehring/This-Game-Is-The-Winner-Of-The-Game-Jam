extends "res://src/GameManager.gd"

var _starting_area_has_been_left = false
var _map_area_has_been_left = false
var _cool_thing_checked_out = false
var _cool_thing_visible = false

func _after_ready():
	Triggers.please_go_back.connect(_on_triggers_please_go_back)
	Triggers.something_cool.connect(_on_triggers_something_cool)

func _quit_attempt():
	if Triggers.hurt:
		_dialog_tree_manager.OpenDialogTree("Oh You Want To Quit")
	elif Triggers.papers_found:
		Triggers.final_quit.emit()
	else:
		_dialog_tree_manager.OpenDialogTree("Open World Quit")

func _on_starting_area_body_exited(body):
	if body.name == "Player" && !_starting_area_has_been_left:
		_starting_area_has_been_left = true
		_dialog_tree_manager.OpenDialogTree("Leaving Area")

func _on_map_area_body_exited(body):
	if body.name == "Player" && !_map_area_has_been_left:
		_map_area_has_been_left = true
		_dialog_tree_manager.CloseDialogTree("Leaving Area")
		_dialog_tree_manager.CloseDialogTree("Please Go Back")
		_dialog_tree_manager.OpenDialogTree("Left Area")

func _on_triggers_please_go_back():
	_dialog_tree_manager.OpenDialogTree("Please Go Back")

func _on_triggers_something_cool():
	_cool_thing_visible = true

func _on_cool_thing_area_body_entered(body):
	if body.name == "Player" && !_cool_thing_checked_out && _cool_thing_visible:
		_dialog_tree_manager.OpenDialogTree("Pretty Cool")


func _on_papers_area_body_entered(body):
	if body.name == "Player" && Triggers.find_papers:
		_on_papers = true


func _on_papers_area_body_exited(body):
	if body.name == "Player":
		_on_papers = false
