extends Control

@onready var score = $Score
@onready var lives = $Lives

func set_score(new_score:int):
	score.text = "SCORE: %s" % str(new_score)

func set_lives(new_lives:int):
	lives.text = str(new_lives)