extends Node2D

func _on_ship_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	b.start(_position, _direction)
	add_child(b)
