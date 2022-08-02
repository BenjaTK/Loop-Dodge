extends Control

onready var difficultySelectScene := load("res://Scenes/DifficultySelect/difficulty_select.tscn")

onready var playButton := $Buttons/Play

func _ready() -> void:
	playButton.grab_focus()

func _on_Play_pressed() -> void:
	get_tree().change_scene_to(difficultySelectScene)

func _on_Options_pressed() -> void:
	pass # Replace with function body.


func _on_Exit_pressed() -> void:
	get_tree().quit()
