extends Control
class_name HealthComponent

@onready var progress_bar: ProgressBar = $ProgressBar

var _health: int
var health:
	get:
		return _health
	set(value):
		_health = clamp(value, 0, 100)
		progress_bar.value = _health
		if _health == 0: death()

func death() -> void:
	get_tree().quit()

func _ready() -> void:
	await get_parent().ready
	health = 100
