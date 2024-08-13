extends CharacterBody2D



func _physics_process(delta):
	var speed = 250
	var screen_size = get_viewport().get_visible_rect().size
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed

	move_and_slide()

	# Clamp the player's position to the screen using IFs
	# This is the long way to do it
	# if global_position.x < 0:
	# 	global_position.x = 0
	# if global_position.x > screen_size.x:
	# 	global_position.x = screen_size.x
	# if global_position.y < 0:
	# 	global_position.y = 0
	# if global_position.y > screen_size.y:
	# 	global_position.y = screen_size.y

	# Clamp the player's position to the screen
	# This replaces all the if statements above
	# global_position.x = clampf(global_position.x, 0, screen_size.x)
	# global_position.y = clampf(global_position.y, 0, screen_size.y)

	# Clamp the player's position to the screen using a Vector2
	# This replaces all statements above
	global_position = global_position.clamp(Vector2(0,0), screen_size)