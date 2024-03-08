extends Node2D

class_name GameManager

@onready var _dialog_tree_manager = $DialogTreeManager
@onready var _menu_button = $MenuButton
@onready var _pause_menu = $Menu
var ready_to_quit = false

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		if ready_to_quit:
			get_tree().quit()
		else:
			_quit_attempt()

func _quit_attempt():
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	Triggers.quit_game.connect(_on_triggers_quit_game)
	get_tree().set_auto_accept_quit(false)
	_dialog_tree_manager.ParseDialogXml()
	_menu_button.open_menu.connect(_open_menu)
	_pause_menu.resume_btn_pressed.connect(_menu_resume_game)
	_pause_menu.save_btn_pressed.connect(_menu_save_game)
	_pause_menu.quit_btn_pressed.connect(_menu_quit_game)
	_after_ready()

func _after_ready():
	pass

func _open_menu():
	_pause_menu.OpenMenu()

func _menu_resume_game():
	_pause_menu.CloseMenu()

func _menu_save_game():
	_pause_menu.CloseMenu()
	_dialog_tree_manager.OpenDialogTree("Save Game")

func _menu_quit_game():
	_pause_menu.CloseMenu()
	_quit_attempt()

func _input(event):
	if event.is_action_pressed("quit"):
		_quit_game()
	if event.is_action_pressed("pause"):
		_open_menu()

func _quit_game():
	ready_to_quit = true
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)

func _on_triggers_quit_game():
	_quit_game()
