extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_death_zone_area_entered(area:Area2D):
	print("Enemy entered death zone")
	print("Enemy: ", area.name)
	area.die()