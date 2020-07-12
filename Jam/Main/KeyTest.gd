extends Node

var keys = {}
var profile = {
	'thrust': null,
	'turn_left': null,
	'turn_right': null,
	'cannon_front': null,
	'cannon_left': null,
	'cannon_right': null
}
var rand = RandomNumberGenerator.new()
var needKey = ''
var loaded = false

func _ready():
	loaded = true
	randomize();
	# Set all keys with codes from 65 to 90 as alive.
	# Keys can either be "alive", "active", or "dead"
	for i in range (65, 91):
		keys[i] = "alive"

func take_damage(dmg):
	# Hits a random non-dead key.
#	for i in range (0,dmg):
	var i = 0
	while (i<dmg):
		var target = rand.randi_range(65,90)
		if (keys[target] == "dead"):
			pass
		else:
			if (keys[target] != "dead" && keys[target] != "alive"):
				change_action_key(keys[target], null)
			keys[target] = "dead"
			i+=1
	check_death()
	
func check_death():
	# Sorts through the whole set of keys looking for survivors,
	# if there are none the game's over.
	for i in range (65,91):
		if (keys[i] != "dead"):
			return
	#TODO: destroy ship and game over
	pass

func _process(_delta):
	if loaded:
		if (profile['thrust'] == null):
			get_node('../CanvasLayer/thrustlabel').visible =  true
			needKey = 'thrust'
#			print('Loco dame cañamo')

func change_action_key(action_name, key_scancode):
	erase_action_events(action_name)
	var new_event = InputEventKey.new()
	new_event.set_scancode(key_scancode)
	InputMap.action_add_event(action_name, new_event)
	profile[action_name] = key_scancode

func erase_action_events(action_name):
	var input_events = InputMap.get_action_list(action_name)
	for event in input_events:
		InputMap.action_erase_event(action_name, event)

func _input(event):
	if (needKey != ''):
		if event is InputEventKey and event.pressed and (event.scancode >= 65 && event.scancode <= 90):
			if (keys[event.scancode] == "alive"):
				change_action_key(needKey, event.scancode)
				needKey = ''
				return

#		take_damage(24)
#		print(OS.get_scancode_string(event.scancode), " ", event.scancode)
