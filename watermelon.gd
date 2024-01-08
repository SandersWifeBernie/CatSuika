extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	$".".set_contact_monitor(true)
	$".".set_max_contacts_reported(100)


func _process(delta):
	if global_position.y < 150:
		get_tree().change_scene_to_file("res://gameOver.tscn")

func _on_watermelon_body_entered(body):
	if body.get_collision_layer() == 2049:
		# update score 
		Global.setScore(Global.getScore() + 3000)
		# simply delete the two watermelons
		body.queue_free()
		self.queue_free()
