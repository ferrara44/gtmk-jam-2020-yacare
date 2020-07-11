extends Area2D

export (int) var speed = 400
var velocity = Vector2()

func start(_position, _direction):
	position = _position
	velocity = Vector2(speed, 0).rotated(rotation)
	rotation = _direction

func _process(delta):
	position += velocity * delta




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
