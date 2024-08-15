extends Control

@onready var score = $Score

func set_score(new_score:int):
	score.text = "SCORE: %s" % str(new_score)