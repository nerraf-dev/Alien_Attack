extends Area2D

@export var speed = 5	# Speed of the rocket, exported to the editor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# The rocket will move to the right at the speed of 'speed' pixels per second
	# The 'delta' variable is the time elapsed since the last frame
	# Multiply 'speed' by 'delta' to make the movement frame-rate independent
	global_position.x += speed * delta 

