extends "res://src/GameManager.gd"

var better_scene = preload("res://Scenes/Room2.tscn")

func _after_ready():
	Triggers.make_game_better.connect(_on_triggers_make_game_better)

func _quit_attempt():
	_dialog_tree_manager.OpenDialogTree("Attempt To Quit")

func _on_triggers_make_game_better():
	print("Signal make game better emitted")
	get_tree().change_scene_to_packed(better_scene)
