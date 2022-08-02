extends Line2D
class_name Trail

export var length := 10
export(NodePath) var targetPath
export var offset := Vector2.ZERO

onready var target := get_node(targetPath)

func _process(delta: float) -> void:
	add_point(target.global_position + offset.rotated(target.rotation))
	while get_point_count() > length:
		remove_point(0)
