extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var count
var isDropped 
# pretty much the same as cherry

func _ready():
	self.count = 0
	var dropZone = get_tree().current_scene.get_node("droppingArea")
	dropZone.connect("body_entered", self, "_on_droppingArea_body_entered")
	self.isDropped = false
	$".".set_contact_monitor(true)
	$".".set_max_contacts_reported(100) 

func _process(delta):
	if self.isDropped == true and self.global_position.y < 277:
		print(self.global_position.y)
		get_tree().change_scene("res://gameOver.tscn")
	if self.global_position.y > 850:
		Global.setBoxOpen(false)

func _on_droppingArea_body_entered(body):
	
	self.count = self.count + 1
	
	if self.isDropped == false and self.count == 1:
		self.isDropped = true
		Global.setBoxOpen(false)
		get_tree().current_scene.get_node("droppingArea").disconnect("body_entered", self, "_on_droppingArea_body_entered")


func _on_grape_body_entered(body):
	if body.get_collision_layer() == 9:
		#disable the contact monitoring of the other object 
		body.set_contact_monitor(false)
		#this way there isn't two signals
		# this will be the position for the strawberry 
		var newPosition = Vector2(body.get_position()[0], body.get_position()[1])
		
		#self.get_node("CollisionShape2D").disabled = true
		#body.get_node("CollisionShape2D").disabled = true
		var scene = load("res://orange.tscn")
		var instance = scene.instance()
		# once we create a new instance we increment the cherry colli 
		# we can add this to the current playing scene so that it will be destroyed at the right time 
		get_tree().current_scene.add_child(instance)
		Global.setScore(Global.getScore() + 8)
		# once it's been added to the scene we need to set it to the proper coordinates 
		instance.set_position(newPosition)
		body.queue_free()
		self.queue_free()
