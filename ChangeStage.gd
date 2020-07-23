extends Area2D

export(String, FILE, "*.tscn") var target_stage

func _ready():
	pass


func _on_ChangeStage_body_entered(body):
	if "Player" in body.name:
		GameVariables.lives = 3
		
		var Music = get_parent().get_node("Music")
		Music.stop()
		
		var LevelWinMusic = get_parent().get_node("Player/LevelWin")
		LevelWinMusic.play()
		
		$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene(target_stage)
