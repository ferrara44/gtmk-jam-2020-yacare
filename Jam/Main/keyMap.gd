extends RichTextLabel

var keys = {}
var keysLoaded = false
var c_Alive=Color(0,235,0)
var c_Dead=Color("ff0000")


func _ready():
	keys = get_node('../../../KeyMapper').keys
	keysLoaded = true

func _process(_delta):
	clear()
	if (keysLoaded):
		for i in range (65,91):
			add_text(OS.get_scancode_string(i))
			add_text(": ")
			if (keys[i] == "dead"):
# warning-ignore:return_value_discarded
				append_bbcode("[color=red]Dead[/color]")
			elif (keys[i] == "alive"):
# warning-ignore:return_value_discarded
				append_bbcode("[color=lime]Alive[/color]")
			else:
				add_text(keys[i].capitalize())
			newline()
