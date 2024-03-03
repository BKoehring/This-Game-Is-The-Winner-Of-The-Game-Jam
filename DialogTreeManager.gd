extends Node

var _dialog_tree_dict = {}

func ParseDialogXml():
	var parser = XMLParser.new()
	
	parser.open("res://Dialog/DialogTrees.xml")
	while parser.read() != ERR_FILE_EOF:
		if parser.get_node_type() == XMLParser.NODE_ELEMENT && parser.get_node_name() == "DialogTree":
			var dialog_tree = DialogTree.new()
			var tree_name = parser.get_named_attribute_value("name")
			parser.read()
			if parser.get_node_name() == "DialogBox":
				dialog_tree.root = _parse_dialog_box(parser)
			_dialog_tree_dict[tree_name] = dialog_tree

func _parse_dialog_box(parser: XMLParser):
	var dialog_tree_node = DialogTreeNode.new()
	while !(parser.get_node_type() == XMLParser.NODE_ELEMENT_END && parser.get_node_name() == "DialogBox"):
		parser.read()
		if parser.get_node_type() == XMLParser.NODE_ELEMENT:
			match parser.get_node_name():
				"Dialog":
					parser.read()
					dialog_tree_node.dialog_prop = parser.get_node_data()
				"Option":
					_parse_dialog_option(parser, dialog_tree_node)
	return dialog_tree_node

func _parse_dialog_option(parser: XMLParser, dialog_tree_node: DialogTreeNode):
	var option_text: String
	var node_index = -1
	var option_type = "end"
	while !(parser.get_node_type() == XMLParser.NODE_ELEMENT_END && parser.get_node_name() == "Option"):
		parser.read()
		if parser.get_node_type() == XMLParser.NODE_ELEMENT:
			match parser.get_node_name():
				"Text":
					parser.read()
					option_text = parser.get_node_data()
				"DialogBox":
					node_index = dialog_tree_node.AddNode(_parse_dialog_box(parser))
					option_type = "dialog"
					dialog_tree_node.AddDialogOption(option_text, option_type, node_index)
				"Script":
					parser.read()
					option_type = "script"
					dialog_tree_node.AddDialogOption(option_text, option_type, parser.get_node_data())
	if option_type == "end":
		dialog_tree_node.AddDialogOption(option_text, option_type)

func OpenDialogTree(tree_name: String):
	var dialog_tree = _dialog_tree_dict[tree_name]
	add_child(dialog_tree)
	dialog_tree.OpenDialogTree()
