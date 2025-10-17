extends Node2D
class_name PlayerAttackComponent

@export var player_sprite: AnimatedSprite2D


func _ready() -> void:
	await get_parent().ready


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		player_sprite.attack()
	if event.is_action_pressed("debug"):
		var msg: MessageBox = MessageBox.build()
		msg.open()
