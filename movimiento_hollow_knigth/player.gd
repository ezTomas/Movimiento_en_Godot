extends CharacterBody2D

var speed = 200
var speed_salto = 600
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var saltos_maximos = 2
var saltos_hechos = 0

func _physics_process(delta):
	var movimientoHorizontal = Input.get_axis("move_left","move_right") 
	velocity.x = movimientoHorizontal * speed
	
	if is_on_floor():
		saltos_hechos = 0
		if Input.is_action_just_pressed("jump"):
			velocity.y -= speed_salto
			saltos_hechos += 1
		
	else:
		if Input.is_action_just_pressed("jump") and saltos_hechos < saltos_maximos:
			velocity.y -= speed_salto
			saltos_hechos += 1
	
	
	velocity.y += gravity * delta
	is_on_floor()
	move_and_slide()
	
