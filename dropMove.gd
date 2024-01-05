extends KinematicBody2D
# export lets you edit the value in the editor so you don't have to re write the number every time
# 400 seems good since we don't want it going too fast
export var speed = 300
var numGenerator
var isSpawn = false 

func getFruit():
	# this function will be used to determine what fruit spawns
	# num will represent the random number generated 
	# this number will range from 1 to 5  
	var num = numGenerator.randi() % 5 + 1
	# now there is five possible cases for what num could be 
	# we'll go through these cases with a match statement (aka a switch statement)
	match num: 
		1:
			return "res://cherry.tscn"
		2:
			return "res://strawberry.tscn"
		3:
			return "res://grape.tscn"
		4:
			return "res://orange.tscn"
		5:
			return "res://perssiman.tscn"
		_:
			return "res://strawberry.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	numGenerator = RandomNumberGenerator.new()
	numGenerator.randomize()
	var scene = load(self.getFruit())
	var instance = scene.instance()
	instance.set_global_position(self.get_node("spawner").get_global_position())
	get_tree().current_scene.call_deferred("add_child", instance)
	
	
	
# delta is the time between the current check and the last 
func _process(delta):
	#before we calculate even the movement we want to check if we need to close the box 
	
	if Global.getBoxOpen() == false and isSpawn == true:
		$".".get_node("bottom").disabled = false
		# to test we'll spawn a cherry at the appropriate position in the box
		# now that we have the cherry spawner working we want to make it randomly spawn a cherry, strawberry, grape
		# orange or perssiman which gives us 5 cases 
		# this is defined in the get fruit method
		var scene = load(self.getFruit())
		var instance = scene.instance()
		# then add instance to the tree
		instance.set_position(self.get_node("spawner").get_global_position()) 
		get_tree().current_scene.add_child(instance)
		
		instance.isDropped = false
		isSpawn = false
	
	var velocity = Vector2.ZERO # velocity vector of the dropper, starts at [0, 0]
	# if the user is going left on the stick 
	if Input.is_action_pressed("left"):
		# then decrement the x velocity  
		velocity.x = velocity.x - 1
	# in the event that the user is going right on the stick 
	if Input.is_action_pressed("right"):
		# then we want to increment the velocty by 1 this way the direction of the x component is to the right  
		velocity.x = velocity.x + 1
	# we got the direction of the vector now we want to get the length and normalize it 
	
	if Input.is_action_just_pressed("accept") and Global.getBoxOpen() == false:
		$".".get_node("bottom").disabled = true
		Global.setBoxOpen(true)
		isSpawn = true
	if velocity.length() > 0: 
		velocity = velocity.normalized() * speed
	# after this we don't define anything for up and down since we only want the dropper to have horizontal movement 
	position = velocity * delta + position 
	# we can clamp the position to be the edges of the box, lemme find out what that is 
	position.x = clamp(position.x, 5, 350)
	
