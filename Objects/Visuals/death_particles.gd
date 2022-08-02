extends Particles2D

onready var tween := $Tween

func _ready() -> void:
	Engine.time_scale = 0.5
	tween.interpolate_property(Engine, "time_scale", 0.5, 1.0, .25, Tween.TRANS_EXPO, Tween.EASE_IN)
	tween.start()

