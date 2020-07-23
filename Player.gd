extends KinematicBody2D

const SPEED = 60
const GRAVITY = 10
const JUMP_POWER = -280
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var on_ground = false
var is_dead = false

func _physics_process(delta):
		
	if is_dead == false:
		if Input.is_action_pressed("ui_right"):		
			velocity.x = SPEED
			$AnimatedSprite.flip_h = false
			if on_ground == true:
				$AnimatedSprite.play("run")
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
			$AnimatedSprite.flip_h = true
			if on_ground == true:
				$AnimatedSprite.play("run")
		else:
			velocity.x = 0
			if on_ground == true:
				$AnimatedSprite.play("idle")
			
		if Input.is_action_pressed("ui_up"):
			if on_ground == true:
				$Jump.play()
				velocity.y = JUMP_POWER			
				on_ground = false
			
		
		
		velocity.y += GRAVITY
		
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
			$AnimatedSprite.play("jump")
		
		velocity = move_and_slide(velocity, FLOOR)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "EnemyPumpkin" in get_slide_collision(i).collider.name:
					dead()
	
		if position.y > 180:
			dead()
	
func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	$AnimatedSprite.play("hurt")
	$CollisionShape2D.disabled = true
	$Die.play()
	GameVariables.lives -= 1
	var LabelNode = get_parent().get_node("ScoreCounter/UI/Control/LivesValue")	
	LabelNode.text = str(GameVariables.lives)
	if GameVariables.lives == 0:
		GameVariables.score = 0		
	$Timer.start()


func _on_Timer_timeout():
	if GameVariables.lives == 0:
		get_tree().change_scene("res://GameOverScene.tscn")
	else:
		get_tree().reload_current_scene()

