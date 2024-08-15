extends RigidBody2D


var isDropped 
var count

# pretty much the same as cherry

func _ready():
	self.count = 0
	self.isDropped = false
	$".".set_contact_monitor(true)
	$".".set_max_contacts_reported(100) 

func _process(delta):
	if self.isDropped == true and self.global_position.y < 176:
		get_tree().change_scene_to_file("res://gameOver.tscn")
	elif self.isDropped == false and self.global_position.y >= 176:
		self.isDropped = true
		Global.setBoxOpen(false)


func _on_perssiman_body_entered(body):
	if body.get_collision_layer() == 33:
		#disable the contact monitoring of the other object 
		body.set_contact_monitor(false)
		#this way there isn't two signals
		# this will be the position for the strawberry 
		var newPosition = Vector2(body.get_position()[0], body.get_position()[1])
		
		#self.get_node("CollisionShape2D").disabled = true
		#body.get_node("CollisionShape2D").disabled = true
		var scene = load("res://apple.tscn")
		var instance = scene.instantiate()
		# once we create a new instance we increment the cherry colli 
		# we can add this to the current playing scene so that it will be destroyed at the right time 
		get_tree().current_scene.add_child(instance)
		Global.setScore(Global.getScore() + 37)
		# once it's been added to the scene we need to set it to the proper coordinates 
		instance.set_position(newPosition)
		body.queue_free()
		self.queue_free()
