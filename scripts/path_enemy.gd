extends Path2D


@onready var path = $PathFollow
@onready var enemy = $PathFollow/Enemy

func _ready():
	path.set_progress_ratio(0)

func _process(delta):
	path.progress_ratio += delta * 0.5
	if path.progress_ratio >= 1:
		queue_free()