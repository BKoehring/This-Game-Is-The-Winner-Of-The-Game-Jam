extends Panel

class_name DialogTree

var root: DialogTreeNode
var _current_node : DialogTreeNode
var _dialog_box_scene = preload("res://Dialog/DialogBox.tscn")

func OpenDialogTree():
	_current_node = root
	_create_dialog_box()

func _create_dialog_box():
	var dialog_box = _dialog_box_scene.instantiate()
	dialog_box.SetText(_current_node.dialog_prop)
	
	for option_index in range(_current_node.TotalOptions()):
		dialog_box.AddButton(_current_node.GetDialogOptionText(option_index), _button_pressed, [dialog_box, option_index])
	add_child(dialog_box)

func _button_pressed(args):
	var dialog_box = args[0]
	var option_index = args[1]
	
	remove_child(dialog_box)
	dialog_box.queue_free()
	
	match _current_node.GetDialogOptionType(option_index):
		"end":
			get_parent().remove_child(self)
		"dialog":
			_current_node = _current_node.GetNode(_current_node.GetDialogOptionArguments(option_index))
			_create_dialog_box()
		"script":
			# run script
			get_parent().remove_child(self)
			_current_node.GetDialogOptionArguments(option_index).emit()
