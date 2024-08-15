extends Node2D

signal enemy_spawned(enemy)

var enemy_scene = preload("res://scenes/enemy.tscn")

# create "random" spawn positions
@onready var spawn_positions = $SpawnPositions.get_children()

func _on_timer_timeout():
	print("Spawn enemy")
	spawn_enemy()


func spawn_enemy():
	
	var enemy = enemy_scene.instantiate()
	var random_pos = spawn_positions.pick_random()
	# print(random_pos.name)
	# enemy.name = "Enemy_%s" % str(enemy.get_instance_id())  # Set a unique name for each enemy
	enemy.global_position = random_pos.global_position
	emit_signal("enemy_spawned", enemy)
	add_child(enemy)
