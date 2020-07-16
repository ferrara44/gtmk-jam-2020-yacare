extends Area2D

export (int) var speed = 300
var velocity = Vector2()

func start(_position, _direction):
	position = _position
	velocity = Vector2(speed, 0).rotated(_direction)
	rotation = _direction

func _process(delta):
	position += velocity * delta

func _on_Bullet_body_entered(body):
	if "Enemy" in body.name:
		body.queue_free()
		Global.enemiesKilled += 1
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
