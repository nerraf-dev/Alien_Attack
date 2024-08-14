extends Area2D

@export var enemy_speed = 250

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Set global position to move the enemy to the left
	global_position.x -= enemy_speed * delta