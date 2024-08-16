extends CharacterBody2D

@onready var shot_fired = $Shoot

signal took_damage

var speed = 300
var bullet_scene = preload("res://scenes/bullet.tscn")

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	
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

func shoot():
	var bullet = bullet_scene.instantiate()
	# bullet.name = "Bullet_%s" % str(bullet.get_instance_id())  # Set a unique name for each bullet
	get_parent().add_child(bullet)
	shot_fired.play()
	bullet.global_position = global_position
	bullet.global_position.x += 75

func take_damage():
	print("Player took damage")
	emit_signal("took_damage")

func die():
	print("Player died!")
	queue_free()
