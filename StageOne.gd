extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ScoreCounter/UI/Control/ScoreValue.text = str(GameVariables.score)
	$ScoreCounter/UI/Control/LivesValue.text = str(GameVariables.lives)
	$Music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
