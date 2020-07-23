extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pera_body_entered(body):
	if "Player" in body.name:
		#$Sound.play()
		GameVariables.score += 300
		
		var LabelNode = get_parent().get_node("ScoreCounter/UI/Control/ScoreValue")
		LabelNode.text = str(GameVariables.score)
		
		var PlayerNode = get_parent().get_node("Player/Fruit")
		PlayerNode.play()
		
		queue_free()
