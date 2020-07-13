extends Node2D

var player
signal pew(position,rotation)
var cooldown
var rand = RandomNumberGenerator.new()

func _ready():
	randomize()
	player = Global.get("player")
	Global.set("turrets",Global.turrets + [self])
	cooldown = get_node("../LaserTimer")
	
func _process(_delta):
	var dir = Vector2(player.global_position - global_position)
	rotation = dir.angle()
	
func pew():
	emit_signal("pew",global_position,rotation)
#	print(self, 'pew')
	cooldown.wait_time = rand_range(3,6)
	cooldown.start()

func _on_LaserTimer_timeout():
	pew()
