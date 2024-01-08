extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# need to check to see if the following file paths exist. 
	var fileName
	
	
	var fileScore 
	
	
	if !FileAccess.file_exists("user://gameNames.txt") or !FileAccess.file_exists("user://gameScores.txt"):
		fileName = FileAccess.open("user://gameNames.txt", FileAccess.WRITE)
		fileScore= FileAccess.open("user://gameScores.txt", FileAccess.WRITE)
		var count = 0 
		while count < 5:
			fileName.store_string("NA\n")
			fileScore.store_string("0\n")
			count = count + 1
		fileName.close()
		fileScore.close()
		print("balls")
	

func _process(delta):
	if Input.is_action_just_pressed("accept"):
		get_tree().change_scene_to_file("res://mainGame.tscn")
	if Input.is_action_just_pressed("back"):
		# send notification to quit game 
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()
		
