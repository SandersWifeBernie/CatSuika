extends Node2D
# first row of letters (I'll find a better way I swear)(maybe)
var A = Vector2(429, 242)
var B = Vector2(645, 242)
var C = Vector2(861, 242)
var D = Vector2(1077, 242)
var E = Vector2(1293, 242)
var F = Vector2(1509, 242)
# second row
var G = Vector2(429, 422)
var H = Vector2(645, 422)
var I = Vector2(861, 422)
var J = Vector2(1077, 422)
var K = Vector2(1293, 422)
var L = Vector2(1509, 422)
# third row 
var M = Vector2(429, 602)
var N = Vector2(645, 602)
var O = Vector2(861, 602)
var P = Vector2(1077, 602)
var Q = Vector2(1293, 602)
var R = Vector2(1509, 602)
# fourth row
var S = Vector2(429, 782) 
var T = Vector2(645, 782)
var U = Vector2(861, 782)
var V = Vector2(1077, 782)
var W = Vector2(1293, 782)
var X = Vector2(1509, 782)
# last row 
var Y = Vector2(429, 962)
var Z = Vector2(645, 962)
var OK = Vector2(861, 962)

var symbolNum = 1

func _ready():
	self.get_node("Area2D/AnimatedSprite").play("open")

func _process(delta):
	# the following will define the "movement" of the cursor where it will move to different locations
	# by incrementing the position, may use a velocity vector to make it more smooth later if I have time
	# code for moving right, will only move right if you're not already at the right most cell  
	if Input.is_action_just_pressed("right") and self.global_position.x < 1509:
		self.global_position.x = self.global_position.x + 216
	# code for moving left by one cell, will only go left if you're not already at the left most cell 
	elif Input.is_action_just_pressed("left") and self.global_position.x > 429:
		self.global_position.x = self.global_position.x - 216
	# code for moving up by one cell, remember that coordinate systems for y are backwards! 
	# only moves up if it's not at the highest row
	elif Input.is_action_just_pressed("up") and self.global_position.y > 242:
		self.global_position.y = self.global_position.y - 180
	# code for moving down by one cell, only moves down if it's less then the coordinate of the lowest row 
	elif Input.is_action_just_pressed("down") and self.global_position.y < 962:
		self.global_position.y = self.global_position.y + 180
	# now this one will be a doozy, this will be used to determine what letter the area is hovering over
	# gonna see if I can use a match statement and have different cases be vector2
	elif Input.is_action_just_pressed("accept"):
		match self.global_position:
			A:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "A"
					self.symbolNum = self.symbolNum + 1
			B:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "B"
					self.symbolNum = self.symbolNum + 1
			C:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "C"
					self.symbolNum = self.symbolNum + 1
			D:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "D"
					self.symbolNum = self.symbolNum + 1
			E:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "E"
					self.symbolNum = self.symbolNum + 1
			F:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "F"
					self.symbolNum = self.symbolNum + 1
			G:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "G"
					self.symbolNum = self.symbolNum + 1
			H: 
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "H"
					self.symbolNum = self.symbolNum + 1
			I:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "I"
					self.symbolNum = self.symbolNum + 1
			J:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "J"
					self.symbolNum = self.symbolNum + 1
			K:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "K"
					self.symbolNum = self.symbolNum + 1
			L:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "L"
					self.symbolNum = self.symbolNum + 1
			M:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "M"
					self.symbolNum = self.symbolNum + 1
			N:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "N"
					self.symbolNum = self.symbolNum + 1
			O:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "O"
					self.symbolNum = self.symbolNum + 1
			P:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "P"
					self.symbolNum = self.symbolNum + 1
			Q:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "Q"
					self.symbolNum = self.symbolNum + 1
			R:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "R"
					self.symbolNum = self.symbolNum + 1
			S:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "S"
					self.symbolNum = self.symbolNum + 1
			T:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "T"
					self.symbolNum = self.symbolNum + 1
			U:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "U"
					self.symbolNum = self.symbolNum + 1
			V:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "V"
					self.symbolNum = self.symbolNum + 1
			W:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "W"
					self.symbolNum = self.symbolNum + 1
			X:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "X"
					self.symbolNum = self.symbolNum + 1
			Y:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "Y"
					self.symbolNum = self.symbolNum + 1
			Z:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + "Z"
					self.symbolNum = self.symbolNum + 1
			OK:
				get_tree().change_scene("res://leaderBoard.tscn")
			_:
				if self.symbolNum <= 6:
					Global.playerName = Global.playerName + " "
					self.symbolNum = self.symbolNum + 1
