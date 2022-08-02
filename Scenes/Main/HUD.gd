extends CanvasLayer

onready var scoreLabel := $Control/ScoreLabel

func _physics_process(delta: float) -> void:
	scoreLabel.text = str(Global.points)
