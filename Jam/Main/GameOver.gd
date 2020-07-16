extends RichTextLabel

var screensize
var KeyMapper

func _ready():
	KeyMapper = get_node("../../../../../KeyMapper")
	screensize = get_viewport().get_visible_rect().size
	margin_bottom = screensize.y
	margin_right = screensize.x
	margin_left = 0
	margin_top = 0
	visible = false

func _process(_delta):
	var dead = KeyMapper.check_death()
	if (dead == true && Global.player != null):
		visible = true
		Global.player.queue_free()
		Global.player = null
