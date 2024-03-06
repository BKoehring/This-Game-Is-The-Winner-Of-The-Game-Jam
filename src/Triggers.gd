extends Node

signal quit_game
signal make_game_better

func GetSignal(signal_name: String):
	match signal_name:
		"make_game_better":
			return make_game_better
		"quit_game":
			return quit_game
