extends RigidBody2D

var isDropped 
var count
func _ready():
	# initialize count to be zero 
	self.count = 0
	# by default we'll have the cherry say that it has not been dropped
	# connect the cherry to the droput zone 
	var dropZone = get_tree().current_scene.get_node("droppingArea")
	dropZone.connect("body_entered", self, "_on_droppingArea_body_entered")
	self.isDropped = false
	$".".set_contact_monitor(true)
	$".".set_max_contacts_reported(100)
	
# process is checked roughly every frame
func _process(delta):
	if self.isDropped == true and self.global_position.y < 220:
		get_tree().change_scene("res://gameOver.tscn")


func _on_cherry_body_entered(body):
	
	if body.get_collision_layer() == 3:
		#disable the contact monitoring of the other object 
		body.set_contact_monitor(false)
		#this way there isn't two signals
		# this will be the position for the strawberry 
		var newPosition = Vector2(body.get_position()[0], body.get_position()[1])
		
		#self.get_node("CollisionShape2D").disabled = true
		#body.get_node("CollisionShape2D").disabled = true
		var scene = load("res://strawberry.tscn")
		var instance = scene.instance()
		# once we create a new instance we increment the cherry colli 
		# we can add this to the current playing scene so that it will be destroyed at the right time 
		get_tree().current_scene.add_child(instance)
		# in the event that the combination is successful we want to update the score 
		Global.setScore(Global.getScore() + 2)
		# once it's been added to the scene we need to set it to the proper coordinates 
		instance.set_position(newPosition)
		body.queue_free()
		self.queue_free()


func _on_droppingArea_body_entered(body):
	self.count = self.count + 1
	if self.isDropped == false and self.count == 1:
		self.isDropped = true
		Global.setBoxOpen(false)
		
		
