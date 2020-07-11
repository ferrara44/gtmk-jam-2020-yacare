extends KinematicBody2D
export (int) var speed = 400
export (float) var rotation_speed = 2
export (float) var friction = 0.78

var velocity = Vector2()
var rotation_dir = 0
var acc = Vector2()

func _ready():
	pass


func _physics_process(delta):
	rotation_dir = 0

	if Input.is_action_pressed('ui_right'):
		rotation_dir += 1
	if Input.is_action_pressed('ui_left'):
		rotation_dir -= 1
	if Input.is_action_pressed('ui_up'):
		acc = Vector2(0, -speed).rotated(rotation)

	else:
		acc = Vector2(0, 0)



	velocity += acc * delta
	rotation += rotation_dir * rotation_speed * delta

	move_and_slide(velocity, Vector2(0, 0))

	velocity = velocity.linear_interpolate(Vector2(0,0), friction * delta)
