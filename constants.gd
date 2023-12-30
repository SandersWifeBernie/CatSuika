extends Node2D


var cherryCollision
var strawBerryCollision

# Called when the node enters the scene tree for the first time.
func _ready():
	cherryCollision = 0
	strawBerryCollision = 0 

func updateCherry():
	cherryCollision = cherryCollision + 1

func updateStrawBerry():
	strawBerryCollision = strawBerryCollision + 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
