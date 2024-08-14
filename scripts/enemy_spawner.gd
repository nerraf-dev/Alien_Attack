extends Node2D


var enemy_scene = preload("res://scenes/enemy.tscn")

func _on_timer_timeout():
	print("Spawn enemy")
	spawn_enemy()


func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.name = "Enemy_%s" % str(enemy.get_instance_id())  # Set a unique name for each enemy
	add_child(enemy)
	enemy.global_position = Vector2(1350, 300)
