extends Control

onready var mainScene := load("res://Scenes/Main/main.tscn")
onready var mainMenuScene := load("res://Scenes/MainMenu/main_menu.tscn")

onready var restartButton := $Buttons/Restart
onready var scoreLabel := $Scores/Score
onready var highScoreLabel := $Scores/HighScore

func _ready() -> void:
	restartButton.grab_focus()
	
	scoreLabel.text = "SCORE: " + str(Global.points)
	Global.get_high_score()
	highScoreLabel.text = "HIGH SCORE: " + str(Global.highScore)
	
func _on_Restart_pressed() -> void:
	get_tree().change_scene_to(mainScene)

func _on_MainMenu_pressed() -> void:
	get_tree().change_scene_to(mainMenuScene)
	
