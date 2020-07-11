extends Node2D

const speed = 100
var velocity = Vector2()
#var direction = Vector2(sin(rotation), cos(rotation))
#export var rotation = get_rotation_degrees() 

func _physics_process(delta):
	velocity.x = speed * delta * cos(50)
	velocity.y = speed * delta * sin(50)
	translate(velocity)
	$Shoot.play('shoot')



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
