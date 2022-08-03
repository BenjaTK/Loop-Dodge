extends Node2D

onready var cloneScene := load("res://Clone/clone.tscn")
onready var deathParticlesScene := load("res://Objects/Visuals/death_particles.tscn")

onready var player := $Player
onready var loopTimer := $LoopTimer
onready var animPlayer = $HUD/AnimationPlayer
onready var tween := $Tween
onready var camera := $Camera2D

var playing := true
var loop := 1

func _ready() -> void:
	loopTimer.wait_time = Global.difficulties[Global.difficulty]
	print(loopTimer.wait_time)
	loopTimer.start()

func _physics_process(delta: float) -> void:
	if loopTimer.time_left - 1.5 < 0.0001 && !animPlayer.is_playing():
		animPlayer.play("countdown")
		
func _on_LoopTimer_timeout() -> void:
	if playing:
		_new_loop()
	
func _new_loop():
	if !playing:
		return
		
	loop += 1
	
	player.recording = false
	animPlayer.play("next_loop")
	
	yield(animPlayer, "animation_finished")
	if !playing:
		return
	
	get_tree().call_group("clone", "stop_playing")
	_create_clone(player.replay.duplicate())
	
	player.restart()
	get_tree().call_group("clone", "restart")
	
	loopTimer.start()
	
func _create_clone(replay: Dictionary) -> void:
	var clone = cloneScene.instance()
	clone.replay = replay
	add_child(clone)

func game_over(playerPos: Vector2) -> void:
	loopTimer.paused = true
	playing = false
	
	var deathParticles = deathParticlesScene.instance()
	deathParticles.global_position = playerPos
	get_tree().current_scene.add_child(deathParticles)
	
	tween.interpolate_property(camera, "position", camera.position, playerPos, .75, Tween.TRANS_QUINT, Tween.EASE_IN)
	tween.interpolate_property(camera, "zoom", camera.zoom, Vector2(0.5, 0.5), .75, Tween.TRANS_QUINT, Tween.EASE_IN)
	tween.start()
	
	camera.add_trauma(0.5, 0.7)
	
	yield(get_tree().create_timer(1.5), "timeout")
	get_tree().change_scene("res://Scenes/GameOverScreen/game_over_screen.tscn")
