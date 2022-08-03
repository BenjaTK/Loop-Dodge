extends Button

func _ready() -> void:
	connect("mouse_entered", self, "_on_hover")
	connect("pressed", self, "_on_pressed")
	
func _on_hover() -> void:
	grab_focus()
	
func _on_pressed() -> void:
	AudioManager.play_random_sound("Select", ["select1.wav", "select2.wav", "select3.wav"])
