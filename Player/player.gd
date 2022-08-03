extends MovingEntity
class_name Player

onready var trail := $Node/Trail
onready var movingSfx := $MovingSFX

var replay := {}
var recording := true
var frames := 0
var prevDir := Vector2.ZERO

func _physics_process(delta: float) -> void:
	dir = _get_dir()
	if recording:
		if prevDir != dir:
			replay[frames] = dir
		frames += 1
	prevDir = dir
	
	if dir != Vector2.ZERO:
		movingSfx.volume_db = lerp(movingSfx.volume_db, -15, 5 * delta)
	else:
		movingSfx.volume_db = lerp(movingSfx.volume_db, -30, 5 * delta)
	
func game_over() -> void:
	AudioManager.play_sound("PlayerHurt")
	get_tree().current_scene.game_over(global_position)
	queue_free()
	
func restart() -> void:
	replay.clear()
	frames = 0
	prevDir = Vector2.ZERO
	
	trail.clear_points()
	global_position = Vector2(160, 90)
	
	recording = true

func _get_dir() -> Vector2:
	var x = sign(Input.get_axis("move_left", "move_right"))
	var y = sign(Input.get_axis("move_up", "move_down"))
	var _dir = Vector2(x, y).normalized()
	return _dir
