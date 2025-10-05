extends AnimatedSprite2D


# Initialisito l Vector2.DOWN bach matkonch chi probleme
var previous_direction: Vector2 = Vector2.DOWN
var is_moving: bool = true

func _ready() -> void:
	await get_parent().ready


func move(direction: Vector2) -> void:
	if not is_moving:
		return
	else:
		match direction:
			Vector2.UP:
				play("run_up")
				previous_direction = Vector2.UP
			Vector2.DOWN:
				play("run_down")
				previous_direction = Vector2.DOWN
			Vector2.LEFT:
				play("run_left")
				previous_direction = Vector2.LEFT
			Vector2.RIGHT:
				play("run_right")
				previous_direction = Vector2.RIGHT
			_:
				if direction == Vector2.ZERO:
					match previous_direction:
						Vector2.UP:
							play("idle_up")
						Vector2.DOWN:
							play("idle_down")
						Vector2.LEFT:
							play("idle_left")
						Vector2.RIGHT:
							play("idle_right")
				else:
					pass


func attack():
	is_moving = false
	match previous_direction:
		Vector2.UP:
			play("attack_up")
			await animation_finished
			is_moving = true
		Vector2.DOWN:
			play("attack_down")
			await animation_finished
			is_moving = true
		Vector2.LEFT:
			play("attack_left")
			await animation_finished
			is_moving = true
		Vector2.RIGHT:
			play("attack_right")
			await animation_finished
			is_moving = true
		_:
			pass
