extends MovingEntity
class_name Clone

onready var animPlayer := $AnimationPlayer
onready var trail := $Node/Trail

var playing := false
var replay := {}
var frames := 0

func _ready() -> void:
	add_to_group("clone")
	restart()

func restart() -> void:
	animPlayer.play("start")
	frames = 0
	global_position = Vector2(160, 90)
	playing = true
	trail.clear_points()
	
func stop_playing() -> void:
	dir = Vector2.ZERO
	playing = false
	
func _physics_process(delta: float) -> void:
	if playing:
		if replay.has(frames):
			dir = replay[frames]
			
		frames += 1

func _on_Hitbox_area_entered(area: Area2D) -> void:
	var player = area.get_parent()
	player.game_over()
