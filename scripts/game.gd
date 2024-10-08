extends Node2D

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var enemy_hit = $EnemyHit
@onready var explode = $Explode

var game_over_screen = preload("res://scenes/game_over_screen.tscn")
var player_lives = 3
var score = 0

func _ready():
	hud.set_score(score)
	hud.set_lives(player_lives)
	# player.connect("took_damage", _on_player_took_damage)
	# $EnemySpawner.connect("enemy_spawned", _on_enemy_spawner_enemy_spawned)
	# $DeathZone.connect("area_entered", _on_death_zone_area_entered)

# Enemy off-screen deathzone
func _on_death_zone_area_entered(area:Area2D):
	area.queue_free()

# Player took damage
func _on_player_took_damage():
	explode.play()
	player_lives -= 1
	hud.set_lives(player_lives)
	if player_lives == 0:
		player.die()
		print("Game Over!!")
		await(get_tree().create_timer(0.5).timeout)
		var game_over = game_over_screen.instantiate()
		print("score: ", score)
		game_over.set_score(score)
		ui.add_child(game_over)


func _on_enemy_spawner_enemy_spawned(enemy:Variant):
	enemy.connect("died", on_enemy_died)
	# add_child(enemy)

func on_enemy_died():
	score += 100
	hud.set_score(score)
	enemy_hit.play()
	print("Score: ", score)


func _on_enemy_spawner_path_enemy_spawned(path_enemy:Variant):
	# Add child first before connecting signals
	# This is because the path_enemy will emit a signal when it dies
	# and we want to connect to that signal before it is emitted
	add_child(path_enemy)
	path_enemy.enemy.connect("died", on_enemy_died)
