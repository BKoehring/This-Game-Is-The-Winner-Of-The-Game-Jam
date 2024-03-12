extends Node2D

var _wait_time = 3.0
var _timer: Timer
@onready var _panel = $CanvasLayer/Panel/VBoxContainer
@onready var _button = $CanvasLayer/Panel/VBoxContainer/CenterContainer/Button

func _ready():
	_panel.modulate.a = 0
	
	_button.disabled = true
	
	_timer = Timer.new()
	_timer.one_shot = true
	_timer.timeout.connect(_timer_on_timeout)
	add_child(_timer)
	_timer.start(_wait_time)

func _process(_delta):
	if(!_timer.is_stopped()):
		var elapsed = _wait_time - _timer.time_left
		_panel.modulate.a = (elapsed / _wait_time)

func _timer_on_timeout():
	_panel.modulate.a = 1
	_button.disabled = false

func _on_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
