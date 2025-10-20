extends Area2D
class_name InteractArea

const OFFSET: int = 16
var _direction := Vector2.ZERO

var direction: Vector2:
	set(value):
		if value != _direction:
			_direction = value
			change_direction()
	get:
		return _direction

func change_direction() -> void:
	if _direction.x != 0 or _direction.y != 0:
		position = _direction.normalized() * OFFSET

#func _ready() -> void:
	#monitoring = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		for area: Area2D in get_overlapping_areas():
			if area is Interactable:
				area.interact()
				break
