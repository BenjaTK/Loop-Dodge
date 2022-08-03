extends Node

var difficulties := {"normal": 10.0, "hard": 8.0, "extreme": 5.0}

onready var difficulty = difficulties.extreme

var points := 0
var highScore := 0

func get_high_score() -> void:
	if points > highScore:
		highScore = points
	points = 0
