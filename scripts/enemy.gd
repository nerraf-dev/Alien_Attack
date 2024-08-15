extends Area2D

signal died

@export var enemy_speed = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Set global position to move the enemy to the left
	global_position.x -= enemy_speed * delta

func die():
	print("Enemy died")
	queue_free()
	emit_signal("died")

func _on_body_entered(body:Node2D):
	print("Enemy collided with ", body.name)
	body.take_damage()
	die()

