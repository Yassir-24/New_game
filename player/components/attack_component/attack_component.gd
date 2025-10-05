extends Node2D
class_name PlayerAttackComponent

@export var player_sprite: AnimatedSprite2D


func _ready() -> void:
	await get_parent().ready


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		print("TEST1")
		player_sprite.attack()
		print("TEST2")
