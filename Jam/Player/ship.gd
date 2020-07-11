extends KinematicBody2D

signal shoot

export (int) var speed = 400
export (float) var rotation_speed = 2
export (float) var friction = 0.78

export (float) var fire_rate = 1
export (PackedScene) var Bullet = preload("res://Bullet/Bullet.tscn")

var can_shoot = true
var guns = []

var velocity = Vector2()
var rotation_dir = 0
var acc = Vector2()

func _ready():
	guns = [$Right, $Left, $Top]
	$GunTimer.wait_time = fire_rate

func shoot(cannon):
	emit_signal("shoot", Bullet, cannon.global_position, rotation + cannon.rotation)
	can_shoot = false
	print("cant shoot")
	$GunTimer.start()

func _process(_delta):
	get_input()

func get_input():
	bulletloop()

func bulletloop():
	if (Input.is_action_pressed("cannon_front") && can_shoot):
		shoot($Top)
	if (Input.is_action_pressed("cannon_left") && can_shoot):
		shoot($Left)
	if (Input.is_action_pressed("cannon_right") && can_shoot):
		shoot($Right)
	

func _physics_process(delta):
	rotation_dir = 0

	if Input.is_action_pressed('turn_right'):
		rotation_dir += 1
	if Input.is_action_pressed('turn_left'):
		rotation_dir -= 1
	if Input.is_action_pressed('thrust'):
		acc = Vector2(0, -speed).rotated(rotation)
	else:
		acc = Vector2(0, 0)
	velocity += acc * delta
	rotation += rotation_dir * rotation_speed * delta

	var _movement = move_and_slide(velocity, Vector2(0, 0))

	velocity = velocity.linear_interpolate(Vector2(0,0), friction * delta)

func _on_GunTimer_timeout():
	can_shoot = true
	print("can shoot")
