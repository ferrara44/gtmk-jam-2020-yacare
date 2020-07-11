extends KinematicBody2D

signal shoot

export (int) var speed = 400
export (float) var rotation_speed = 2
export (float) var friction = 0.78
#export (PackedScene) var bullet = preload("res://bullet/RigidBody2D.tscn")

export (float) var fire_rate = 0.25
export (PackedScene) var Bullet = preload("res://Bullet/Bullet.tscn")

var can_shoot = true
var active_guns = []

var velocity = Vector2()
var rotation_dir = 0
var acc = Vector2()

func _ready():
	active_guns = [$Right, $Left]
	#change_state(INIT)
	#$GunTimer.wait_time = fire_rate

func shoot():
	for gun in active_guns:
		emit_signal("shoot", Bullet, gun.global_position, rotation + gun.rotation)
	can_shoot = false
	#$GunTimer.start()
	#$LaserSound.play()

func _process(_delta):
	get_input()

func get_input():

	bulletloop()

func bulletloop():

	if Input.is_action_just_pressed("ui_select"):
		shoot()

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


	var _movement = move_and_slide(velocity, Vector2(0, 0))

	velocity = velocity.linear_interpolate(Vector2(0,0), friction * delta)

#func _on_gun_timer_timeout():
	#can_shoot = true 
