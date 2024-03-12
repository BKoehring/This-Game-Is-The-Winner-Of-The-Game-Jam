extends CharacterBody2D

func _ready():
	visible = false
	$CollisionShape2D.disabled = true
	Triggers.something_cool.connect(_Appear)

func _Appear():
	visible = true
	$CollisionShape2D.disabled = false
