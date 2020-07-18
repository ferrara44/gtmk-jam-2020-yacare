extends Control

var _timer = null
var _pauselength = null
var rand = RandomNumberGenerator.new()

func _ready():
	rand.randomize();
	
	_timer = Timer.new()
	add_child(_timer)
	_timer.set_wait_time(rand.randi_range(60,120))
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.one_shot=true
	_timer.start()
	
	_pauselength = Timer.new()
	add_child(_pauselength)
	_pauselength.set_pause_mode(2)
	_pauselength.connect("timeout", self, "_on_Pause_timeout")
	_pauselength.one_shot=true
	_pauselength.set_wait_time(rand.randi_range(5,10))

func _on_Timer_timeout():
	print("timeout!")
	get_tree().paused = true
	_pauselength.set_wait_time(rand.randi_range(2,10))
	_pauselength.start()
	get_node("../../Enemies")._on_Timer_timeout()
	get_node("../../Enemies")._on_Timer_timeout()

func _on_Pause_timeout():
	print("unpause!")
	get_tree().paused = false
	_timer.set_wait_time(rand.randi_range(30,60))
	_timer.start()
