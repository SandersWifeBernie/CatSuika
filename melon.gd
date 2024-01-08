extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	var dropZone = get_tree().current_scene.get_node("droppingArea")
	$".".set_contact_monitor(true)
	$".".set_max_contacts_reported(100)


func _process(delta):
	if global_position.y < 150:
		get_tree().change_scene_to_file("res://gameOver.tscn")

func _on_melon_body_entered(body):
	if body.get_collision_layer() == 1025:
		#this will be the position for the grape
		 
		var newPosition = Vector2(body.get_position()[0], body.get_position()[1])
		body.set_contact_monitor(false)
		
		var scene = load("res://watermelon.tscn")
		var instance = scene.instantiate()
		# we can add this to the current playing scene so that it will be destroyed at the right time 
		get_tree().current_scene.add_child(instance)
		Global.setScore(Global.getScore() + 1500)
		# once it's been added to the scene we need to set it to the proper coordinates 
		instance.set_position(newPosition)
		
		body.queue_free()
		self.queue_free()
