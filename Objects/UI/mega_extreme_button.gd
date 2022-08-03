extends DifficultySelectButton

onready var tween := $Tween
onready var animPlayer := $AnimationPlayer
onready var cam := get_tree().current_scene.get_node("ShakeCam")

var focused := false

func _ready() -> void:
	modulate = Color.transparent
	if Global.discoveredME:
		modulate = Color.white
		
func _physics_process(delta: float) -> void:
	if focused:
		cam.add_trauma(0.2, 1.0)

func _on_pressed() -> void:
	if !Global.discoveredME:
		Global.discoveredME = true
		
		tween.interpolate_property(self, "modulate", Color.transparent, Color.white, 0.2, Tween.TRANS_EXPO, Tween.EASE_IN)
		tween.start()
		
		AudioManager.play_sound("MEDiscovered")
		
		_on_MegaExtreme_focus_entered()
		
		Global.save_data()
		return
	
	._on_pressed()

func _on_MegaExtreme_focus_entered() -> void:
	if Global.discoveredME:
		focused = true
		animPlayer.play("EXTREME")

func _on_MegaExtreme_focus_exited() -> void:
	if Global.discoveredME:
		focused = false
		animPlayer.play("RESET")
