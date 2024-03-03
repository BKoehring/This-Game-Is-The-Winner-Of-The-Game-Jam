extends Node

class_name DialogTreeNode

var _nodes: Array[DialogTreeNode]
var _dialog_options: Array

var dialog_prop: String

func AddNode(node: DialogTreeNode):
	var index = _nodes.size()
	_nodes.append(node)
	return index

func GetNode(index: int):
	return _nodes[index]

func TotalNodes():
	return _nodes.size()

func AddDialogOption(option_text: String, option_type: String, args = -1):
	_dialog_options.append({"text": option_text, "type": option_type, "arguments": args})

func GetDialogOptionText(index: int):
	return _dialog_options[index]["text"]

func GetDialogOptionType(index: int):
	return _dialog_options[index]["type"]
	
func GetDialogOptionArguments(index: int):
	return _dialog_options[index]["arguments"]

func TotalOptions():
	return _dialog_options.size()
