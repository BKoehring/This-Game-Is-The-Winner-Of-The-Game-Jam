extends Node2D

@onready var _base_scene = $Player/Camera2D/CanvasLayer/BaseScene

func _ready():
	if Triggers.better_visuals_flag:
		$TileMap.clear_layer(2)
	if Triggers.find_papers:
		$Papers.visible = true
	
	_base_scene.papers_collected.connect(func(): $Papers.visible = false)
