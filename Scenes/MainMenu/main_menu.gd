extends Control

onready var difficultySelectScene := load("res://Scenes/DifficultySelect/difficulty_select.tscn")
onready var mainScene := load("res://Scenes/Main/main.tscn")

onready var normalButton := $Buttons/Normal

func _ready() -> void:
	normalButton.grab_focus()

func _on_Normal_pressed() -> void:
	Global.difficulty = Global.difficulties.normal
	get_tree().change_scene_to(mainScene)

func _on_Hard_pressed() -> void:
	Global.difficulty = Global.difficulties.hard
	get_tree().change_scene_to(mainScene)

func _on_Extreme_pressed() -> void:
	Global.difficulty = Global.difficulties.extreme
	get_tree().change_scene_to(mainScene)
