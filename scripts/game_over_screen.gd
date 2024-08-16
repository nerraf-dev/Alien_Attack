extends Control

func _on_retry_pressed():
	print("Retry pressed")
	get_tree().reload_current_scene()
	
func set_score(new_score:int):
	$Panel/Score.text = str(new_score)