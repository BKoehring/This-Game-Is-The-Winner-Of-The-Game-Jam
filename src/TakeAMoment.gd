extends Node

var _timer: Timer
var _moment_started = false
var _moment_finished = false

func _ready():
	_timer = Timer.new()
	_timer.timeout.connect(_moment_taken)
	_timer.one_shot = true
	add_child(_timer)
	Triggers.take_a_moment.connect(_take_a_moment)
	Triggers.can_i_quit_now.connect(_can_i_quit_now)

func _take_a_moment():
	if !_moment_started:
		_timer.start(5)
		_moment_started = true

func _can_i_quit_now():
	if _moment_finished:
		Triggers.moment_taken.emit()
	else:
		Triggers.moment_cut_short.emit()

func _moment_taken():
	_moment_finished = true
