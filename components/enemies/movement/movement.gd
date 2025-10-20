extends Node
class_name EnemyMovementComponent

const SPEED: int = 100
var speed_multiplier: float = 1.

var is_chasing_player: bool = false
var parent: CharacterBody2D

func _ready() -> void:
	await get_parent().ready
	parent = get_parent()


func move_toward_player() -> void:
	# TODO: Optimize
	if not is_chasing_player:
		return
	var target: Vector2 = Linker.player.global_position - parent.global_position
	var direction: Vector2 = target.normalized()
	
	if abs(target.x) < 10 and abs(target.y) < 10:
		return
	
	parent.velocity = direction * SPEED * speed_multiplier
	parent.move_and_slide()

func _physics_process(_delta: float) -> void:
	move_toward_player()
