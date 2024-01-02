extends RigidBody2D

var isDropped 

var count
# pretty much the same as cherry

func _ready():
	self.count = 0
	var dropZone = get_tree().current_scene.get_node("droppingArea")
	dropZone.connect("body_entered", self, "_on_droppingArea_body_entered")
	self.isDropped = false
	$".".set_contact_monitor(true)
	$".".set_max_contacts_reported(100) 

func _process(delta):
	if self.isDropped == true and self.global_position.y < 221:
		print(self.global_position.y)
		get_tree().change_scene("res://gameOver.tscn")

func _on_droppingArea_body_entered(body):
	
	self.count = self.count + 1
	if self.isDropped == false and self.count == 1:
		self.isDropped = true
		Global.setBoxOpen(false)
		


func _on_strawberry_body_entered(body):
	if body.get_collision_layer() == 5:
		#this will be the position for the grape
		 
		var newPosition = Vector2(body.get_position()[0], body.get_position()[1])
		body.set_contact_monitor(false)
		
		var scene = load("res://grape.tscn")
		var instance = scene.instance()
		# we can add this to the current playing scene so that it will be destroyed at the right time 
		get_tree().current_scene.add_child(instance)
		Global.setScore(Global.getScore() + 4)
		# once it's been added to the scene we need to set it to the proper coordinates 
		instance.set_position(newPosition)
		
		body.queue_free()
		self.queue_free()
