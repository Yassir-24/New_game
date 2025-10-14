extends Node2D
class_name PlayerMovementComponent


const BASE_SPEED: int = 250
var speed_mult: float = 1.0
var direction: Vector2
var previous_direction: Vector2


# Dash
var is_dashing: bool = false
var can_dash: bool = true
const DASH_DURATION: float = 0.3
const DASH_COOLDOWN: float = 2
const GHOST_SPRITE_COUNT: int = 10

@export var player_sprite: AnimatedSprite2D



func _ready() -> void:
	await get_parent().ready



func movement() -> void:
	
	direction = Input.get_vector("left", "right", "up", "down")
	player_sprite.move(direction)

	if not is_dashing:
		get_parent().velocity = direction * (BASE_SPEED * speed_mult)
	
	if Input.is_action_just_pressed("dash") and can_dash and direction != Vector2.ZERO:
			dash()
	get_parent().move_and_slide()



func dash() -> void:
	create_shadow()
	is_dashing = true
	can_dash = false
	get_parent().velocity = direction * (BASE_SPEED * speed_mult) * 2
	
	get_tree().create_timer(DASH_DURATION).timeout.connect(func() -> void:
		is_dashing = false
	)

	get_tree().create_timer(DASH_COOLDOWN).timeout.connect(func() -> void:
		can_dash = true
	)



func create_shadow() -> void:
	for i in range(1, GHOST_SPRITE_COUNT):
		var ghost: AnimatedSprite2D = player_sprite.duplicate()
		Linker.world.add_child(ghost)
		ghost.play(player_sprite.animation)
		ghost.global_position = player_sprite.global_position
		ghost.modulate.a = 0.3
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(ghost, "modulate:a", 0.0, 0.3)
		tween.finished.connect(func() -> void: ghost.queue_free())
		await get_tree().create_timer(DASH_DURATION/GHOST_SPRITE_COUNT).timeout



func _physics_process(delta: float) -> void:
	movement()
