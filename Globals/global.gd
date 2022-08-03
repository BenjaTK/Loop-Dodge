extends Node

const SAVE_PATH := "user://save.dat"

var difficulties := {"n": 10.0, "h": 8.0, "e": 5.0, "me": 2.0}

onready var difficulty := "n"
var discoveredME := false

var points := 0
var highScores := {
	"n": 0,
	"h": 0,
	"e": 0,
	"me": 0
}

func get_high_score() -> void:
	if points > highScores[difficulty]:
		highScores[difficulty] = points
	points = 0

## Guardar y cargar
	
func _enter_tree() -> void:
	load_data()

func save_data():
	var data := {
		"highScores": highScores,
		"discoveredME": discoveredME
	}
	
	var file = File.new()
	var error = file.open_encrypted_with_pass(SAVE_PATH, File.WRITE, "R4wdyXJw8eXcUnXrYuWe8")
	if error == OK:
		file.store_var(data)
		file.close()
		
func load_data():
	var file = File.new()
	if file.file_exists(SAVE_PATH):
		var error = file.open_encrypted_with_pass(SAVE_PATH, File.READ, "R4wdyXJw8eXcUnXrYuWe8")
		if error == OK:
			var data = file.get_var()
			highScores = data.highScores
			discoveredME = data.discoveredME
			file.close()
