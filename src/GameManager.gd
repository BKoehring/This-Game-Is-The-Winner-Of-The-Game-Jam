extends Node2D

class_name GameManager

@onready var _dialog_tree_manager = $DialogTreeManager
@onready var _menu_button = $MenuButton
@onready var _pause_menu = $Menu
var ready_to_quit = false
var _on_papers = false

var open_world_path = "res://Scenes/open_world.tscn"
var better_visuals_path = "res://Scenes/better_visuals.tscn"
var something_to_do_path = "res://Scenes/something_to_do.tscn"
var credits_path = "res://Scenes/credits.tscn"

signal papers_collected

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
	Triggers.final_quit.connect(func(): _dialog_tree_manager.OpenDialogTree("Quit Game"))
	Triggers.quit_game.connect(_on_triggers_quit_game)
	Triggers.take_a_moment.connect(func(): _dialog_tree_manager.OpenDialogTree("Can I Quit Now"))
	Triggers.moment_cut_short.connect(func(): _dialog_tree_manager.OpenDialogTree("Cut Off Moment"))
	Triggers.moment_taken.connect(func(): _dialog_tree_manager.OpenDialogTree("Full Moment"))
	Triggers.open_world.connect(_on_triggers_open_world)
	Triggers.better_visuals.connect(_on_triggers_better_visuals)
	Triggers.something_to_do.connect(_on_triggers_something_to_do)
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
		ready_to_quit = true
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	if event.is_action_pressed("pause"):
		_open_menu()
	if event.is_action_released("action") && _on_papers:
		papers_collected.emit()
		Triggers.papers_found = true
		_dialog_tree_manager.OpenDialogTree("Found Papers")

func _quit_game():
	get_tree().change_scene_to_file(credits_path)

func _on_triggers_quit_game():
	_quit_game()

func _on_triggers_open_world():
	get_tree().change_scene_to_file(open_world_path)
	
func _on_triggers_better_visuals():
	get_tree().change_scene_to_file(better_visuals_path)
	
func _on_triggers_something_to_do():
	get_tree().change_scene_to_file(something_to_do_path)
