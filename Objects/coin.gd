extends Area2D

onready var collectParticlesScene := load("res://Objects/Visuals/coin_collect_particles.tscn")

onready var animPlayer := $AnimationPlayer

var rng := RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	global_position = _random_pos()
		
func _random_pos() -> Vector2:
	var pos := Vector2(rng.randi_range(10, 310), rng.randi_range(10, 170))
	return pos

func _on_Coin_area_entered(area: Area2D) -> void:
	animPlayer.play("collected")
	AudioManager.play_random_sound("Coin", ["coin1.wav", "coin2.wav", "coin3.wav"])
	
	yield(animPlayer, "animation_finished")
	
	get_tree().current_scene.camera.add_trauma(0.25, 1.0)
	var collectParticles = collectParticlesScene.instance()
	collectParticles.global_position = global_position
	get_tree().current_scene.add_child(collectParticles)
	
	Global.points += 10
	global_position = _random_pos()
