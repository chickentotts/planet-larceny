extends KinematicBody2D

var score : int = 0
var speed : int = 200
var jumpforce : int = 350
var gravity : int = 1100

var vel : Vector2 = Vector2()

onready var AnimatedSprite = get_node("AnimatedSprite")

func _physics_process(delta):
	
	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		
		
	vel = move_and_slide(vel,Vector2.UP)
	
	vel.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpforce
	
func _process(_delta):
		if Input.is_action_pressed("move_right"):
			AnimatedSprite.play("run")
			
		elif Input.is_action_pressed("move_left"):
			AnimatedSprite.play("left")
		else:
			AnimatedSprite.play("stop")
