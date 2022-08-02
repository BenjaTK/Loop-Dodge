extends Camera2D
class_name ShakeCam

export var decay := 0.8  # How quickly the shaking stops [0, 1].
export var maxOffset := Vector2(100, 75)  # Maximum hor/ver shake in pixels.
export var maxRoll := 0.1  # Maximum rotation in radians (use sparingly).

var trauma := 0.0  # Current shake strength.
var traumaPower := 2.0  # Trauma exponent. Use [2, 3].

onready var noise := OpenSimplexNoise.new()
var noiseY := 0

func _ready():
	randomize()
	noise.seed = randi()
	noise.period = 4
	noise.octaves = 2

func add_trauma(amount: float, decayTime: float) -> void: # What gets called to start shaking. Amount between 0 and 1
	decay = decayTime
	trauma = min(amount, 1.0)

func _process(delta: float) -> void:
	if trauma != null:
		trauma = max(trauma - decay * delta, 0)
		_shake()

func _shake() -> void:
	var amount := pow(trauma, traumaPower)
	noiseY += 1
	rotation = maxRoll * amount * noise.get_noise_2d(noise.seed, noiseY)
	offset.x = maxOffset.x * amount * noise.get_noise_2d(noise.seed * 2, noiseY)
	offset.y = maxOffset.y * amount * noise.get_noise_2d(noise.seed * 3, noiseY)
