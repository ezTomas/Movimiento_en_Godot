extends CharacterBody2D

var speed = 200
var speed_salto = 500
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var movimientoHorizontal = Input.get_axis("move_left","move_right") 
	velocity.x = movimientoHorizontal * speed
	
	if Input.is_action_just_pressed("jump"):
		velocity.y -= speed_salto
	
	velocity.y += gravity * delta
	
	move_and_slide()
	
