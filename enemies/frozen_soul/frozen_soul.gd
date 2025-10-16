extends CharacterBody2D


@onready var player: Player = $"../Player"

@onready var sprite_component: AnimatedSprite2D = $SpriteComponent

var start_following := false
const SPEED = 100


func move_to_player():
	if start_following:
		var target_position : Vector2 = player.global_position - global_position
		var direction : Vector2 = target_position.normalized()
		if target_position.length() > 10:
			velocity = direction * SPEED
		else:
			velocity = Vector2.ZERO
		move_and_slide()

func _physics_process(delta: float) -> void:
	move_to_player()
