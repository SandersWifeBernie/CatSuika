extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scoreFilePath = "user://gameScores.txt"
var nameFilePath = "user://gameNames.txt"
var scoreArr = [0, 0, 0, 0, 0, 0]
var nameArr 

func loadWriteScores():
	var scoreFile = File.new() # initialize file object 
	scoreFile.open(scoreFilePath, File.READ)
	# now have the whole score file as a single string
	var scoreListStr = scoreFile.get_as_text()
	# close this file, since we're done reading for now
	scoreFile.close()
	# split the string into an array by using newline as the delimiter
	var scoreArrStr = scoreListStr.split("\n", true)
	# now have an array containing all the scores 
	# now loop through the scores 
	var i = 0 
	while i < 5:
		# convert these scores to be ints so that we can compare them 
		scoreArr[i] = int(scoreArrStr[i])
		# increment i 
		i = i + 1 

	# now we're gonna read from the names 
	var nameFile = File.new()
	nameFile.open(nameFilePath, File.READ)
	var nameListStr = nameFile.get_as_text()
	nameFile.close()
	# created an array for the names
	nameArr = nameListStr.split("\n", true)
	
	i = 0 
	# loop through the scores once more
	while i < 5:
		# compare the score at the ith index to the current user's score
		if Global.score > scoreArr[i]:
			# insert the new score into the array at the index i 
			scoreArr.insert(i, Global.score)
			# then pop off the last index so that the size stays consistent 
			scoreArr.pop_back()
			# now do the same thing for the array of names 
			nameArr.insert(i, Global.playerName)
			scoreArr.pop_back()
			break
		i = i + 1 
	
	# now we want to open to new files with write privileges and write these new values onto the corresponding files
	# open the score file 
	scoreFile = File.new()
	scoreFile.open(scoreFilePath, File.WRITE)
	# open the file containing names 
	nameFile = File.new()
	nameFile.open(nameFilePath, File.WRITE)
	
	# loop through one more time baby 
	i = 0 
	while i < 5:
		# store the correspondind scores and names onto the file in order  
		scoreFile.store_string(String(scoreArr[i]) + "\n")
		nameFile.store_string(nameArr[i] + "\n")
		i = i + 1
	# we close our files like the good boys we are
	scoreFile.close()
	nameFile.close()

# Called when the node enters the scene tree for the first time.
# we'll use this to set the values of all the text labels to the appropriate strings
func _ready():
	self.loadWriteScores()
	# set the text of the names 
	self.get_node("firstName").set_text("1. " + nameArr[0])
	self.get_node("secondName").set_text("2. " + nameArr[1])
	self.get_node("thirdName").set_text("3. " + nameArr[2])
	self.get_node("fourthName").set_text("4. " + nameArr[3])
	self.get_node("fifthName").set_text("5. " + nameArr[4])
	# set the text of the scores 
	self.get_node("firstScore").set_text(String(scoreArr[0]))
	self.get_node("secondScore").set_text(String(scoreArr[1]))
	self.get_node("thirdScore").set_text(String(scoreArr[2]))
	self.get_node("fourthScore").set_text(String(scoreArr[3]))
	self.get_node("fifthScore").set_text(String(scoreArr[4]))
	
func _process(delta):
	if Input.is_action_just_pressed("accept"):
		Global.score = 0 
		Global.playerName = ""
		get_tree().change_scene("res://titleScreen.tscn")

