extends Node2D
class_name PlayerAttackComponent

@export var player_sprite: AnimatedSprite2D
signal deal_damage

func _ready() -> void:
	await get_parent().ready


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		deal_damage.emit()
		player_sprite.attack()
