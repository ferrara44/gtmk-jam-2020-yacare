extends KinematicBody2D

const bullet_speed = 1000
var bullet = preload("res://shoottest.tscn")

func _physics_process(delta):
	if Input.is_action_pressed('ui_left'):
		var bullet_instance = bullet.instance()
		bullet_instance.position = get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		
