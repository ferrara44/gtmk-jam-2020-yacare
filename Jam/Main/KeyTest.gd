extends Node


func _input(event):
	if event is InputEventKey and event.pressed:
		print(OS.get_scancode_string(event.scancode), " ", event.scancode)
