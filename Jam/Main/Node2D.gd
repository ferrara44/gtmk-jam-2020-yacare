extends Node2D

var screensize

func _ready():
	screensize = get_viewport().get_visible_rect().size

func _process(_delta):
	if (get_tree().paused == true):
		visible = true
	else:
		visible = false
	position.x = screensize.x/2
	position.y = screensize.y/2
