extends Node2D

@onready var player = $Player
@onready var hud = $UI/HUD


var player_lives = 3
var score = 0

func _ready():
	hud.set_score(score)
	# player.connect("took_damage", _on_player_took_damage)
	# $EnemySpawner.connect("enemy_spawned", _on_enemy_spawner_enemy_spawned)
	# $DeathZone.connect("area_entered", _on_death_zone_area_entered)

func _on_death_zone_area_entered(area:Area2D):
	print("Enemy entered death zone")
	print("Enemy: ", area.name)
	area.queue_free()

func _on_enemy_spawner_enemy_spawned(enemy:Variant):
	enemy.connect("died", on_enemy_died)
	# add_child(enemy)

func on_enemy_died():
	score += 100
	hud.set_score(score)
	print("Score: ", score)

func _on_player_took_damage():
	player_lives -= 1
	if player_lives == 0:
		player.die()
		print("Game Over!!")
	else:
		print("Player lives: ", player_lives)



