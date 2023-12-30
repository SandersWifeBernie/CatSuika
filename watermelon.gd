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


func _on_watermelon_body_entered(body):
	if body.get_collision_layer() == 2049:
		# simply delete the two watermelons
		
		body.queue_free()
		self.queue_free()
