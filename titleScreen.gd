extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# need to check to see if the following file paths exist. 
	var fileName = File.new() 
	
	
	var fileScore = File.new()
	
	
	if !fileName.file_exists("user://gameNames.txt") or !fileScore.file_exists("user://gameScores.txt"):
		fileName.open("user://gameNames.txt", File.WRITE)
		fileScore.open("user://gameScores.txt", File.WRITE)
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
		get_tree().change_scene("res://mainGame.tscn")
