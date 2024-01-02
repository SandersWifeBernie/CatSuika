extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_node("scoreDisplay").bbcode_enabled = true
	self.get_node("scoreDisplay").set_text(String(Global.getScore()))

func _process(delta):
	# every frame we set the text to be the value of the score ensuring it changes as soon as the score is updated
	self.get_node("scoreDisplay").set_text(String(Global.getScore()))



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
