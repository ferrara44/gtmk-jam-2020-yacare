extends Control


func _ready():
	set_process(true)

func _process(_delta):
	
	if Input.is_action_just_pressed('pause') and get_tree().paused:
		get_tree().paused = false
	   
	elif Input.is_action_just_pressed('pause') and get_tree().paused == false:
		get_tree().paused = true
