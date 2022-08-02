extends Control

onready var mainScene := load("res://Scenes/Main/main.tscn")

func _on_Normal_pressed() -> void:
	Global.difficulty = Global.difficulties.normal
	get_tree().change_scene_to(mainScene)

func _on_Hard_pressed() -> void:
	Global.difficulty = Global.difficulties.hard
	get_tree().change_scene_to(mainScene)

func _on_Extreme_pressed() -> void:
	Global.difficulty = Global.difficulties.extreme
	get_tree().change_scene_to(mainScene)
