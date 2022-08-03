extends CustomButton
class_name DifficultySelectButton

onready var mainScene := load("res://Scenes/Main/main.tscn")

export(String, "n", "h", "e", "me") var difficulty := "n"

func _on_pressed() -> void:
	Global.difficulty = difficulty
	get_tree().change_scene_to(mainScene)
	._on_pressed()
