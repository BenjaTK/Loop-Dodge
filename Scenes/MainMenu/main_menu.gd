extends Control

onready var normalButton := $Buttons/Normal

func _ready() -> void:
	normalButton.grab_focus()
