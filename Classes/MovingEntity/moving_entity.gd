extends KinematicBody2D
class_name MovingEntity

const SPEED := 125
const ACCEL := 0.5
const FRICTION := 0.2

onready var sprite := $Sprite

var dir := Vector2.ZERO
var vel := Vector2.ZERO
	
func _physics_process(delta: float) -> void:
	vel = move_and_slide(vel)
	_move(delta)
	if dir != Vector2.ZERO:
		rotation = lerp_angle(rotation, dir.angle(), 15 * delta)
		sprite.scale = lerp(sprite.scale, Vector2(1.15, .85), 10 * delta)
	else:
		sprite.scale = lerp(sprite.scale, Vector2(1, 1), 15 * delta)
	
func _move(delta: float) -> void:
	vel.x = lerp(vel.x, dir.x * SPEED, ACCEL if dir.x != 0 else FRICTION)
	vel.y = lerp(vel.y, dir.y * SPEED, ACCEL if dir.y != 0 else FRICTION)
