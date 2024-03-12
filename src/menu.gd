extends CanvasLayer

@onready var resume_btn = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Resume
@onready var save_btn = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Save
@onready var quit_btn = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Quit

signal resume_btn_pressed
signal save_btn_pressed
signal quit_btn_pressed

func OpenMenu():
	visible = true

func CloseMenu():
	visible = false

func _ready():
	resume_btn.pressed.connect(func(): resume_btn_pressed.emit())
	save_btn.pressed.connect(func(): save_btn_pressed.emit())
	quit_btn.pressed.connect(func(): quit_btn_pressed.emit())
