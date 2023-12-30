extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".set_contact_monitor(true)
	$".".set_max_contacts_reported(100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pineapple_body_entered(body):
	if body.get_collision_layer() == 513:
		#this will be the position for the grape
		 
		var newPosition = Vector2(body.get_position()[0], body.get_position()[1])
		body.set_contact_monitor(false)
		
		var scene = load("res://melon.tscn")
		var instance = scene.instance()
		# we can add this to the current playing scene so that it will be destroyed at the right time 
		get_tree().current_scene.add_child(instance)
		# once it's been added to the scene we need to set it to the proper coordinates 
		instance.set_position(newPosition)
		
		body.queue_free()
		self.queue_free()
