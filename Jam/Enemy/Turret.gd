extends Node2D

var player
var cooldown
var rand = RandomNumberGenerator.new()
export (PackedScene) var Laser = preload("res://Bullet/Laser.tscn")
var game

func _ready():
	randomize()
	player = Global.get("player")
	Global.set("turrets",Global.turrets + [self])
	cooldown = get_node("../LaserTimer")
	cooldown.wait_time = rand_range(0,3)
	cooldown.start()
	game = get_tree().get_root().get_node("/root/Game")
	
func _process(_delta):
	player = Global.get("player")
	if (player != null):
		var dir = Vector2(player.global_position - global_position)
		rotation = dir.angle()
	
func pew():
	game.pew(Laser,global_position,rotation)
	cooldown.wait_time = rand_range(0,5)
	cooldown.start()

func _on_LaserTimer_timeout():
	pew()
