extends Area2D

var speed = 700	# Speed of the rocket, exported to the editor

@onready var visible_notifier = $VisibleNotifier

func _ready():
	# Connect the 'screen_exited' signal to the 'on_screen_exited' method
	visible_notifier.connect("screen_exited", _on_screen_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# The rocket will move to the right at the speed of 'speed' pixels per second
	# The 'delta' variable is the time elapsed since the last frame
	# Multiply 'speed' by 'delta' to make the movement frame-rate independent
	if speed == null:
		print("speed is null")
		return
	if delta == null:
		print("delta is null")
		return
	# print("global_position.x: ", global_position.x)
	global_position.x += speed * delta 



func _on_screen_exited():
	# When the rocket exits the screen, remove it from the scene
	queue_free()

func _on_area_entered(area:Area2D):
	print("Rocket collided with ", area.name)
	queue_free()
	area.die()