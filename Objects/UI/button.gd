extends Button

func _ready() -> void:
	connect("mouse_entered", self, "_on_hover")
	
func _on_hover() -> void:
	grab_focus()
