extends Node2D


var cherryCollision
var strawBerryCollision
var boxOpen
# pretty self explanatory this will be used as the score of the current run 
var score 
# use this to store the name of the player as a string 
var playerName
# Called when the node enters the scene tree for the first time.
func _ready():
	cherryCollision = 0
	strawBerryCollision = 0 
	boxOpen = false
	score = 0
	playerName = ""

func updateCherry():
	cherryCollision = cherryCollision + 1

func getScore():
	return score 

func setScore(val):
	score = val

func getBoxOpen():
	return boxOpen


func setBoxOpen(newVal):
	boxOpen = newVal	


func updateStrawBerry():
	strawBerryCollision = strawBerryCollision + 1
# Called every frame. 'delta' is the elapsed time since the previous frame.




