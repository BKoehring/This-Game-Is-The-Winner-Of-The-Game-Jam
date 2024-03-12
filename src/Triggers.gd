extends Node

signal quit_game
signal make_game_better
signal open_world
signal better_visuals
signal something_to_do
signal take_a_moment
signal hurtful
signal moment_taken
signal moment_cut_short
signal can_i_quit_now
signal something_cool
signal please_go_back
signal quit_i_dont_care
signal final_quit

var better_visuals_flag = false
var find_papers = false
var hurt = false
var dont_care = false
var papers_found = false

func _ready():
	hurtful.connect(_hurtful)
	quit_i_dont_care.connect(_quit_i_dont_care)
	better_visuals.connect(_better_visuals)

func GetSignal(signal_name: String):
	match signal_name:
		"make_game_better":
			return make_game_better
		"quit_game":
			return quit_game
		"open_world":
			return open_world
		"better_visuals":
			return better_visuals
		"something_to_do":
			return something_to_do
		"take_a_moment":
			return take_a_moment
		"can_i_quit_now":
			return can_i_quit_now
		"hurtful":
			return hurtful
		"something_cool":
			return something_cool
		"please_go_back":
			return please_go_back
		"final_quit":
			return final_quit
		"quit_i_dont_care":
			return quit_i_dont_care

func _hurtful():
	hurt = true

func _quit_i_dont_care():
	dont_care = true

func _better_visuals():
	better_visuals_flag = true
