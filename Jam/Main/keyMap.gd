extends RichTextLabel

var keys = {}
var keysLoaded = false

func _ready():
	keys = get_node('../../../KeyMapper').keys
	keysLoaded = true

func _process(_delta):
	clear()
	if (keysLoaded):
		for i in range (65,91):
			add_text(OS.get_scancode_string(i))
			add_text(": ")
			add_text(keys[i])
			newline()
