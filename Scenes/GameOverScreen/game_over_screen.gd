extends Control

onready var mainScene := load("res://Scenes/Main/main.tscn")
onready var mainMenuScene := load("res://Scenes/MainMenu/main_menu.tscn")

onready var restartButton := $Buttons/Restart
onready var scoreLabel := $Scores/Score
onready var highScoreLabel := $Scores/HighScore
onready var difficultyLabel := $Scores/Difficulty

func _ready() -> void:
	restartButton.grab_focus()
	
	scoreLabel.text = "SC: " + str(Global.points)
	Global.get_high_score()
	highScoreLabel.text = "HI. SC: " + str(Global.highScore)
	var difficulties = Global.difficulties.keys()
	var idx = Global.difficulties.values().find(Global.difficulty)

	difficultyLabel.text = "DIFF: " + difficulties[idx][0]
	
func _on_Restart_pressed() -> void:
	get_tree().change_scene_to(mainScene)

func _on_MainMenu_pressed() -> void:
	get_tree().change_scene_to(mainMenuScene)
	
