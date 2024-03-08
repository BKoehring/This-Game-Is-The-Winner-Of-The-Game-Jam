extends Node2D

signal open_menu

@onready var _button = $MarginContainer/Button

func _ready():
	_button.pressed.connect(func(): open_menu.emit())
