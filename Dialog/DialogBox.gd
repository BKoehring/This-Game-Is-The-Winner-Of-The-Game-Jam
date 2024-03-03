extends Node2D

class button_props:
	var text_prop: String
	var action_prop: Callable
	var args

@onready var text_box = $PanelContainer/MarginContainer/VSplitContainer/RichTextLabel
@onready var button_container = $PanelContainer/MarginContainer/VSplitContainer/HSplitContainer
var text_prop: String
var button_props_list: Array[button_props]

func _ready():
	_setText()
	_createButtons()

func _setText():
	text_box.text = text_prop

func _createButtons():
	for btn_props in button_props_list:
		var btn_node = Button.new()
		btn_node.text = btn_props.text_prop
		btn_node.pressed.connect(func(): btn_props.action_prop.call(btn_props.args))
		button_container.add_child(btn_node)

func SetText(text: String):
	text_prop = text
	if text_box:
		_setText()

func AddButton(text: String, pressed_action: Callable, args = null):
	var btn_props = button_props.new()
	btn_props.text_prop = text
	btn_props.action_prop = pressed_action
	btn_props.args = args
	button_props_list.append(btn_props)
	if button_container:
		_createButtons()
