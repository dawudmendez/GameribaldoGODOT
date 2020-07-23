extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GameVariables.lives = 3
	GameVariables.score = 0
	$Music.play()

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			get_tree().change_scene("res://MainSpring.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
