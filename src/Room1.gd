extends Node2D

var better_scene_path = "res://Scenes/Room2.tscn"

func _ready():
	Triggers.make_game_better.connect(_on_triggers_make_game_better)

func _on_triggers_make_game_better():
	get_tree().change_scene_to_file(better_scene_path)
