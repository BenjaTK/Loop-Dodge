extends Node

const AUDIO_PATH = "res://Assets/Audio/"

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	
func play_sound(nodeName: String) -> void:
	var audioStreamPlayer: AudioStreamPlayer = get_node(nodeName)
	audioStreamPlayer.play()
	
func play_random_sound(nodeName: String, sounds: Array) -> void:
	var randomIdx = rng.randi_range(0, sounds.size() - 1)
	var randomSound = sounds[randomIdx]
	
	var audioStreamPlayer: AudioStreamPlayer = get_node(nodeName)
	audioStreamPlayer.stream.audio_stream = load(AUDIO_PATH + randomSound)
	audioStreamPlayer.play()
