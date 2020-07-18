extends RichTextLabel

func _process(_delta):
	clear()
# warning-ignore:return_value_discarded
	append_bbcode("[color=gold]Enemies Destroyed: [/color]")
	add_text(str(Global.enemiesKilled))
