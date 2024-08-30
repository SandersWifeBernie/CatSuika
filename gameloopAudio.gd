extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	autoplay = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (get_tree().get_current_scene().name == "titleScreen" or get_tree().get_current_scene().name == "leaderBoard" or get_tree().get_current_scene().name == "nameEntry" or get_tree().get_current_scene().name == "gameOver") and self.playing == true:
		self.stop()
		self.playing = false
		
	elif get_tree().get_current_scene().name == "mainGame" and self.playing == false:
		self.play(0.0)
		self.playing = true
