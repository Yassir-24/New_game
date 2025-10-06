extends Node2D
class_name PlayerAttackComponent

@export var player_sprite: AnimatedSprite2D
@onready var attack_area_component: Area2D = $"../AttackAreaComponent"
@onready var attack_range_component: CollisionShape2D = $AttackRangeComponent
signal enable_collision

func _ready() -> void:
	await get_parent().ready

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		enable_collision.emit()
		#print("TEST1")
		player_sprite.attack()
		#print("TEST2")
