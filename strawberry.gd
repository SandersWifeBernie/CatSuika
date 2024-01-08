extends RigidBody2D

var isDropped 
var fromCombine
var count
# pretty much the same as cherry

func _ready():
	self.count = 0
	var dropZone = get_tree().current_scene.get_node("droppingArea")
	dropZone.body_entered.connect(_on_droppingArea_body_entered, CONNECT_ONE_SHOT)
	self.isDropped = false
	$".".set_contact_monitor(true)
	$".".set_max_contacts_reported(100)
	# set from combine to be false
	self.fromCombine = false # if it is from a combination then we'll overwrite this value to true in the signal  

func _process(delta):
	if self.isDropped == true and self.global_position.y < 150:
		print(self.global_position.y)
		get_tree().change_scene_to_file("res://gameOver.tscn")
	

func _on_droppingArea_body_entered(body):
	
	self.count = self.count + 1
	if self.isDropped == false and self.count == 1 and self.fromCombine == false:
		self.isDropped = true
		Global.setBoxOpen(false)


func _on_strawberry_body_entered(body):
	if body.get_collision_layer() == 5:
		#this will be the position for the grape
		 
		var newPosition = Vector2(body.get_position()[0], body.get_position()[1])
		body.set_contact_monitor(false)
		
		var scene = load("res://grape.tscn")
		var instance = scene.instantiate()
		
		# we can add this to the current playing scene so that it will be destroyed at the right time 
		get_tree().current_scene.add_child(instance)
		Global.setScore(Global.getScore() + 4)
		instance.fromCombine = true
		# once it's been added to the scene we need to set it to the proper coordinates 
		instance.set_position(newPosition)
		
		body.queue_free()
		self.queue_free()
