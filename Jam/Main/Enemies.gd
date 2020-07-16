extends Node

var enemyscene = load("res://Enemy/Enemy.tscn")
var rand = RandomNumberGenerator.new()
var screensize
var player
var _timer = null

func _ready():
	rand.randomize();
	_timer = Timer.new()
	screensize = get_viewport().get_visible_rect().size
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(10)
	_timer.set_one_shot(false)
	_timer.start()
	player = Global.player

func _on_Timer_timeout():
	var enemy = enemyscene.instance()
	var side = rand.randi_range(1,4)
	player = Global.player
	if (player != null):
		match side:
			1: # Right
				var x = player.position.x + screensize.x/2 + 50
				var y = player.position.y - screensize.y/2 + rand_range(0, screensize.y)
				enemy.position.x = x
				enemy.position.y = y
				add_child(enemy)
			2: #Left
				var x = player.position.x - screensize.x/2 - 50
				var y = player.position.y - screensize.y/2 + rand_range(0, screensize.y)
				enemy.position.x = x
				enemy.position.y = y
				add_child(enemy)
			3: #Bottom
				var x = player.position.x - screensize.x/2 + rand_range(0, screensize.x)
				var y = player.position.y + screensize.y/2 + 50
				enemy.position.x = x
				enemy.position.y = y
				add_child(enemy)
			4: #Top
				var x = player.position.x - screensize.x/2 + rand_range(0, screensize.x)
				var y = player.position.y - screensize.y/2 - 50
				enemy.position.x = x
				enemy.position.y = y
				add_child(enemy)
	_timer.set_wait_time(rand_range(0,15))
