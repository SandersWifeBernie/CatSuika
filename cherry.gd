extends RigidBody2D






func _ready():
	$".".set_contact_monitor(true)
	$".".set_max_contacts_reported(1)





func _on_cherry_body_entered(body):
	print("collision")
	if body.get_collision_layer() == 3:
		#this will be the position for the strawberry 
		var newPosition = Vector2(body.get_position()[0], body.get_position()[1])
		
		var scene = preload("res://strawberry.tscn")
		var instance = scene.instance()
		# we can add this to the current playing scene so that it will be destroyed at the right time 
		get_tree().current_scene.add_child(instance)
		# once it's been added to the scene we need to set it to the proper coordinates 
		instance.set_position(newPosition)
		
		body.queue_free()
		self.queue_free()
		print("I'm colliding!!!!")
