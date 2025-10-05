extends Node2D
# Movement
const BASE_SPEED: int = 10000
var speed_mult: float = 1.0
var direction: Vector2
var previous_direction: Vector2

@export var player_sprite: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_parent().ready


func movement(delta) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	player_sprite.move(direction)
	get_parent().velocity = direction * (BASE_SPEED * speed_mult) * delta
	get_parent().move_and_slide()


func _physics_process(delta: float) -> void:
	movement(delta)
