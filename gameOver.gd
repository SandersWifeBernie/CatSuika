extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.get_node("finalScore").set_text("Score: " + str(Global.getScore()))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("accept"):
		get_tree().change_scene_to_file("res://nameEntry.tscn")
