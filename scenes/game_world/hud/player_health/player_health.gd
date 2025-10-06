extends ProgressBar
class_name PlayerHealth

var _health: int
var health: int:
	get:
		return _health
	set(value):
		_health = clamp(value, 0, 100)
		self.value = _health

func _ready() -> void:
	health = 100
